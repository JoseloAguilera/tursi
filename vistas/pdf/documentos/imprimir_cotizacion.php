
<?php
include '../../ajax/is_logged.php'; //Archivo verifica que el usario que intenta acceder a la URL esta logueado
?>
<style type="text/css">
    *{
        font-style:normal;
        font-weight:normal;
        font-size:12pt;
        font-family:Montserrat;
    }
    .container{
        width: 1000px;
    }
    .encabezado{
        width:1000px;
        height: auto;
        background-color: black;
        display: flex;
        justify-content: space-between;
        align-items: right;
        padding: 20px 0px 0px 0px;
    }
    
    .tabla-encabezado{
        color: white;
        td{
            padding: 2px 0px 2px 0px;
        }
        text-align: end !important;
    }

    hr{
        width: 1000px;
        height: 5px;
        margin: 0;
        background-color: blue;
    }

    .datos{
        height: auto;
        padding: 5px 0px 5px 0px;
    }
    table {border-collapse: collapse;}
    table td {padding: 0px}
    .izquierda{
        width: 100%;
        padding-left: 13px;
        align-items: center;
        border-bottom: solid 3px #cccccc; 
    }
    .derecha{
        width: 25%;
        align-items: center;
    }
    .linea{
        display: flex;
        height: 30px;
        align-items: center;
        background-color: #f2f2f2;
    }

    .silver{
        background-color: #f2f2f2;
        border: 2px solid #cccccc;
        
    }
    .clouds{
        background-color: #f2f2f2;
        border: 2px solid #cccccc;        
    }

    table, th, td {
  border: 1px solid black;
}
    th, td {
        padding: 2.5px !important;
    }

    .fondo-black{
        background: black;
        color: white;
        font-weight: bold !important;
    }

    .desglose{
        font-size: 18pt;
        height: 50px;
    }

    .izquierda > p{
        margin: 0 !important;
    }

    .derecha > p{
        margin: 0 !important;
    }

    .pies > p{
        text-align: center !important;
    }

</style> 
<?php
/* Connect To Database*/
require_once "../../db.php"; //Contiene las variables de configuracion para conectar a la base de datos
require_once "../../php_conexion.php"; //Contiene funcion que conecta a la base de datos
//Archivo de funciones PHP
include "../../funciones.php";
$users          = intval($_SESSION['id_users']);
$numero_factura = $_POST['id_factura'];
$simbolo_moneda = get_row('perfil', 'moneda', 'id_perfil', 1);
$sql01    = mysqli_query($conexion, "select * from cotizaciones, clientes where cotizaciones.id_cliente=clientes.id_cliente and numero_presupuesto='" . $numero_factura . "'");
$count          = mysqli_num_rows($sql01);
if ($count == 1) {
    $rw_factura         = mysqli_fetch_array($sql01);
    $id_cliente         = $rw_factura['id_cliente'];
    $nombre_cliente     = $rw_factura['nombre_cliente'];
    $empresa_cliente    = $rw_factura['nombre_cliente'];
    $telefono_cliente   = $rw_factura['telefono_cliente'];
    $numero_presupuesto = $rw_factura['numero_presupuesto'];
    $id_presupuesto     = $rw_factura['id_presupuesto'];
    $sql02              = mysqli_query($conexion, "select * from facturas_cot where id_presupuesto='" . $id_presupuesto . "'");
    $rw_presupuesto     = mysqli_fetch_array($sql02);
    $version            = $rw_presupuesto['version'];  
    $pie1               = $rw_presupuesto['pie1'];  
    $pie2               = $rw_presupuesto['pie2'];  
    $pie3               = $rw_presupuesto['pie3'];  
    $obs                = $rw_presupuesto['obs'];  
    if($rw_presupuesto['fecha_reserva'] == "0000-00-00"){
        $fecha_reserva = "A definir";
    }else{
        $fecha_reserva = $rw_presupuesto['fecha_reserva'];
    }
    
} else {
    header("location: new_cotizacion.php");
    exit;
}
?>

<page pageset='new' backtop='10mm' backbottom='10mm' backleft='20mm' backright='20mm' style="font-size: 11pt; font-family: arial" footer='page'>
<?php// include "encabezado_cotizacion.php";?>

