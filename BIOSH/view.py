from django.http import HttpResponse
from django.template import RequestContext
from django.http import HttpResponseRedirect
import datetime
from django.shortcuts import render
from django.contrib.auth import authenticate,login
from django.contrib.auth.models import User
from BIOSH.models import Categoria,Program, Userprofile,Profile, Subcategory,ProgramSubCategory,ArgumentIn,ArgumentOut,typeArg
from BIOSH.forms import UserCreateForm,NewProgramForm,SelectedProgramForm,SelectedUserForm,NewUserForm#RecoveryContraseniaForm, NewUserForm,\
    #NewProgramForm
from django.core.context_processors import csrf
from django.shortcuts import render_to_response
import MySQLdb
from django.core import serializers
from django.contrib import auth
from django.http.response import HttpResponseRedirect
from django.core.mail import EmailMessage
from django.contrib.auth.forms import UserCreationForm
from django import forms as forms
from django.http.request import QueryDict
from django.utils import simplejson as json

import subprocess


#def base_admin ( response ):
#   return' render_to_response("base.html")
def add_user(request):
    if request.method == 'POST':
        formulario = UserCreateForm(request.POST)
        if formulario.is_valid:
            formulario.save()
            userNuevo = User.objects.get(username=request.POST['username'])
            profileUser = Profile.objects.get(id='3')
            objetoUser = Userprofile.objects.create(user_id=userNuevo.id,name_TypeUser = profileUser.name_Profile)
            objetoUser.save()
            
            return HttpResponseRedirect("/biosh/login")
    else:
            formulario = UserCreateForm()
    context ={
              'formulario':formulario,
              }
    return render(request, 'altaUser.html',context ) 
       
def config_admin( request):
    context={
             'profile': request.user.get_profile(),
             'newUser':'configuracion/newUser',
             'consultaUser':'configuracion/consultaUser',
             'myUser':'configuracion/myUser',
             'deleteUser':'configuracion/deleteUser',
             'editUser':'configuracion/editUser',
             }
    return render(request,"configuracion.html", context)
    

def program_admin( request ):
    context={
             'profile': request.user.get_profile(),
             'ejecutarPrograma':'programa/executeProgram',
             'verPrograma':'programa/seeProgram',
             'nuevoPrograma':'programa/newProgram',
             'borrarPrograma':'programa/deleteProgram',
             'anadirCategoria':'programa/categoryProgram',
             }
    return render(request,"programa.html", context)

def log_out(request):
    auth.logout(request)
    return HttpResponseRedirect("/biosh/login")
    

def login_index ( request ):
    #  import pdb;
    #pdb.set_trace();
   
    if request.user.is_authenticated():
        return render(request, 'configuracion.html')
    else:
        if request.method == 'POST' and request.POST:
            username=request.POST['username']
            password=request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    context = {
                               'profile':request.user.get_profile()
                               }
                    return render(request, 'configuracion.html',context)
                else:
                    context = {
                        'username': request.POST['username'],
                        'password': request.POST['password'],
                        'profile': request.user.get_profile(),
                    }
                    return render(request, 'login.html', context)
            else:
                context = {
                    'darAlta':'altaUser',
                    'recoveryPassword':'recoveryPassword'
                }
                return render(request, 'login.html', context)
        else:
            context = {
                    'darAlta':'altaUser',
                    'recoveryPassword':'recoveryPassword'
                }
            return render(request, 'login.html',context)
    
    


def new_program ( request ):
    
    if request.POST:
        form = NewProgramForm(request.POST)
        #import pdb
        #pdb.set_trace()
       
        name = request.POST['name']
        category = request.POST['category']
       
        try:
            instanceCategory = Categoria.objects.get(name=category)
        except Categoria.DoesNotExist:
            instanceCategory = None
        if instanceCategory is not None:
            descriptionShort = request.POST['descriptionShort']
            descriptionLarge = request.POST['descriptionLarge']
            numberArgumentIn = request.POST['numberArgumentIn']
            numberArgumentOut = request.POST['numberArgumentOut']
            edit_userparametroRedireccion = request.POST['parametroRedireccion']
            codigoEjecucion = request.POST['codigoEjecucion']
            directorio = request.POST['directorio']
            objectProgram = Program(name = name, category_id=instanceCategory.id, description_Short = descriptionShort, description_Large = descriptionLarge,
                                    numberArgumentIn = numberArgumentIn, numberArgumentOut = numberArgumentOut, ParametroRedireccion = edit_userparametroRedireccion,
                                    CodigoEjecucion = codigoEjecucion, directorio = directorio
                                    )
            
            objectProgram.save()
            if 'subcategory' in request.POST:
               instance_subcategory = Subcategory.objects.get(name=request.POST['subcategory'])
               objectProgramSubCategory = ProgramSubCategory.objects.create(program=objectProgram, subcategory = instance_subcategory)
               objectProgramSubCategory.save()
            
            numArgumentIn  = int(numberArgumentIn)
            numArgumentOut = int(numberArgumentOut)
            type_total = typeArg.objects.all()
            
            context={
                    
                    'id_program':objectProgram.id,
                    'argumentosIn':range(numArgumentIn),
                    'argumentosOut':range(numArgumentOut),
                    'type':type_total
            }
            return render(request,"argumentIn.html",context)
    else:
        form = NewProgramForm()
        
    category_list = Categoria.objects.all()
    
    context = {
              
              'category_list':category_list, 
              'formulario':form,
              'profile':request.user.get_profile(),
                }
    return render(request,"newProgram.html", context)

