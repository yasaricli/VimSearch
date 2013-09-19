ViewSearch
============

"search" folder in the instructions you need to make a call. Sample commands `:SearchClass {classname}` and 
`:SearchDef {functionname}`.


Installation
------------

Add this to your ~/.vimrc
> let g:search_path = '/home'


~/.vim directory add:

`autoload/filesearch.vim` 

`plugin/vimsearch.vim`

`plugin/filesearch.vim`



Runtime
------------

`:SearchClass User` and cursor keyboard shortcuts `CTRL + c`

    django/conf/__init__.py       
        138: class UserSettingsHolder(BaseSettings):
    django/contrib/auth/admin.py  
         36: class UserAdmin(admin.ModelAdmin):
    django/contrib/auth/forms.py
         56: class UserCreationForm(forms.ModelForm):                               
        108: class UserChangeForm(forms.ModelForm):                                 
    django/contrib/auth/models.py 
        130: class UserManager(models.Manager):                                     
        225: class User(models.Model):                                              
    django/contrib/auth/tests/forms.py
         15: class UserCreationFormTest(TestCase):                                  
        212: class UserChangeFormTest(TestCase):                                    
    django/contrib/auth/tests/models.py
         81: class UserManagerTestCase(TestCase):                                   
    django/contrib/formtools/tests/wizard/forms.py
         45: class UserForm(forms.ModelForm):                                       
    django/contrib/formtools/tests/wizard/wizardtests/forms.py
         55: class UserForm(forms.ModelForm):                                       
    django/contrib/gis/geos/tests/test_mutable_list.py
         10: class UserListA(ListMixin):                                            
     35: class UserListB(UserListA):
     
     
     
`:SearchDef filter` and cursor keyboard shortcuts `CTRL + d`

                                                                
    django/db/models/manager.py 
        142:     def filter(self, *args, **kwargs):                                 
    django/db/models/query.py     
        616:     def filter(self, *args, **kwargs):                                 
       1153:     def filter(self, *args, **kwargs):                                 
    django/template/base.py       
       1061:     def filter(self, name=None, filter_func=None, **flags):            
       1095:     def filter_function(self, func, **flags):                          
    django/utils/log.py           
         97:     def filter(self, record):                                          
        104:     def filter(self, record): 
         
    
