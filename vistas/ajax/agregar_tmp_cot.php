<?php

include 'is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
$session_id = session_id();
if (isset($_POST['id'])) {$id = $_POST['id'];}
if (isset($_POST['cantidad'])) {$cantidad = $_POST['cantidad'];}
if (isset($_POST['jornada'])) {$jornada = $_POST['jornada'];}
/* Connect To Database*/
require_once "../db.php";
require_once "../php_conexion.php";
//Archivo de funciones PHP
require_once "../funciones.php";

if (!empty($id) and !empty($cantidad)) {
    $id_producto  = get_row('productos', 'id_producto', 'codigo_producto', $id);
    $precio_venta = get_row('productos', 'valor_venta', 'id_producto', $id_producto);
    //var_dump($id_producto);
    //var_dump($precio_venta);
    // consulta para comparar el stock con la cantidad resibida
    $query = mysqli_query($conexion, "select stock_producto, inv_producto from productos where id_producto = '$id_producto'");
    $rw    = mysqli_fetch_array($query);
    $stock = $rw['stock_producto'];
    $inv   = $rw['inv_producto'];

    //Comprobamos si ya agregamos un producto a la tabla tmp_compra
    $comprobar = mysqli_query($conexion, "select * from tmp_cotizacion, productos where productos.id_producto = tmp_cotizacion.id_producto and  tmp_cotizacion.id_producto='" . $id_producto . "' and session_id='" . $session_id . "'");

    if ($row = mysqli_fetch_array($comprobar)) {
        $cant         = $row['cantidad_tmp'] + $cantidad;
        $jor          = $row['jornada_tmp'] + $jornada;
        $sql          = "UPDATE tmp_cotizacion SET cantidad_tmp='" . $cant . "', jornada_tmp='" . $jor . "' WHERE id_producto='" . $id_producto . "' and session_id='" . $session_id . "'";
        $query_update = mysqli_query($conexion, $sql);
    } else {
        $insert_tmp = mysqli_query($conexion, "INSERT INTO tmp_cotizacion (id_producto,cantidad_tmp,precio_tmp,jornada_tmp,desc_tmp,session_id) VALUES ('$id_producto','$cantidad','$jornada','$precio_venta','0','$session_id')");

    }

}
if (isset($_GET['id'])) //codigo elimina un elemento del array
{
    $id_tmp = intval($_GET['id']);
    $delete = mysqli_query($conexion, "DELETE FROM tmp_cotizacion WHERE id_tmp='" . $id_tmp . "'");
}
$simbolo_moneda = get_row('perfil', 'moneda', 'id_perfil', 1);
?>
<div class="table-responsive">
    <table class="table table-sm">
        <thead class="thead-default">
            <tr>
                <th class='text-center'>COD</th>
                <th class='text-center'>CANT.</th>
                <th class='text-center'>JOR.</th>
                <th class='text-center'>DESCRIP.</th>
                <th class='text-center'>PRECIO <?php echo $simbolo_moneda; ?></th>
                <th class='text-center'>DESC %</th>
                <th class='text-right'>TOTAL</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php
