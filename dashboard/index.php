<?php require_once "vistas/parte_superior.php"?>

<!--INICIO del cont principal-->
<div class="container">
    <h1>Registered Players</h1>
    
    
    
 <?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$consulta = "SELECT * FROM personas";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$data=$resultado->fetchAll(PDO::FETCH_ASSOC);
?>


    <div class="container">
        <div class="row">
            <div class="col-lg-12">   
                <div style="float: left">         
                    <button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal">New</button>
                </div>
                <div style="float: right">
                    <a href="export.php" id="btnExport" class="btn btn-success">Export</a>
                </div>   
            </div>    
        </div>    
    </div>
    <br>  
    <div class="container">
        <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">        
                        <table id="tablaPersonas" class="table table-striped table-bordered table-condensed" style="width:100%">
                        <thead class="text-center">
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Surname</th>                                
                                <th>Email</th>
                                <th>Country</th>
                                <th>Age</th>
                                <th>Skills</th>
                                <th>Points</th>
                                <th>Comment</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php                            
                            foreach($data as $dat) {                                                        
                            ?>
                            <tr>
                                <td><?php echo $dat['id'] ?></td>
                                <td><?php echo $dat['nombre'] ?></td>
                                <td><?php echo $dat['apellido'] ?></td>
                                <td><?php echo $dat['email'] ?></td>
                                <td><?php echo $dat['pais'] ?></td>
                                <td><?php echo $dat['edad'] ?></td>
                                <td><?php echo $dat['skills'] ?></td>
                                <td><?php echo $dat['puntaje'] ?></td>
                                <td><?php echo $dat['comentario'] ?></td>
                                <td></td>
                            </tr>
                            <?php
                                }
                            ?>                                
                        </tbody>        
                       </table>                    
                    </div>
                </div>
        </div>  
    </div>    
      
<!--Modal para CRUD-->
<div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
        <form id="formPersonas">    
            <div class="modal-body">
                <div class="form-group">
                    <label for="nombre" class="col-form-label">Name:</label>
                    <input type="text" class="form-control" id="nombre">
                </div>
                <div class="form-group">
                    <label for="apellido" class="col-form-label">Surname:</label>
                    <input type="text" class="form-control" id="apellido">
                </div>        
                <div class="form-group">
                    <label for="email" class="col-form-label">Email:</label>
                    <input type="email" class="form-control" id="email">
                </div>
                <div class="form-group">
                    <label for="pais" class="col-form-label">Country:</label>
                    <input type="text" class="form-control" id="pais">
                </div>
                <div class="form-group">
                    <label for="edad" class="col-form-label">Age:</label>
                    <input type="number" class="form-control" id="edad">
                </div>
                <div class="form-group">
                    <label for="skills" class="col-form-label">Skills:</label>
                    <input type="text" class="form-control" id="skills">
                </div>
                <div class="form-group">
                    <label for="puntaje" class="col-form-label">Points:</label>
                    <input type="number" class="form-control" id="puntaje">
                </div>
                <div class="form-group">
                    <label for="comentario" class="col-form-label">Comment:</label>
                    <input type="text" class="form-control" id="comentario">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                <button type="submit" id="btnGuardar" class="btn btn-dark">Save</button>
            </div>
        </form>    
        </div>
    </div>
</div>  
      
    
    
</div>
<!--FIN del cont principal-->
<?php require_once "vistas/parte_inferior.php"?>