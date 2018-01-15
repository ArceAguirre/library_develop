<!DOCTYPE html>
<html>
<head>
	<title>Bienvenido</title>
	<!-- Ingresar la pagina a donde se redireccionará -->
	<!--link href="	ingresar nueva pagina			" rel="stylesheet"-->
	<LINK REL=StyleSheet HREF="../css/index.css" TYPE="text/css" MEDIA=screen>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-offset-5 col-md-3">
        	<form method="post" action="archivo.php">
	            <div class="form-login">
		            <h4>Bienvienido.</h4>
		            <input type="text" id="userName" class="form-control input-sm chat-input" placeholder="username" />
		            </br>
		            <input type="text" id="userPassword" class="form-control input-sm chat-input" placeholder="password" />
		            </br>
		            <div class="wrapper">
			            <span class="group-btn">     
		            		<button class="btn btn-primary btn-md" type="submit">Aceptar</button>
			                
			            </span>
		            </div>
	            </div>
        	</form>
        </div>
    </div>
</div>
</body>
</html>