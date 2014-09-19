from django.db import models 
from django.contrib.auth.models import User


CHOICE_TYPE_USER = (
                 ('ADMINISTRADOR','Administrador'),
                 ('VISITADOR','Visitador'),
                 ('EXPERTO','Experto'),
            )

class Profile(models.Model):
    name_Profile = models.CharField(max_length=30) 
    def __str__(self):
        return "%s" %(self.name_Profile)
    
class Userprofile(models.Model):
    # This field is required.
    user = models.OneToOneField(User, related_name='profile')
    name_TypeUser = models.CharField(max_length=30)

class typeArg(models.Model):
    type_text = models.CharField(max_length=30)   
 
   
class Categoria ( models.Model):
    name = models.CharField(max_length=30)
    def __str__(self):
        return "%s" %(self.name) 
    

class Program ( models.Model):
    category = models.ForeignKey(Categoria)
    name = models.CharField(max_length=30)
    description_Short = models.CharField(max_length=30)
    description_Large = models.CharField(max_length=30)
    directorio = models.CharField(max_length=30)
    numberArgumentIn = models.IntegerField()
    numberArgumentOut = models.IntegerField()
    ParametroRedireccion = models.CharField(max_length=30)
    CodigoEjecucion = models.CharField(max_length=30)
    def __str__(self):
        return "%s" %(self.name)
    
class ArgumentIn(models.Model):
    id_program = models.ForeignKey(Program)
    nombre_argument = models.CharField(max_length=30)
    descripcion_argument = models.CharField(max_length=30)
    id_type = models.ForeignKey(typeArg)
    
class ArgumentOut(models.Model):
    id_program = models.ForeignKey(Program)
    nombre_argument = models.CharField(max_length=30)
    descripcion_argument = models.CharField(max_length=30)
    id_type = models.ForeignKey(typeArg)
    
class Subcategory(models.Model):
    category = models.ForeignKey(Categoria)
    name = models.CharField(max_length=30)
    def __str__(self):
        return "%s" %(self.name)
    
class ProgramSubCategory(models.Model):
    program = models.ForeignKey(Program)
    subcategory = models.ForeignKey(Subcategory)
    
    
    