//$impuesto       = get_row('perfil', 'impuesto', 'id_perfil', 1);
//$nom_impuesto   = get_row('perfil', 'nom_impuesto', 'id_perfil', 1);
$sumador_total  = 0;
$total_iva0      = 0;
$total_iva5      = 0;
$total_iva10      = 0;
$total_impuesto0 = 0;
$total_impuesto5 = 0;
$total_impuesto10 = 0;
$sub_0=0;
$sub_5=0;
$sub_10=0;
$subtotal       = 0;
$sql            = mysqli_query($conexion, "select * from productos, tmp_cotizacion where productos.id_producto=tmp_cotizacion.id_producto and tmp_cotizacion.session_id='" . $session_id . "'");
while ($row = mysqli_fetch_array($sql)) {
    $id_tmp          = $row["id_tmp"];
    $id_producto     = $row['id_producto'];
    $codigo_producto = $row['codigo_producto'];
    $cantidad        = $row['cantidad_tmp'];
    $jornada         = $row['jornada_tmp'];
    $desc_tmp        = $row['desc_tmp'];
    $nombre_producto = $row['nombre_producto'];

    $precio_venta   = $row['precio_tmp'];
    $precio_venta_f = number_format($precio_venta, 0, '', ''); //Formateo variables
   // $precio_venta_r = str_replace(",", "", $precio_venta_f); //Reemplazo las comas
    $precio_total   = $precio_venta * $cantidad * $jornada;
    $final_items    = rebajas($precio_total, $desc_tmp); //Aplicando el descuento
    /*--------------------------------------------------------------------------------*/
    $precio_total_f = number_format($final_items, 0, '', '.'); //Precio total formateado
    //$precio_total_r = str_replace(",", "", $precio_total_f); //Reemplazo las comas
    $sumador_total += $final_items; //Sumador
    $subtotal = $sumador_total;
    if ($row['iva_producto'] == 10) {
        //$total_iva = iva($precio_venta);
        $sub_10 += $final_items;
        $total_iva10 = $precio_total/11;
        $total_impuesto10 += (rebajas($total_iva10, $desc_tmp));
    } elseif ($row['iva_producto'] == 5) {
        $sub_5 += $final_items;
        $total_iva5 = $precio_total/21;
        $total_impuesto5 += (rebajas($total_iva5, $desc_tmp));
    }else {
        $sub_0 += $final_items;
        $total_iva0 = $precio_total;
        $total_impuesto0 += (rebajas($total_iva0, $desc_tmp));
    }
    
    ?>
    <tr>
        <td class='text-center' ><?php echo $codigo_producto; ?></td>
        <td class='text-center'><?php echo $cantidad; ?></td>
        <td align="right" width="7%">
                <input type="text" class="form-control txt_jor" style="text-align:center" value="<?php echo $jornada; ?>" id="<?php echo $id_tmp; ?>">
        </td>
        <td><?php echo $nombre_producto; ?></td>
        <td class='text-center'>
            <div class="input-group">
                <select id="<?php echo $id_tmp; ?>" class="form-control employee_id">
                    <?php
$sql1 = mysqli_query($conexion, "select * from productos where id_producto='" . $id_producto . "'");
    while ($rw1 = mysqli_fetch_array($sql1)) {
        ?>
                        <option selected disabled value="<?php echo $precio_venta ?>"><?php echo number_format($precio_venta, 0,'','.'); ?></option>
                        <!-- <option value="<?php echo $rw1['valor_venta'] ?>">PV <?php echo number_format($rw1['valor_venta'], 0,'','.'); ?></option> -->
                        <option value="<?php echo $rw1['valor_alquiler'] ?>">PM <?php echo number_format($rw1['valor_alquiler'], 0,'','.'); ?></option>
                        <!-- <option value="<?php echo $rw1['valor3_producto'] ?>">PE <?php echo number_format($rw1['valor3_producto'], 0,'','.'); ?></option> -->
                        <?php
}
    ?>
                </select>
            </div>
        </td>
        <td align="right" width="15%">
            <input type="text" class="form-control txt_desc" style="text-align:center" value="<?php echo $desc_tmp; ?>" id="<?php echo $id_tmp; ?>">
        </td>
        <td class='text-right'><?php echo $simbolo_moneda . ' ' . number_format($final_items, 0,'','.'); ?></td>
        <td class='text-center'>
            <a href="#" class='btn btn-danger btn-sm waves-effect waves-light' onclick="eliminar('<?php echo $id_tmp ?>')"><i class="fa fa-remove"></i>
            </a>
        </td>
    </tr>
    <?php
}
$total_factura = $subtotal;
?>
<tr>
    <td class='text-right' colspan=5>SUBTOTAL EXENTAS</td>
    <td class='text-right'><b><?php echo $simbolo_moneda . ' ' . number_format($sub_0, 0, '', '.'); ?></b></td>
    <td></td>
</tr>
<tr>
    <td class='text-right' colspan=5>SUBTOTAL 5%</td>
    <td class='text-right'><b><?php echo $simbolo_moneda . ' ' . number_format($sub_5, 0, '', '.'); ?></b></td>
    <td></td>
</tr>
<tr>
    <td class='text-right' colspan=5>SUBTOTAL 10%</td>
    <td class='text-right'><b><?php echo $simbolo_moneda . ' ' . number_format($sub_10, 0, '', '.'); ?></b></td>
    <td></td>
</tr>
<tr>
    <td class='text-right' colspan=5><?php echo "Exentas"; ?> </td>
    <td class='text-right'><?php echo $simbolo_moneda . ' ' . number_format($total_impuesto0, 0, '', '.'); ?>
    </td>
    <td></td>
</tr>
<tr>
    <td class='text-right' colspan=5><?php echo "IVA 5 %"; ?> </td>
    <td class='text-right'><?php echo $simbolo_moneda . ' ' . number_format($total_impuesto5, 0, '', '.'); ?>
    </td>
    <td></td>
