"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  DjangoSearch Vim PLugin
""  @github http://github.com/yasaricli/vim-djangosearch
""
""  Copyright 2013 Yaşar İÇLİ
""
""  ### Plugins ### 
""
""  -- vim-filesearch @gitHub http://github.com/jeetsukumaran/vim-filesearch
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""
""
"" NewSearch Object
""
function! s:NewSearch()
    
    " initialize
    let l:search_viewer = {}


    "" Warning messages vim -bar
    function! l:search_viewer.warning(msg) dict

        echohl WarningMsg
        echomsg "DjangoSearch Error ::: ".a:msg
        echohl NONE
    endfunction    


    "" functions are used for each function.
    function! l:search_viewer.fsgrep(type, name) dict
   

        "" if not g:djangosearch_path variable in .vimrc  WarningMsg
        if !exists("g:djangosearch_path") 

            call self.warning(".vimrc file django_search_path added a django folder, you have to be.")

        "" WarningMsg not directory    
        elseif !isdirectory(g:djangosearch_path)

            call self.warning("Error django path")
            call self.warning("See and control path: ".g:djangosearch_path)

        "" Execute Command     
        else
            execute 'Fsgrep /'.a:type.' '.a:name.'/python, '.g:djangosearch_path.'/**'
        endif
    endfunction


    "" Django folder within the Class searches
    "" @call djangosearch#FsgrepBase
    function! l:search_viewer.django_class(classname) dict
       
       call self.fsgrep('class', a:classname) 
    endfunction
    
    
    "" Django folder with in the Function searches
    "" @call djangosearch#FsgrepBase
    function! l:search_viewer.django_def(defname) 
    
        call self.fsgrep('def', a:defname) 
    endfunction


    "" Key up search word class or 
    "" Objects in the self.fsgrep calling a function called 
    """ runs. and the selected one call.
    function! l:search_viewer.word_search(type) dict
        let g:word = expand("<cword>")


        call self.fsgrep("class", g:word)
    endfunction


    "" New Object dict
    return l:search_viewer
endfunction


"" variable _search is Object New NewSearch..
let s:_search = s:NewSearch()


"" Django Class and Def Search Commands
command! -bar -complete=file -bang -nargs=1 DjangoClass   :call s:_search.django_class(<q-args>)
command! -bar -complete=file -bang -nargs=1 DjangoDef     :call s:_search.django_def(<q-args>)


"" -bar :DjangoWordSearch def --> search cursor def line.
command! -bar -complete=file -bang -nargs=1 DjangoWordSearch     :call s:_search.word_search(<q-args>)


"" KEYUP { CTRL + d } search selected cursor def
"" KEYUP { CTRL + c } search selected cursor class
"" Let's start right now :)

"" { CTRL + d }
nnoremap <silent> <C-d> :DjangoWordSearch('def')<CR>

"" { CTRL + c }
nnoremap <silent> <C-c> :DjangoWordSearch('class')<CR>
