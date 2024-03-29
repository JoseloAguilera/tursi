<?php
include 'is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/*Inicia validacion del lado del servidor*/
if (
    !empty($_POST['mod_codigo']) &&
    !empty($_POST['mod_nombre']) &&
    $_POST['mod_linea'] != "" &&
    $_POST['mod_inv'] != "" &&
    $_POST['mod_impuesto'] != "" &&
    $_POST['mod_estado'] != "" &&
    !empty($_POST['mod_preciom']) 
) {
    /* Connect To Database*/
    require_once "../db.php";
    require_once "../php_conexion.php";
    // escaping, additionally removing everything that could be (html/javascript-) code
    $codigo      = mysqli_real_escape_string($conexion, (strip_tags($_POST["mod_codigo"], ENT_QUOTES)));
    $nombre      = mysqli_real_escape_string($conexion, (strip_tags($_POST["mod_nombre"], ENT_QUOTES)));
    $descripcion = mysqli_real_escape_string($conexion, (strip_tags($_POST["mod_descripcion"], ENT_QUOTES)));
    $linea       = intval($_POST['mod_linea']);
    if(isset($_POST['mod_proveedor'])){
        $proveedor   = intval($_POST['mod_proveedor']);
    }else{
        $proveedor = "";
    }
    
    //$medida          = intval($_POST['mod_medida']);
    $inv      = intval($_POST['mod_inv']);
    $impuesto = intval($_POST['mod_impuesto']);
    $estado   = intval($_POST['mod_estado']);
    //$imp             = intval($_POST['id_imp2']);
    $costo           = floatval($_POST['mod_costo']);
    $utilidad        = 0;//floatval($_POST['mod_utilidad']);
    $precio_venta    = floatval($_POST['mod_precio']);
    $precio_mayoreo  = floatval($_POST['mod_preciom']);
    $precio_especial = 0; //floatval($_POST['mod_precioe']);
    $stock           = floatval($_POST['mod_stock']);
    $stock_minimo    = floatval($_POST['mod_minimo']);
    $id_producto     = $_POST['mod_id'];
    $sql             = "UPDATE productos SET codigo_producto='" . $codigo . "',
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
                                        WHERE id_producto='" . $id_producto . "'";
    $query_update = mysqli_query($conexion, $sql);
    if ($query_update) {
        $messages[] = "Producto ha sido actualizado satisfactoriamente.";
    } else {
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