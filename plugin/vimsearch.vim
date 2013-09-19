"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  VimSearch Vim PLugin
""  @github http://github.com/yasaricli/VimSearch
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
        echomsg "VimSearch Error ::: ".a:msg
        echohl NONE
    endfunction    


    "" functions are used for each function.
    function! l:search_viewer.fsgrep(type, name) dict
   

        "" if not g:search_path variable in .vimrc  WarningMsg
        if !exists("g:search_path") 

            call self.warning(".vimrc file _search_path added a  folder, you have to be.")

        "" WarningMsg not directory    
        elseif !isdirectory(g:search_path)

            call self.warning("Error  path")
            call self.warning("See and control path: ".g:search_path)

        "" Execute Command     
        else
            execute 'Fsgrep /'.a:type.' '.a:name.'/python, '.g:search_path.'/**'
        endif
    endfunction


    ""  folder within the Class searches
    "" @call search#FsgrepBase
    function! l:search_viewer._class(classname) dict
       
       call self.fsgrep('class', a:classname) 
    endfunction
    
    
    ""  folder with in the Function searches
    "" @call search#FsgrepBase
    function! l:search_viewer._def(defname) 
    
        call self.fsgrep('def', a:defname) 
    endfunction


    "" Key up search word class or 
    "" Objects in the self.fsgrep calling a function called 
    """ runs. and the selected one call.
    function! l:search_viewer.word_search(type) dict
        let g:word = expand("<cword>")

        call self.fsgrep(a:type, g:word)
    endfunction


    "" New Object dict
    return l:search_viewer
endfunction


"" variable _search is Object New NewSearch..
let s:_search = s:NewSearch()


""  Class and Def Search Commands
command! -bar -complete=file -bang -nargs=1 SearchClass   :call s:_search._class(<q-args>)
command! -bar -complete=file -bang -nargs=1 SearchDef     :call s:_search._def(<q-args>)


"" -bar :WordSearch def --> search cursor def line.
command! -bar -complete=file -bang -nargs=1 WordSearch     :call s:_search.word_search(<q-args>)


"" KEYUP { CTRL + d } search selected cursor def
"" KEYUP { CTRL + c } search selected cursor class
"" Let's start right now :)

"" { CTRL + d }
nnoremap <silent> <C-d> :WordSearch def<CR>

"" { CTRL + c }
nnoremap <silent> <C-c> :WordSearch class<CR>
