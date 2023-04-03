<?php

include 'is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database*/
require_once "../db.php"; //Contiene las variables de configuracion para conectar a la base de datos
require_once "../php_conexion.php"; //Contiene funcion que conecta a la base de datos
//Archivo de funciones PHP
require_once "../funciones.php";
//Inicia Control de Permisos
include "../permisos.php";
$user_id = $_SESSION['id_users'];
$id_presupuesto= $_POST['id'];
get_cadena($user_id);
$modulo = "Ventas";
permisos($modulo, $cadena_permisos);
//Finaliza Control de Permisos
$action = 'ajax';

if ($action == 'ajax') {
    $sql1 = "SELECT MAX(version) AS version_presu, MAX(id_version) AS id_version FROM facturas_cot WHERE id_presupuesto = $id_presupuesto;";
    $query1 = mysqli_query($conexion, $sql1);
    $row1 = mysqli_fetch_array($query1);
    $sql3 = "SELECT * FROM facturas_cot WHERE id_version = ".$row1['id_version'];
    //echo $sql3;
    $query3 = mysqli_query($conexion, $sql3);
    $row3 = mysqli_fetch_array($query3);
    $fecha_version  = date("Y-m-d");
    $nueva_version = $row1['version_presu'] + 1;
    $sql4 = "INSERT INTO facturas_cot (`id_presupuesto`, `fecha_version`, `fecha_reserva`, `condiciones`, `monto_factura`, `version`, 
                `validez`, `user`, `confirmado`, `id_cliente`) VALUES ( ".
                $row3['id_presupuesto'].", '" . 
                $fecha_version."', " . 
                "NULL, " . 
                $row3['condiciones'].", " .
                $row3['monto_factura'].", " .
                $nueva_version.", " .
                $row3['validez'].", " .
                $user_id.", " .
                "0, " .
                $row3['id_cliente'].  
                ")";
    echo $row1['id_version'];
    $sql2 = "SELECT * FROM detalle_fact_cot WHERE id_version = ".$row1['id_version'];
    $query2 = mysqli_query($conexion, $sql2);
    //$row2 = mysqli_fetch_array($query2);
    //var_dump($row2);
    $query4 = mysqli_query($conexion, $sql4);
    //var_dump($sql4);
    if ($query4){
        /* $sql5 = mysqli_query($conexion, "SELECT LAST_INSERT_ID(id_version) AS last_id FROM facturas_cot order by id_detalle desc limit 0,1 ;");
        $row5 = mysqli_fetch_array($sql5); */
        $sql6 = "INSERT INTO detalle_fact_cot (`id_version`, `id_producto`, `cantidad`, `jornada`, `desc_venta`, `precio_venta`) VALUES ";
                while($row2 = mysqli_fetch_array($query2)){
                    $sql6 .=" (".
                ($row1['id_version']+1).", ".
                $row2['id_producto'].", ". 
                $row2['cantidad'].", ".
                $row2['jornada'].", ".
                $row2['desc_venta'].", ".
                $row2['precio_venta']. "),";
        }
        $sql6 = substr_replace($sql6, ";", -1);
        var_dump($sql6);
        $query6 = mysqli_query($conexion, $sql6);
         //$row6 = mysqli_fetch_array($query6);
        if($query6){
            echo "<script> $.Notification.notify('success','bottom center','NOTIFICACIÓN', 'NUEVA VERSION REGISTRADA CON ÉXITO')</script>";
        }else{
            echo "<script> $.Notification.notify('error','bottom center','ERROR', 'UN ERROR HA OCURRIDO, CONTACTO CON EL DESARROLLADOR, ERROR 2')</script>";
        }
    }else{
        echo "<script> $.Notification.notify('error','bottom center','ERROR', 'UN ERROR HA OCURRIDO, CONTACTO CON EL DESARROLLADOR, ERROR 1')</script>";
    }
//    var_dump($row5);
//    var_dump($sql6);
/*     $sqll = "SELECT LAST_INSERT_ID(id_detalle) AS last_id FROM detalle_fact_cot order by id_detalle desc limit 0,1 ;";
    $queryy = mysqli_query($conexion, $sqll);
    $roww = mysqli_fetch_array($queryy);
    var_dump($roww['last_id']); */
   // echo "<script> $.Notification.notify('error','bottom center','NOTIFICACIÓN', 'PRODUCTO AGREGADO A LA FACTURA CORRECTAMENTE')</script>";
        
        ?>
        
    <?php
}
//Este else Fue agregado de Prueba de prodria Quitar
    else {
        ?>
    <div class="alert alert-warning alert-dismissible" role="alert" align="center">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Aviso!</strong> No hay Registro de Cotizaciones
    </div>
<?php
}

?>