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
            <div class="col-lg-12">
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
                <h3 class="panel-title text-center">Reporte de /Fecha/</h3>
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