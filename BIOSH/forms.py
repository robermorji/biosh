
from BIOSH.models import Categoria,Program, Userprofile,Profile,Subcategory
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django import forms

#from django.newforms import form_for_model

TOPIC_CHOICES_USER = (
        ('VST','Visitador'),        
                 
        )

TOPIC_CHOICES_NEWUSER = (
        ('VST','Visitador'),
        ('EXP','Experto'),
        ('EST','Estandar'),        
                 
        )

TOPIC_CHOICES_NEWPROGRAM = (
        ('VST','Visitador'),
        ('EXP','Experto'),
        ('EST','Estandar'),        
                 
        )

class NewProgramForm(forms.Form):
    queryset = Categoria.objects.all()
    name = forms.CharField(widget=forms.TextInput,required=True)
    category = forms.ModelChoiceField(queryset)
    descriptionLarge = forms.CharField(widget=forms.Textarea, required=False)
    descriptionShort = forms.CharField(widget=forms.TextInput, required=False)
    numberArgumentIn = forms.CharField(widget=forms.TextInput, required=False)
    numberArgumentOut = forms.CharField(widget=forms.TextInput, required=False)
    directorio = forms.CharField(widget=forms.TextInput)
    codigoEjecucion = forms.CharField(widget=forms.TextInput)
    parametroRedireccion = forms.CharField(widget=forms.TextInput)
    #def __init__(self, user, *args, **kwargs):
    #    super(NewProgramForm, self).__init__(*args, **kwargs)
    #    self.fields['category'] = forms.ChoiceField(choices=[ (o.name, str(o)) for o in Categoria.objects.all()])
    
class NewUserForm(forms.Form):
    queryset = Profile.objects.all()
    profile =  forms.ModelChoiceField(queryset)
    
class SelectedProgramForm (forms.Form):
    queryset = Program.objects.all()
    querysetCategory = Categoria.objects.all()
    querysetSubCategory = Subcategory.objects.all()
    programa = forms.ModelChoiceField(queryset)
    category = forms.ModelChoiceField(querysetCategory)
    subcategory = forms.ModelChoiceField(querysetSubCategory)
    
class SelectedUserForm ( forms.Form):
    queryset = User.objects.all()
    usuarios = forms.ModelChoiceField(queryset)    
    
class UserCreateForm(UserCreationForm):
    class Meta:
        model = User
        fields = ("username","email", "first_name", "last_name")
        