<?php
include 'is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
$session_id = session_id();
$id_factura = $_SESSION['id_version'];
if (isset($_POST['id'])) {$id = $_POST['id'];}
if (isset($_POST['cantidad'])) {$cantidad = $_POST['cantidad'];}
if (isset($_POST['jornada'])) {$jornada = $_POST['jornada'];}

/* Connect To Database*/
require_once "../db.php";
require_once "../php_conexion.php";
//Archivo de funciones PHP
require_once "../funciones.php";

if (!empty($id) and !empty($cantidad) and !empty($jornada)  ) {
    $id_producto    = get_row('productos', 'id_producto', 'codigo_producto', $id);
    /* $id_version = get_row('facturas_cot', 'numero_factura', 'id_factura', $id_factura); */
    $precio_venta   = get_row('productos', 'valor_venta', 'id_producto', $id_producto);

    // consulta para comparar el stock con la cantidad resibida
    $query = mysqli_query($conexion, "select stock_producto, inv_producto from productos where id_producto = '$id_producto'");
    $rw    = mysqli_fetch_array($query);
    $stock = $rw['stock_producto'];
    $inv   = $rw['inv_producto'];

    //Comprobamos si ya agregamos un producto a la tabla detalle_fact_cot
    $comprobar = mysqli_query($conexion, "select * from detalle_fact_cot where id_producto='" . $id_producto . "' and id_version='" . $id_factura . "'");

    if ($row = mysqli_fetch_array($comprobar)) {
        $cant = $row['cantidad'] + $cantidad;
        $jor          = $row['jornada_tmp'] + $jornada;
        $sql          = "UPDATE detalle_fact_cot SET cantidad='" . $cant . "', jornada='" . $jor . "' WHERE id_producto='" . $id_producto . "' and id_version='" . $id_factura . "'";
        $query_update = mysqli_query($conexion, $sql);
        echo "<script> $.Notification.notify('warning','bottom center','NOTIFICACIÓN', 'CANTIDAD AGREGADA AL PRESUPUESTO')</script>";
    
    } else {
            $insert_tmp = mysqli_query($conexion, "INSERT INTO detalle_fact_cot (id_version,id_producto,cantidad,jornada,precio_venta) VALUES ('$id_factura','$id_producto','$cantidad','1','$precio_venta')");
            echo "<script> $.Notification.notify('warning','bottom center','NOTIFICACIÓN', 'PRODUCTO AGREGADO AL PRESUPUESTO')</script>";
        }
        // fin codicion cantaidad
    }


if (isset($_GET['id'])) //codigo elimina un elemento del array
{
    $id_detalle = intval($_GET['id']);
    $id_prod    = get_row('detalle_fact_cot', 'id_producto', 'id_detalle', $id_detalle);
    //$quantity   = get_row('detalle_fact_cot', 'cantidad', 'id_detalle', $id_detalle);
    $delete     = mysqli_query($conexion, "DELETE FROM detalle_fact_cot WHERE id_detalle='" . $id_detalle . "'");
}
$simbolo_moneda = get_row('perfil', 'moneda', 'id_perfil', 1);
?>
<div class="table-responsive">
    <table class="table table-sm">
        <thead class="thead-default">
            <tr>
                <th class='text-center'>Cod</th>
                <th class='text-center'>Cant.</th>
                <th class='text-center'>Jor.</th>
                <th class='text-center'>Producto.</th>
                <th class='text-center'>Precio <?php echo $simbolo_moneda; ?></th>
                <th class='text-center'>Desc %</th>
                <th class='text-right'>Total</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php
