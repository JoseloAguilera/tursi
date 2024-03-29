<?php
include 'is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/*Inicia validacion del lado del servidor*/

if (
    !empty($_POST['codigo']) &&
    !empty($_POST['nombre']) &&
    $_POST['linea'] != "" &&
    !empty($_POST['preciom'])
) {
    /* Connect To Database*/
    require_once "../db.php";
    require_once "../php_conexion.php";
    //Archivo de funciones PHP
    require_once "../funciones.php";
    // escaping, additionally removing everything that could be (html/javascript-) code
    $codigo      = mysqli_real_escape_string($conexion, (strip_tags($_POST["codigo"], ENT_QUOTES)));
    $nombre      = mysqli_real_escape_string($conexion, (strip_tags($_POST["nombre"], ENT_QUOTES)));
    $descripcion = mysqli_real_escape_string($conexion, (strip_tags($_POST["descripcion"], ENT_QUOTES)));
    $linea       = intval($_POST['linea']);
    $proveedor   = intval($_POST['proveedor']);
    $estado      = intval($_POST['estado']);
    $impuesto    = intval($_POST['impuesto']);
    $inv         = intval($_POST['inv']);
    //$imp              = intval($_POST['id_imp']);
    $costo            = floatval($_POST['costo']);
    $utilidad         = 0;//floatval($_POST['utilidad']);
    $precio_venta     = floatval($_POST['precio']);
    $precio_mayoreo   = floatval($_POST['preciom']);
    $precio_especial  = 0;//floatval($_POST['precioe']);
    $stock            = floatval($_POST['stock']);
    $stock_minimo     = floatval($_POST['minimo']);
    $date_added       = date("Y-m-d H:i:s");
    $users            = intval($_SESSION['id_users']);
   // $query_new_insert = '';
    //$query_update='';
// check if user or email address already exists
    /*$sql                   = "SELECT * FROM productos WHERE codigo_producto ='" . $codigo . "';";
    $query_check_user_name = mysqli_query($conexion, $sql);
    $query_check_user      = mysqli_num_rows($query_check_user_name);
    $sql2="";
    var_dump($query_check_user);
    if ($query_check_user == true) {
        $sql = "UPDATE productos SET codigo_producto='" . $codigo . "',
                                        nombre_producto='" . $nombre . "',
                                        descripcion_producto='" . $descripcion . "',
                                        id_linea_producto='" . $linea . "',
                                        id_proveedor='" . $proveedor . "',
                                        inv_producto='" . $inv . "',
                                        iva_producto='" . $impuesto . "',
                                        estado_producto='" . $estado . "',
                                        costo_producto='" . $costo . "',
                                        utilidad_producto='" . $utilidad . "',
                                        valor_venta='" . $precio_venta . "',
                                        valor_alquiler='" . $precio_mayoreo . "',
                                        valor3_producto='" . $precio_especial . "',
                                        stock_producto='" . $stock . "',
                                        stock_min_producto='" . $stock_minimo . "'
                                        WHERE codigo_producto='" . $codigo . "'";
        $query_update = mysqli_query($conexion, $sql);
    } else {*/
        $sql = "INSERT INTO productos (codigo_producto, nombre_producto, descripcion_producto, id_linea_producto, 
                            id_proveedor, inv_producto, iva_producto, estado_producto, costo_producto, utilidad_producto, 
                            valor_venta,valor_alquiler,valor3_producto, stock_producto,stock_min_producto, date_added,id_imp_producto) 
                            VALUES ('$codigo','$nombre','$descripcion','$linea','$proveedor','$inv','$impuesto','$estado','$costo','$utilidad',
                            '$precio_venta','$precio_mayoreo','$precio_especial','$stock','$stock_minimo','$date_added','0')";
        //var_dump($sql);
        //echo $sql;

        $query_new_insert = mysqli_query($conexion, $sql);
        //var_dump($query_new_insert);

    //}
    //Seleccionamos el ultimo compo numero_fatura y aumentamos una
    $sql2         = mysqli_query($conexion, "select LAST_INSERT_ID(id_producto) as last from productos order by id_producto desc limit 0,1 ");
    $rw          = mysqli_fetch_array($sql2);
    $id_producto = $rw['last'];
    //var_dump($id_producto);
    $sql_img    = "SELECT * FROM tmp_imagen WHERE id_producto = $id_producto";
    //var_dump($sql_img);
    $query_img  = mysqli_query($conexion, $sql_img);
    $rw_img     = mysqli_fetch_array($query_img);
    $img_dir    = $rw_img['direccion'];
    $sql_upd_img = "UPDATE productos SET image_path='$img_dir' WHERE id_producto=$id_producto";
    $query_upd_img = mysqli_query($conexion, $sql_upd_img);
    if ($query_upd_img){

    }else{
        $errors[] = "Lo siento algo ha salido mal con la carga de imagen nuevamente." . mysqli_error($conexion);
    }

    //GURDAMOS LAS ENTRADAS EN EL KARDEX
    $saldo_total    = $stock * $costo;
    $sql_kardex     = mysqli_query($conexion, "select * from kardex where producto_kardex='" . $id_producto . "' order by id_kardex DESC LIMIT 1");
    $rww            = mysqli_fetch_array($sql_kardex);
    if($rww == null){
        $cant_saldo     =  $stock;
        $saldo_full     =  $saldo_total;
        if($cant_saldo == 0){
            $costo_promedio =  $saldo_total / 1;
        }else{
            $costo_promedio =  $saldo_total / $cant_saldo;
        }
        $tipo           = 5;
    }else{
        $cant_saldo     = $rww['cant_saldo'] + $stock;
        $saldo_full     = ($rww['total_saldo'] + $saldo_total);
        $costo_promedio = ($rww['total_saldo'] + $saldo_total) / $cant_saldo;
        $tipo           = 5;
    }
    
    guardar_entradas($date_added, $id_producto, $stock, $costo, $saldo_total, $cant_saldo, $costo_promedio, $saldo_full, $date_added, $users, $tipo);
//var_dump($query_new_insert);
//var_dump($query_update);
    if ($query_new_insert) {
        $messages[] = "Producto ha sido ingresado satisfactoriamente.";
        //echo '<script type="text/javascript"> jsfunction(); </script>';
    } else{
        $errors[] = "Lo siento algo ha salido mal intenta nuevamente." . mysqli_error($conexion);
    }
} else {
    $errors[] = "Error desconocido.";
}

if (isset($errors)) {

    ?>
        <div class="alert alert-danger" role="alert">
            <strong>Error!</strong>
            <?php
foreach ($errors as $error) {
        echo $error;
    }
    ?>
        </div>
        <?php
}
if (isset($messages)) {

    ?>
        <div class="alert alert-success" role="alert">
            <strong>¡Bien hecho!</strong>
            <?php
foreach ($messages as $message) {
        echo $message;
    }
    ?>
        </div>
        <?php
}

?>

<!-- <script type="text/javascript">
   function jsfunction(){
    $("#load_img").html(<img src="../../img/productos/default.jpg" class="thumb-img" width="200" alt="Bussines profile picture">);
   }
   
</script> -->