def execute_program ( request ):
    
    if request.POST:
        formulario = SelectedProgramForm(request.POST)
        program = Program.objects.get(name=request.POST['program'])
        directorio = program.directorio
        valorDevueltoscript =  subprocess.check_output(directorio,stderr=subprocess.STDOUT, shell=True,universal_newlines='U')
        #if formulario.is_valid():
    valorDevueltoscript = "";
    objectCategory = Categoria.objects.all()
    objectSubcategory = Subcategory.objects.all()
    objectProgram = Program.objects.all()
    #valorDevueltoscript = subprocess.check_output("/home/roberto/Escritorio/holamundo.sh",shell=True,universal_newlines=True)
    
    context={
             'category_list':objectCategory,
             'program_list':objectProgram,
             'subcategory_list':objectSubcategory,
             #'formulario':formulario,
             'profile':request.user.get_profile(),
             'script':valorDevueltoscript,
             } 
  
    return render(request, "ejecutar.html", context)
   

def see_program( request ):
        SelectedProgram = False;
        objectCategory = Categoria.objects.all()
        objectSubcategory = Subcategory.objects.all()
        objectProgram = Program.objects.all()
        if request.POST:
            #formulario = SelectedUserForm(request.POST)
            if request.POST['program']!="":
                SelectedProgram = True
                formulario = SelectedProgramForm(request.POST)
                object = Program.objects.get(name=request.POST['program'])
                context = {
                           'category_list':objectCategory,
                           'program_list':objectProgram,
                           'subcategory_list':objectSubcategory,
                           'object':object,
                           'formulario':formulario,
                           'selectedProgram':SelectedProgram,
                           'profile':request.user.get_profile(),
                          }
                #import pdb;
                #pdb.set_trace()    
                      
        else:
            formulario = SelectedProgramForm()
            context={
                     'category_list':objectCategory,
                     'program_list':objectProgram,
                     'subcategory_list':objectSubcategory,
                     'formulario':formulario,
                     'selectedProgram':SelectedProgram,
                     'profile':request.user.get_profile(),
            } 
            
        return render(request, "seeProgram.html", context)
   
def delete_program( request ):
    
    if request.POST:
        formulario = SelectedProgramForm(request.POST)
        name = request.POST['program']
        objectDelete = Program.objects.get(name=name)
        listArgumentosIn = list(ArgumentIn.objects.filter(id_type=objectDelete.id))
        acumulador = 0;
        for index in listArgumentosIn:
            objetoArgumentIn = ArgumentIn.objects.get(id_program=index[acumulador].id_program)
            objetoArgumentIn.delete()
            acumulador = acumulador + 1
        
        listArgumentosOut = list(ArgumentOut.objects.filter(id_type=objectDelete.id))
        acumulador = 0;
        for index in listArgumentosOut:
            objetoArgumentOut = ArgumentOut.objects.get(id_program=index[acumulador].id_program)
            objetoArgumentOut.delete()
            acumulador = acumulador + 1
        
        if objectDelete is not None:
            objectDelete.delete()
    else:
        formulario = SelectedProgramForm()
    objectCategory = Categoria.objects.all()
    objectSubcategory = Subcategory.objects.all()
    objectProgram = Program.objects.all()
    context={
             'category_list':objectCategory,
             'program_list':objectProgram,
             'subcategory_list':objectSubcategory,
             'formulario':formulario,
             'profile':request.user.get_profile(),
             } 
    return render(request, "deleteProgram.html", context)
   
