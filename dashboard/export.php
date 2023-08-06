<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$consulta = "SELECT * FROM personas";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$data = $resultado->fetchAll(PDO::FETCH_ASSOC);

if($data){
    $delimiter = ",";
    $filename = "export_" . date('Y-m-d') . ".csv";

    //create a file pointer
    $f = fopen('php://memory', 'w');
    
    //set column headers
    $fields = array('ID', 'Name', 'Surname', 'Email', 'Country', 'Age', 'Skills', 'Points', 'Comment', 'Created');
    fputcsv($f, $fields, $delimiter);
    
    //output each row of the data, format line as csv and write to file pointer
    foreach($data as $dat) {
        $lineData = array($dat['id'], $dat['nombre'], $dat['apellido'], $dat['email'], $dat['pais'], $dat['edad'], $dat['skills'], $dat['puntaje'], $dat['comentario'], $dat['timecreated']);
        fputcsv($f, $lineData, $delimiter);
    }

    //set headers to download file rather than displayed
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename="' . $filename . '";');
    echo "\xEF\xBB\xBF"; // UTF-8 BOM
    
    //move back to beginning of file
    fseek($f, 0);
    
    //output all remaining data on a file pointer
    fpassthru($f);
}
exit;
?>