</tr>
<tr>
    <td class='text-right' colspan=5><?php echo "IVA 10 %"; ?> </td>
    <td class='text-right'><?php echo $simbolo_moneda . ' ' . number_format($total_impuesto10, 0, '', '.'); ?>
    </td>
    <td></td>
</tr>
<tr>
    <td style="font-size: 14pt;" class='text-right' colspan=5><b>TOTAL <?php echo $simbolo_moneda; ?></b></td>
    <td style="font-size: 16pt;" class='text-right'><b><?php echo number_format($total_factura, 0, '', '.'); ?></b></td>
    <td></td>
</tr>
</tbody>
</table>
</div>
<?php 
//Inicia Control de Permisos
include "../permisos.php";
$user_id = $_SESSION['id_users'];
get_cadena($user_id);
$modulo = "Ventas";
permisos($modulo, $cadena_permisos);
//Finaliza Control de Permisos
//var_dump($permisos_eliminar);
?>
<input type="hidden" id="permiso" value="<?php echo $permisos_eliminar; ?>">
<script>
    $(document).ready(function () {
        permiso = document.getElementById('permiso').value;
        $('.txt_desc').off('blur');
        $('.txt_desc').on('blur',function(event){
            var keycode = (event.keyCode ? event.keyCode : event.which);
        // if(keycode == '13'){
            id_tmp = $(this).attr("id");
            desc = $(this).val();
             //Inicia validacion
             
             //console.log(permiso);
             if(permiso == "1"){
                if (isNaN(desc)) {
                    $.Notification.notify('error','bottom center','ERROR', 'DIGITAR UN DESCUENTO VALIDO')
                    $(this).focus();
                    return false;
                }
             }else{
                if (isNaN(desc) || desc > 20) {
                    $.Notification.notify('error','bottom center','ERROR', 'DIGITAR UN DESCUENTO VALIDO')
                    $(this).focus();
                    return false;
                }
             }
             
    //Fin validacion
    $.ajax({
        type: "POST",
        url: "../ajax/editar_desc_cot.php",
        data: "id_tmp=" + id_tmp + "&desc=" + desc,
        success: function(datos) {
         $("#resultados").load("../ajax/agregar_tmp_cot.php");
         $.Notification.notify('success','bottom center','EXITO!', 'DESCUENTO ACTUALIZADO CORRECTAMENTE')
     }
 });
        // }
    });

          $(".employee_id").on("change", function(event) {
         id_tmp = $(this).attr("id");
        precio = $(this).val();
        $.ajax({
            type: "POST",
            url: "../ajax/editar_precio_cot.php",
            data: "id_tmp=" + id_tmp + "&precio=" + precio,
            success: function(datos) {
               $("#resultados").load("../ajax/agregar_tmp_cot.php");
               $.Notification.notify('success','bottom center','EXITO!', 'PRECIO ACTUALIZADO CORRECTAMENTE')
           }
       });
    });

    });
    
     // INICIA VERIFICACION DE JORNADAS
     $(document).ready(function () {
        permiso = document.getElementById('permiso').value;
        $('.txt_jor').off('blur');
        $('.txt_jor').on('blur',function(event){
            var keycode = (event.keyCode ? event.keyCode : event.which);
        // if(keycode == '13'){
            id_tmp = $(this).attr("id");
            jorn = $(this).val();
             //Inicia validacion
             
             //console.log(permiso);
             if(permiso == "1"){
                if (isNaN(jorn)) {
                    $.Notification.notify('error','bottom center','ERROR', 'DIGITAR UN NÚMERO VÁLIDO')
                    $(this).focus();
                    return false;
                }
             }
             
    //Fin validacion
    $.ajax({
        type: "POST",
        url: "../ajax/editar_jornada_cot.php",
        data: "id_tmp=" + id_tmp + "&jorn=" + jorn,
        success: function(datos) {
           $("#resultados").load("../ajax/agregar_tmp_cot.php");
           $.Notification.notify('success','bottom center','EXITO!', 'JORNADA ACTUALIZADA CORRECTAMENTE')
       }
   });
        // }
    });
     $(".employee_id").on("change", function(event) {
        id_tmp = $(this).attr("id");
        precio = $(this).val();
        $.ajax({
            type: "POST",
            url: "../ajax/editar_precio_cot.php",
            data: "id_tmp=" + id_tmp + "&precio=" + precio,
            success: function(datos) {
               $("#resultados").load("../ajax/agregar_tmp_cot.php");
               $.Notification.notify('success','bottom center','EXITO!', 'PRECIO ACTUALIZADO CORRECTAMENTE')
           }
       });
    });

    });
</script>