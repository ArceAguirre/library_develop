<!DOCTYPE html>
<html>
<head>
  <title>Reportes</title>
  <!--  Hojas de estilo -->  
  <link rel="stylesheet" type="text/css" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <link rel="styleSheet" type="text/css" href="../css/header.css">
  <link rel="styleSheet" type="text/css" href="../css/table.css">

  <!-- Meta -->
  <meta http-equiv="Expires" content="0">
  <meta http-equiv="Last-Modified" content="0">
  <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">
  <meta http-equiv="Last-Modified" content="0">
  <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
  <meta http-equiv="Pragma" content="no-cache">
  
  <!-- Java Script -->
</head>
<body>
    <!-- Header -->
    <?php include("header/header.php") ?>
    <!-- Insert -->
      <div class="container" style="padding-top: 120px;">
          <div class="row">
              <div class="col-md-6 col-md-offset-3 text-center">
                  <h1 align="middle" >Registro de Libros</h1>
                  <label >Prestamo por día</label>
                  <div class="input-group custom-search-form">
                  <input type="text" class="form-control" placeholder="Código" maxlength="20">
                  <span class="input-group-btn">
                  <button class="btn btn-primary" type="button">Registrar</button>
                  </span>
               </div>
          </div>
      </div>
    </div>
  <div class="container">
     <div class="row">
        <div class="col-md-6 col-md">
          <label>Día</label>
        </div>
        <div class="col-md-6 col-md text-right">
          <label>Total</label>
        </div>
      </div>
  </div>
    <!--Daily report-->
    <div class="container">
    <div class="row">
        <div class="col-md-12 col-md">
            <div class="panel panel-default ticket-list">
              <div class="panel-heading">
                <h2 class="panel-title text-center">Libros Registrados</h2>
              </div>
              <div class="panel-body ">
                  <table class="table">
                    <thead class='table-head'>
                      <tr class='table-head'>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Autor</th>
                        <th>Hora</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>a</td>
                        <td>very</td>
                        <td>nice</td>
                        <td>placeholder</td>
                      </tr>
                    </tbody>
                  </table>      
              </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>