def category_program( request ):
    categoriaExistente = Categoria.objects.all()
    if request.POST:
            try:
                object = Categoria.objects.get(name=request.POST['category'])
                if request.POST['input_subcategory']!="":
                    try:
                        subcategory = Subcategory.objects.get(name=request.POST['input_subcategory'])
                    except Subcategory.DoesNotExist:
                        subcategory = Subcategory.objects.create(category_id=object.id, name=request.POST['input_subcategory'])
                        subcategory.save()
            except Categoria.DoesNotExist:
                object = Categoria.objects.create(name=request.POST['category'])
                object.save()
    
    context={
              'profile':request.user.get_profile(),
              'formulario':categoriaExistente,
             } 
    return render( request, "categoria.html",context)

def new_user ( request ):
    if request.POST:
        if request.method == 'POST':
            formulario = UserCreateForm(request.POST)
            typeUser = NewUserForm(request.POST)
            if formulario.is_valid:
                formulario.save()
                userNuevo = User.objects.get(username=request.POST['username'])
                profileUser = Profile.objects.get(id=request.POST['profile'])
                objetoUser = Userprofile.objects.create(user_id=userNuevo.id,name_TypeUser = profileUser.name_Profile)
                objetoUser.save()
            return HttpResponseRedirect('/biosh/configuracion')
    else:
        formulario = UserCreateForm()
        typeUser = NewUserForm()
    
    context ={
              'formulario':formulario,
              'typeUser': typeUser,
              'profile':request.user.get_profile(),
             
              }
    return render(request, 'newUser.html',context ) 

def delete_user ( request ):
    if request.POST:
        formulario = SelectedUserForm(request.POST)
        objetoUser = User.objects.get(id=request.POST['usuarios'])
        objetoUser.delete()
        #if formulario.is_valid():
    else:
        formulario = SelectedUserForm()
    
    context={
             'formulario':formulario,
             'profile':request.user.get_profile(),
             } 
    return render(request, "deleteUser.html", context)

def editSelectedUser(request):
    return render(request,"editSelectedUser.html")
        
   
def edit_user ( request ):
        
        SelectedUser = False;
        if request.POST:
                         
            rol = Profile.objects.all()
            if request.POST['usuarios']!="":
                SelectedUser = True
                formulario = SelectedUserForm()
                object = User.objects.get(id=request.POST['usuarios'])
                profile = Userprofile.objects.get(user_id=request.POST['usuarios'])
                context = {
                           'object':object,
                           'formulario':formulario,
                           'selectedUser':SelectedUser,
                           'profile':request.user.get_profile(),
                           'rol':rol
                          }
                #import pdb;
                #pdb.set_trace()    
                      
        else:
            formulario = SelectedUserForm()
            context={
                     'formulario':formulario,
                     'selectedUser':SelectedUser,
                     'profile':request.user.get_profile(),
            } 
            
        return render(request, "editUser.html", context)

def query_user ( request ):
    SelectedUser = False;
        
    if request.POST:
            #formulario = SelectedUserForm(request.POST)
            
            if request.POST['usuarios']!="":
                SelectedUser = True
                formulario = SelectedUserForm()
                object = User.objects.get(id=request.POST['usuarios'])
                profile = request.user.get_profile()
                context = {
                           'profile':profile,
                           'object':object,
                           'formulario':formulario,
                           'selectedUser':SelectedUser,
                           'profile':request.user.get_profile(),
                          }
                                   
    else:
            formulario = SelectedUserForm()
            context={
                     'formulario':formulario,
                     'selectedUser':SelectedUser,
                     'profile':request.user.get_profile(),
            } 
            
    return render(request, "consultaUser.html", context)

def my_user(request):
    objetoUser = User.objects.get(id=request.user.id)
    profile = Userprofile.objects.get(user_id=request.user.id)
    
    context ={
              'profile':profile,
              'objetoUser':objetoUser,
              'profile':request.user.get_profile(),
            }
       
    return render(request,"myUser.html",context)
    
def organizacion_Program(request):
    #import pdb
    #pdb.set_trace()
    entra_subcategoria = 'KO'
    entra_programas = 'KO'
     
    parse_json = request.POST.get('json','')
    print (parse_json)
    obj_json = json.loads(parse_json)
    name_category = obj_json['name']
        
    objectCategory = Categoria.objects.get(name=name_category)
    id_categoria = objectCategory.id
    
    subCategory = list(Subcategory.objects.filter(category_id=id_categoria))
    program = list(Program.objects.filter(category=id_categoria))
    
    arrayJson ={}
    arrayJsonProgram={}
    acumulador = 0;
    if len(subCategory)!=0:
        for sub in subCategory:
            sub = subCategory[acumulador].name
            arrayJson[acumulador] = sub
            acumulador = acumulador + 1
        entra_subcategoria = 'OK'
    else:
        entra_programas = 'OK'
        acumulador = 0
        for pro in program:
            pro = Program.objects.get(id=program[acumulador].id)
            arrayJsonProgram[acumulador] = pro.name
            acumulador = acumulador + 1
                    
    
    response = json.dumps({
                           'arrayJsonSubCategorias':[arrayJson],
                           'arrayJsonProgramas':[arrayJsonProgram],
                           'entra_subcategoria': entra_subcategoria,
                           'entra_programas':entra_programas,
                          } )
                        #'program_list':program,
                        #'subCategory_list':subCategory
                 
    
    return HttpResponse(response,content_type="application/json")

