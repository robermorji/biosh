		  $(document).ready(function() {
				$("#execute").click(function(event){
					$.get( 
				       "programa/executeProgram",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
				
				$("#see").click(function(event){
					$.get( 
				       "programa/seeProgram",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});

				$("#new").click(function(event){
					$.get( 
				       "newProgram",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});

				$("#delete").click(function(event){
					$.get( 
				       "programa/deleteProgram",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
						
				$("#categoria").click(function(event){
					$.get( 
				       "programa/categoryProgram",
				       function(data) {
				          $('#central').html(data);
				       }

				    );
				});
				
   		}); 