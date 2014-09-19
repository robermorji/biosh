

$(document).ready(function() {
	
	$("select#categoria").ready(function(){
		//alert("Valor: "+$("select#categoria").val())
		
		var jsonRequest = {
						'name':$("select#categoria").val() 
						}
		$.ajax({
			'type':'POST',
			'url':"/biosh/organizarProgram",
			'data':{
				'json':JSON.stringify(jsonRequest),
				'csrfmiddlewaretoken': getCookie('csrftoken'),
			},
			
			'dataType':'json',
			'success': function(data){
				montarDom(data);
			},
		})
		
	})
	
	$("select#categoria").change(function(){
		//alert("Valor: "+$("select#categoria").val())
		var entrada = document.getElementById("argumentEntrada");
		if (entrada!=null)
		{
			while (entrada.firstChild) {
				entrada.removeChild(entrada.firstChild);
			}
		}
		var jsonRequest = {
						'name':$("select#categoria").val() 
						}
		
		$.ajax({
			'type':'POST',
			'url':"/biosh/organizarProgram",
			'data':{
				'json':JSON.stringify(jsonRequest),
				'csrfmiddlewaretoken': getCookie('csrftoken'),
			},
			
			'dataType':'json',
			'success': function(data){
				montarDom(data);
			},
		})
		
	})
	
	$("select#subcategoria").change(function(){
		//alert("Valor: "+$("select#categoria").val())
		var entrada = document.getElementById("argumentEntrada");
		if (entrada!=null)
		{
			while (entrada.firstChild) {
			    entrada.removeChild(entrada.firstChild);
			}
		}
		var jsonRequest = {
						'name':$("select#subcategoria").val() 
						}
		$.ajax({
			'type':'POST',
			'url':"/biosh/organizarSubCategoriaProgram",
			'data':{
				'json':JSON.stringify(jsonRequest),
				'csrfmiddlewaretoken': getCookie('csrftoken'),
			},
			
			'dataType':'json',
			'success': function(data){
				montarDomSubCategoria(data);
			},
		})
		
	})
	
		
		$("select#subcategoria").click(function(){
			//alert("Valor: "+$("select#categoria").val())
			var entrada = document.getElementById("argumentEntrada");
			if (entrada!=null)
			{
				while (entrada.firstChild) {
				    entrada.removeChild(entrada.firstChild);
				}
			}
			var jsonRequest = {
							'name':$("select#subcategoria").val() 
							}
			$.ajax({
				'type':'POST',
				'url':"/biosh/organizarSubCategoriaProgram",
				'data':{
					'json':JSON.stringify(jsonRequest),
					'csrfmiddlewaretoken': getCookie('csrftoken'),
				},
				
				'dataType':'json',
				'success': function(data){
					montarDomSubCategoria(data);
				},
			})
		
		})
	
	
	
	
});

function montarDom(data){
	
	$("select#program").find('option').remove()
	$("select#subcategoria").find('option').remove()
	//debugger;
	if (data['entra_subcategoria']=='OK'){
		$("select#subcategoria").removeAttr('disabled');
		$("select#program").attr('disabled','true');
		var index;
		var arrayJson = data['arrayJsonSubCategorias']
		for(index=0; arrayJson[0][index]!=undefined;index++){
			var subcategory = arrayJson[0][index];
			$("select#subcategoria").append("<option value="+subcategory+">"+subcategory+"</option>")
		}
	}
	else if ( data['entra_programas']=='OK'){
		$("select#program").removeAttr('disabled');
		$("select#subcategoria").attr('disabled','true');
		var index;
		var arrayJson = data['arrayJsonProgramas'];
		
		for(index=0; arrayJson[0][index]!=undefined ;index++){
			var program = arrayJson[0][index];
			$("select#program").append("<option value="+program+">"+program+"</option>")
		}
	}
}

function montarDomSubCategoria(data){
	$("select#program").find('option').remove()
	$("select#program").removeAttr('disabled');
	
	
	if ( data['posee_program']=='OK'){
		$("select#program").removeAttr('disabled');
		var index;
		var arrayJson = data['arrayJsonProgramas'];
		
		for(index=0; arrayJson[0][index]!=undefined ;index++){
			var program = arrayJson[0][index];
			$("select#program").append("<option value="+program+">"+program+"</option>")
		}
	}
}

function getCookie(name){
	var cookieValue=null;
	if (document.cookie && document.cookie!=''){
		var cookies = document.cookie.split(';');
		for (var i=0; i< cookies.length;i++){
			var cookie = jQuery.trim(cookies[i]);
			if ( cookie.substring(0,name.length+1)==(name +'=')){
				cookieValue = decodeURIComponent( cookie.substring(name.length+1));
				break;
			}
		}
	}
	return cookieValue;
}