def argumentIn_program(request):
    type_total = typeArg.objects.all()
    
    if request.POST:
        
        id_program = request.POST['idProgram']
        program = Program.objects.get(id=id_program)
                
        myarray=request.POST['idArgument'].replace("[","")
        myarray = myarray.replace("]","")
        myarray = myarray.replace(" ","")
        myarray = myarray.replace(",","")
       
        myarrayOut=request.POST['idArgumentOut'].replace("[","")
        myarrayOut = myarray.replace("]","")
        myarrayOut = myarray.replace(" ","")
        myarrayOut = myarray.replace(",","")
        acumulador = 0;
        for index in myarray:
            type_new = request.POST['type_'+str(acumulador)]
            type_result = typeArg.objects.get(type_text=type_new)
            nombre_argument = request.POST['nameArgument_'+str(acumulador)]
            description = request.POST['descriptionArgument_'+str(acumulador)]
            objetoPrograma = ArgumentIn.objects.create(id_program=program, nombre_argument = nombre_argument, descripcion_argument=description, id_type = type_result)
            objetoPrograma.save();
            acumulador = acumulador + 1
        context = {
                   'argumentosOut':myarrayOut,
                   'id_program':id_program,
                   'type':type_total
                   }
        return render(request,"argumentOut.html",context)
    else:
         
        context={
                  'type':type_total
        }      
    return render(request,"argumentIn.html",context)

def argumentOut_program(request):
    if request.POST:
        
        id_program = request.POST['idProgram']
        program = Program.objects.get(id=id_program)
        
        myarray=request.POST['idArgument'].replace("[","")
        myarray = myarray.replace("]","")
        myarray = myarray.replace(" ","")
        myarray = myarray.replace(",","")
       
        
        acumulador = 0;
        for index in myarray:
            type_new = request.POST['type_'+str(acumulador)]
            type_result = typeArg.objects.get(type_text=type_new)
            nombre_argument = request.POST['nameArgument_'+str(acumulador)]
            description = request.POST['descriptionArgument_'+str(acumulador)]
            objetoPrograma = ArgumentOut.objects.create(id_program=program, nombre_argument = nombre_argument, descripcion_argument=description, id_type = type_result)
            objetoPrograma.save();
            acumulador = acumulador + 1
        return render(request,"programa.html")
            
    return render(request,"argumentOut.html")
    
def organizacion_SubCategoriaProgram(request):
    
    posee_program = 'KO'
    parse_json = request.POST.get('json','')
    print (parse_json)
    obj_json = json.loads(parse_json)
    name_subcategory = obj_json['name']
        
    objectCategory = Subcategory.objects.get(name=name_subcategory)
    id_subcategoria = objectCategory.id
    program = list(ProgramSubCategory.objects.filter(subcategory=id_subcategoria))
   
    arrayJson ={}
    acumulador = 0;
    
    for pro in program:
        pro = Program.objects.get(id=program[acumulador].program_id)
        arrayJson[acumulador] = pro.name
        acumulador = acumulador + 1
        posee_program = 'OK'
      
    
    response = json.dumps({
                           'arrayJsonProgramas':[arrayJson],
                           'posee_program':posee_program,
                           })
                       
                 
    
    return HttpResponse(response,content_type="application/json")

    
def organizacion_argumentoProgram(request):
    #import pdb
    #pdb.set_trace()
        
    parse_json = request.POST.get('json','')
    print (parse_json)
    obj_json = json.loads(parse_json)
    name_program = obj_json['name']
        
    objectProgram = Program.objects.get(name=name_program)
    numberArgumentIn = objectProgram.numberArgumentIn
    numberArgumentOut = objectProgram.numberArgumentOut
    
    response = json.dumps({
                           'numberArgumentIn':numberArgumentIn,
                           'numberArgumentOut':numberArgumentOut,
                           
                          } )
                        #'program_list':program,
                        #'subCategory_list':subCategory
                 
    
    return HttpResponse(response,content_type="application/json")
    
    
    
    

