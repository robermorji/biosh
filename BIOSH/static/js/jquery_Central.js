		  $(document).ready(function() {
				$("#newUser").click(function(event){
					$.get( 
				       "configuracion/newUser",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
				
				$("#deleteUser").click(function(event){
					$.get( 
				       "configuracion/deleteUser",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});

				$("#seeUser").click(function(event){
					$.get( 
				       "configuracion/consultaUser",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});

				$("#editUser").click(function(event){
					$.get( 
				       "configuracion/editUser",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
						
				$("#myUser").click(function(event){
					$.get( 
				       "editUser.php",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
				
   		});
 