$impuesto       = get_row('perfil', 'impuesto', 'id_perfil', 1);
$nom_impuesto   = get_row('perfil', 'nom_impuesto', 'id_perfil', 1);
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
$subtotal=0;
$sql            = mysqli_query($conexion, "select * from productos, facturas_cot, detalle_fact_cot where facturas_cot.id_version=detalle_fact_cot.id_version and  facturas_cot.id_version='$id_factura' and productos.id_producto=detalle_fact_cot.id_producto");
//var_dump($id_factura);
while ($row = mysqli_fetch_array($sql)) {
    $id_detalle      = $row["id_detalle"];
    $id_producto     = $row["id_producto"];
    $codigo_producto = $row['codigo_producto'];
    $cantidad        = $row['cantidad'];
    $jornada         = $row['jornada'];
    $desc_tmp        = $row['desc_venta'];
    $nombre_producto = $row['nombre_producto'];

    $precio_venta    = $row['precio_venta'];
    $precio_venta_f = number_format($precio_venta, 0, '', ''); //Formateo variables
    //$precio_venta_r = str_replace(",", "", $precio_venta_f); //Reemplazo las comas
    $precio_total   = $precio_venta * $cantidad;
    $final_items    = rebajas($precio_total, $desc_tmp); //Aplicando el descuento
    /*--------------------------------------------------------------------------------*/
    $precio_total_f = number_format($final_items, 0, '', ''); //Precio total formateado
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
//var_dump($sumador_total);
    ?>
    <tr>
        <td class='text-center' width="7%"><?php echo $codigo_producto; ?></td>
        <td class='text-center' width="7%"><?php echo $cantidad; ?></td>
        <td align="right" width="7%">
            <input type="text" class="form-control txt_jor" style="text-align:center" value="<?php echo $jornada; ?>" id="<?php echo $id_detalle; ?>">
        </td>
        <td><?php echo $nombre_producto; ?></td>
        <td class='text-center'>
            <div class="input-group">
                <select id="<?php echo $id_detalle; ?>" class="form-control employee_id">
                    <?php
$sql1 = mysqli_query($conexion, "select * from productos where id_producto='" . $id_producto . "'");
    while ($rw1 = mysqli_fetch_array($sql1)) {
        ?>
                        <option selected disabled value="<?php echo $precio_venta ?>"><?php echo number_format($precio_venta, 0, '', ''); ?></option>
                        <!-- <option value="<?php echo $rw1['valor_venta'] ?>">PV <?php echo number_format($rw1['valor_venta'], 0, '', ''); ?></option> -->
                        <option value="<?php echo $rw1['valor_alquiler'] ?>">PM <?php echo number_format($rw1['valor_alquiler'], 0, '', ''); ?></option>
                        <!-- <option value="<?php echo $rw1['valor3_producto'] ?>">PE <?php echo number_format($rw1['valor3_producto'], 0, '', ''); ?></option> -->
                        <?php
}
    ?>
                </select>
            </div>
        </td> 
        <td align="right" width="10%">
            <input type="text" class="form-control txt_desc" style="text-align:center" value="<?php echo $desc_tmp; ?>" id="<?php echo $id_detalle; ?>">
        </td>
        <td class='text-right'  width="10%"><?php echo $simbolo_moneda . ' ' . number_format($final_items, 0, '', '.'); ?></td>
        <td class='text-center'>
            <a href="#" class='btn btn-danger btn-sm waves-effect waves-light' onclick="eliminar('<?php echo $id_detalle ?>')"><i class="fa fa-remove"></i>
            </a>
        </td>
    </tr>
    <?php
}
$total_factura = $subtotal;
$update        = mysqli_query($conexion, "update facturas_cot set monto_factura='$total_factura' where id_factura='$id_factura'");

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
    <td style="font-size: 16pt;" class='text-right'><span class="label label-danger"><b><?php echo number_format($total_factura, 0, '', ''); ?></b></span></td>
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
            id_detalle = $(this).attr("id");
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
        url: "../ajax/editar_desc_cot2.php",
        data: "id_detalle=" + id_detalle + "&desc=" + desc,
        success: function(datos) {
         $("#resultados").load("../ajax/editar_tmp_cot.php");
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
            url: "../ajax/editar_precio_cot2.php",
            data: "id_detalle=" + id_tmp + "&precio=" + precio,
            success: function(datos) {
               $("#resultados").load("../ajax/editar_tmp_cot.php");
               $.Notification.notify('success','bottom center','EXITO!', 'PRECIO ACTUALIZADO CORRECTAMENTE')
           }
       });
    });

    });
</script>