<div class="container">
    <div class="encabezado">
        <div>
            <img src="../pdf/documentos/img/ri_1.png" alt="logo">
        </div>
        <div>
            <table class="tabla-encabezado" style="text-align: end;" >
                <tr>
                    <td style="border-bottom: white 4px double ;">Sinforiano Buzó Gómez 337 c/ <br >Tte. 1ero Nicolás Cazenave </td>
                </tr>
                <tr>
                    <td style="border-bottom: white 4px double ;">595 (991) 290 833 / (021) 670 791</td>
                </tr>
                <tr>
                    <td> info@tursiproducciones.com </td>
                </tr>
            </table>
            <h1 style="
                    color: white;
                    font-size: 25pt;
                    font-weight: 800;
                    margin-top: 3px;
                    margin-bottom: 0px;
                    padding-right: 11px;
                    ">PRESUPUESTO</h1>
        </div>
    </div>
    <hr>
    <div class="datos">
        <div>
            <div class="linea">
                <div class="izquierda">
                    <p> <b>Para:</b> <?php echo $nombre_cliente ?> </p>
                </div>
                <div class="derecha">
                    <p> Solicitud: <?php echo "13-03-2023"/* $nombre_cliente  */?> </p>
                </div>
            </div>
            <div class="linea">
                <div class="izquierda">
                    <p> Empresa: <?php echo $nombre_cliente ?> </p>
                </div>
                <div class="derecha">
                    <p> Reserva: <?php echo $fecha_reserva ?> </p>
                </div>
            </div>
            <div class="linea">
                <div class="izquierda" style="border-bottom: 0;">
                    <p> Contacto: <?php echo $telefono_cliente ?> </p>
                </div>
                <div class="derecha">
                    <p> Ppto: <?php echo $numero_presupuesto." - ".$version ?> </p>
                </div>
            </div>        
        
        </div>
        <div>

        </div>
        <div>

        </div>
    </div>
    <table cellspacing="0" style="margin-top: 10px">
        <tr style="border-bottom: solid 5px; border-color: blue;">
            <th colspan="7" class='fondo-black desglose' style="width: 10%; text-align: center;"> DESGLOSE DE PRESUPUESTO</th>
        </tr>
       
        <tr style="width: 100%;">
            <th class='fondo-black' style="width: 10%; text-align:center">COD.</th>
            <th class='fondo-black' style="width: 5%; text-align: center">JOR.</th>
            <th class='fondo-black' style="width: 5%; text-align: right">CANT.</th>
            <th class='fondo-black' style="width: 50%; text-align: center">DESCRIPCIÓN</th>
            <th class='fondo-black' style="width: 10%; text-align: center">PRECIO UNITARIO</th>
            <th class='fondo-black' style="width: 5%; text-align: right">DESCUENTO</th>
            <th class='fondo-black' style="width: 15%; text-align: right">TOTAL</th>

        </tr>



        <?php
$nums          = 1;
$impuesto      = get_row('perfil', 'impuesto', 'id_perfil', 1);
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
$sql           = mysqli_query($conexion, "select * from productos, detalle_fact_cot, facturas_cot where productos.id_producto=detalle_fact_cot.id_producto and detalle_fact_cot.id_version=facturas_cot.id_version and facturas_cot.id_presupuesto='" . $id_presupuesto . "'");


