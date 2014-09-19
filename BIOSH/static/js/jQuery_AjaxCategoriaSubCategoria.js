
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
});
function montarDom(data){
	
	$("select#subcategory").find('option').remove()
	$("select#subcategory").attr('disabled','disabled')
	debugger;
	if (data['entra_subcategoria']=='OK'){
		$("select#subcategory").removeAttr('disabled');
		var index;
		var arrayJson = data['arrayJsonSubCategorias']
		for(index=0; arrayJson[0][index]!=undefined;index++){
			var subcategory = arrayJson[0][index];
			$("select#subcategory").append("<option value="+subcategory+">"+subcategory+"</option>")
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
