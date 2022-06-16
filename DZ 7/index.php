<!DOCTYPE html>
<html>
<head>
	<title>layout</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>

	$(document).ready(function(){
		$.get( "load.php", function( data ) {
			$("#txtHint").html(data)
		})
	})

	
	  $(document).ready(function(){
		$( ".search" ).keyup(function showHint() {
			var str = $(".search").val()
			$.get( "trazilica.php?s=" + str, function( data ) {
				$("#txtHint").html(data)
			})
		})
	  })
	
  </script>
<body>

  <div class="container">
		<div class="nav">
			<ul class="topnav">
				<li><a class="active" href="#home">Home</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="right"><a href="#about">About</a></li>
		  	</ul>  
			<h1>Hospital</h1>
		</div>

		<div class="header">
		<form> 
			Search: <input type="text" class="search" onkeyup="showHint(this.value)">
		</form>
		<div id="txtHint"></div>
		</div>

  	   <section class="section1">
  	   	     <h1>Section1</h1>
  	   	     <div class="content">
  	   	     	 <div class="card">
  	   	     	 	  <div class="box">
  	   	     	 	  	  Card1
  	   	     	 	  </div>
  	   	     	 </div>
  	   	     	 <div class="card">
  	   	     	 	  <div class="box">
  	   	     	 	  	  Card2
  	   	     	 	  </div>
  	   	     	 </div>
  	   	     	 <div class="card">
  	   	     	 	  <div class="box">
  	   	     	 	  	  Card3
  	   	     	 	  </div>
  	   	     	 </div>
  	   	     	 <div class="card">
  	   	     	 	  <div class="box">
  	   	     	 	  	  Card4
  	   	     	 	  </div>
  	   	     	 </div>
  	   	     </div>
  	   </section>

  	   
       <footer>
       	 <h1>Footer</h1>
       </footer>
  	   <div class="clear">
  	   </div>
  </div>

</body>
</html>