while ($row = mysqli_fetch_array($sql)) {
    $id_producto     = $row["id_producto"];
    $codigo_producto = $row['codigo_producto'];
    $cantidad        = $row['cantidad'];
    $jornada         = $row['jornada'];
    $desc_tmp        = $row['desc_venta'];
    $nombre_producto = $row['nombre_producto'];

    $precio_venta   = $row['precio_venta'];
    $precio_venta_f = number_format($precio_venta, 0, '', '.'); //Formateo variables
    //$precio_venta_r = str_replace(",", "", $precio_venta_f); //Reemplazo las comas
    $precio_total   = $precio_venta * $cantidad * $jornada;
    $final_items    = rebajas($precio_total, $desc_tmp); //Aplicando el descuento
    /*--------------------------------------------------------------------------------*/
    $precio_total_f = number_format($final_items, 0, '', '.'); //Precio total formateado
    //$precio_total_r = str_replace(",", "", $precio_total_f); //Reemplazo las comas
    $sumador_total += $final_items; //Sumador
    $subtotal = $sumador_total;
    if ($row['iva_producto'] == 10) {
        //$total_iva = iva($precio_venta);
        $sub_10 += $precio_total;
        $total_iva10 = $precio_total/11;
        $total_impuesto10 += (rebajas($total_iva10, $desc_tmp) * $cantidad);
    } elseif ($row['iva_producto'] == 5) {
        $sub_5 += $precio_total;
        $total_iva5 = $precio_total/21;
        $total_impuesto5 += (rebajas($total_iva5, $desc_tmp) * $cantidad);
    }else {
        $sub_0 += $precio_total;
        $total_iva0 = $precio_total;
        $total_impuesto0 += (rebajas($total_iva0, $desc_tmp) * $cantidad);
    }
    if ($nums % 2 == 0) {
        $clase = "clouds";
    } else {
        $clase = "silver";
    }
    ?>

    <tr>
        <td class='<?php echo $clase; ?>' style=" width: 10%; text-align: center"><?php echo $codigo_producto; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 5%; text-align: left"><?php echo $jornada; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 5%; text-align: right"><?php echo $cantidad; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 50%; text-align: left"><?php echo $nombre_producto; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 10%; text-align: right"><?php echo /* $simbolo_moneda . ' ' . */ $precio_venta_f; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 5%; text-align: right"><?php echo $desc_tmp; ?></td>
        <td class='<?php echo $clase; ?>' style=" width: 15%; text-align: right"><?php echo /* $simbolo_moneda . ' ' . */ $precio_total_f; ?></td>
    </tr>

    <?php

    $nums++;
}
//$total_factura = $subtotal;
?>

</div>

<tr>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
</tr>
<tr>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
    <td class='silver'><br></td>
</tr>
<!-- <tr>
    <td><br></td>
</tr>
</tr><tr>
    <td><br></td>
</tr> -->
<!-- <tr>
    <td colspan="3" style="widtd: 85%; text-align: right;">SUBTOTAL EXENTAS <?php echo $simbolo_moneda; ?> </td>
    <td style="widtd: 15%; text-align: right;"> <?php echo number_format($sub_0, 0, '', '.'); ?></td>
</tr>
<tr>
    <td colspan="3" style="widtd: 85%; text-align: right;">SUBTOTAL 5% <?php echo $simbolo_moneda; ?> </td>
    <td style="widtd: 15%; text-align: right;"> <?php echo number_format($sub_5, 0, '', '.'); ?></td>
</tr>
<tr>
    <td colspan="3" style="widtd: 85%; text-align: right;">SUBTOTAL 10% <?php echo $simbolo_moneda; ?> </td>
    <td style="widtd: 15%; text-align: right;"> <?php echo number_format($sub_10, 0, '', '.'); ?></td>
</tr>
<tr>
    <td colspan="3" style="widtd: 85%; text-align: right;">IVA 5% (<?php echo $impuesto; ?>)% <?php echo $simbolo_moneda; ?> </td>
    <td style="widtd: 15%; text-align: right;"> <?php echo number_format($total_impuesto5, 0, '', '.'); ?></td>
</tr>
<tr>
    <td colspan="3" style="widtd: 85%; text-align: right;">IVA 10% (<?php echo $impuesto; ?>)% <?php echo $simbolo_moneda; ?> </td>
    <td style="widtd: 15%; text-align: right;"> <?php echo number_format($total_impuesto10, 0, '', '.'); ?></td>
</tr> -->
<tr>
<td colspan="6" style="width: 85%; text-align: right; border: 1px solid white !important;;">TOTAL IVA INCL. <?php echo $simbolo_moneda; ?> </td>
<td class="silver" style="widtd: 15%; text-align: right;"> <?php echo number_format($subtotal, 0, '', '.'); ?></td>
</tr>
</table><br>
<hr>
<br>
<div class="pies">
    <p>
        <?php echo $pie1; ?> <br>
        <?php echo $pie2; ?> <br>
        <?php echo $pie3; ?> <br>
        <?php echo $obs; ?> <br>
    </p>
</div>
<div style="font-size:11pt;text-align:center;font-weight:bold">www.tursiproducciones.com</div> 

</page>
