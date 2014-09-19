from django.conf.urls import patterns, include, url
from BIOSH.view import  config_admin,program_admin, login_index,\
   delete_user,edit_user,query_user,execute_program,see_program,delete_program,category_program,\
    add_user,new_program,new_user,log_out,editSelectedUser,my_user,organizacion_Program,\
    organizacion_SubCategoriaProgram,argumentIn_program,argumentOut_program,organizacion_argumentoProgram
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from _codecs import register
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'BIOSH.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^biosh/configuracion$',config_admin),
    url(r'^biosh/organizarProgram',organizacion_Program),
    url(r'^biosh/organizarSubCategoriaProgram',organizacion_SubCategoriaProgram),
    url(r'^biosh/argumentosProgram',organizacion_argumentoProgram),
    
    url(r'^biosh/programa$',program_admin),
    url(r'^biosh/index$',program_admin),
    url(r'^biosh/login$',login_index),
    
    
    
    url(r'^biosh/programa/newProgram$',new_program),
    url(r'^biosh/programa/executeProgram$',execute_program),
    url(r'^biosh/programa/seeProgram$',see_program),
    url(r'^biosh/programa/deleteProgram$',delete_program),
    url(r'^biosh/programa/categoryProgram$',category_program),
    url(r'^biosh/programa/argumentIn$',argumentIn_program),
     url(r'^biosh/programa/argumentOut$',argumentOut_program),
    url(r'^biosh/cerrarSesion',log_out),
    url(r'^biosh/altaUser',add_user),
    #url(r'^biosh/recovery_password',recoveryPassword),
    
    url(r'^biosh/configuracion/newUser',new_user),
    url(r'^biosh/configuracion/editUser/editSelectedUser',editSelectedUser),
    url(r'^biosh/configuracion/deleteUser',delete_user),
    url(r'^biosh/configuracion/editUser',edit_user), 
    url(r'^biosh/configuracion/myUser',my_user), 
    url(r'^biosh/configuracion/consultaUser',query_user),
    
     url(r'^biosh/configuracion/myUserExperto',my_user),
    
)+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
