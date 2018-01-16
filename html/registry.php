<!DOCTYPE html>
<html>
<head>
    <title>Reportes</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="styleSheet" type="text/css" href="../css/header.css">
    <link rel="styleSheet" type="text/css" href="../css/table.css">
</head>
<body>
    <!-- Header -->
    <?php include("header/header.php") ?>
    <!-- Insert -->
    <div class="container" style="padding-top: 120px;">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <h1 align="middle" style="padding-bottom: 10px;">REGISTRO DIARIO</h1>
                <div class="input-group custom-search-form">
                <input type="text" class="form-control" placeholder="Código">
                <span class="input-group-btn">
                <button class="btn btn-primary" type="button">Registrar</button>
                </span>
             </div>
        </div>
    </div>
    </div>

    <!--Daily report-->
    <div class="container" style="padding-top: 180px;">
    <div class="row">
        <div class="col-md-12 col-md">
            <div class="panel panel-default ticket-list">
              <div class="panel-heading">
                <h2 class="panel-title text-center">LIBROS REGISTRADOS</h2>
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