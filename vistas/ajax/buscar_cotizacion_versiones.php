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
$id_presupuesto= $_SESSION['id_presupuesto'];
get_cadena($user_id);
$modulo = "Ventas";
permisos($modulo, $cadena_permisos);
//Finaliza Control de Permisos
$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != null) ? $_REQUEST['action'] : '';
if ($action == 'ajax') {
    // escaping, additionally removing everything that could be (html/javascript-) code
    //$q      = mysqli_real_escape_string($conexion, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
    $sTable = "facturas_cot INNER JOIN users ON facturas_cot.user = users.id_users";
    $sWhere = "";
    $sWhere .= " WHERE id_presupuesto='" .$id_presupuesto. "'";
    /*if ($_GET['q'] != "") {
        $sWhere .= " and  (clientes.nombre_cliente like '%$q%' or facturas_cot.numero_factura like '%$q%')";

    }*/

    $sWhere .= " order by id_version asc";
    include 'pagination.php'; //include pagination file
    //pagination variables
    $page      = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
    $per_page  = 10; //how much records you want to show
    $adjacents = 4; //gap between pages after number of adjacents
    $offset    = ($page - 1) * $per_page;
    //Count the total number of row in your table*/
    $count_query = mysqli_query($conexion, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
    $row         = mysqli_fetch_array($count_query);
    $numrows     = $row['numrows'];
    $total_pages = ceil($numrows / $per_page);
    $reload      = '../reportes/facturas.php';
    //main query to fetch the data
    $sql   = "SELECT facturas_cot.*, users.nombre_users, users.apellido_users FROM  $sTable $sWhere LIMIT $offset,$per_page";
    $query = mysqli_query($conexion, $sql);
    //loop through fetched data
    if ($numrows > 0) {
        echo mysqli_error($conexion);
        ?>
        <div class="table-responsive">
          <table class="table table-sm table-striped">
             <tr  class="info">
                <th>Fecha</th>
                <th>Pago</th>
                <th>Monto</th>
                <th>Usuario</th>
                <th>Reserva</th>
                <th>Versión</th>
                <th></th>

            </tr>
            <?php
while ($row = mysqli_fetch_array($query)) {
            $id_version       = $row['id_version'];
            $id_presupuesto   = $row['id_presupuesto'];
            $fecha            = date("d/m/Y", strtotime($row['fecha_version']));
            $estado_factura   = $row['condiciones'];
            if ($estado_factura == 1) {
                $text_estado = "CONTADO";
                $label_class = 'badge-success';} else {
                $text_estado = "CREDITO";
                $label_class = 'badge-danger';}
            $total_presu    = $row['monto_factura'];
            $simbolo_moneda = get_row('perfil', 'moneda', 'id_perfil', 1);
            $nombre_vendedor  = $row['nombre_users'] . " " . $row['apellido_users'];
            if($row['fecha_reserva'] != null){
                $reserva = date("d/m/Y", strtotime($row['fecha_reserva']));
            }else{
                $reserva = "A Definir";
            }
            
            $version = $row['version'];
            ?>
                        <tr>
                         <td><?php echo $fecha; ?></td>
                         <td><span class="badge <?php echo $label_class; ?>"><?php echo $text_estado; ?></span></td>
                         <td class='text-left'><b><?php echo $simbolo_moneda . ' ' . number_format($total_presu, 0,"","."); ?></b></td>
                         <td><?php echo $nombre_vendedor; ?></td>
                         <td><?php echo $reserva; ?></td>
                         <td><?php echo $version; ?></td>
                         
                         
                         <td class="text-center">
                          <div class="btn-group dropdown">
                            <button type="button" class="btn btn-warning btn-sm dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"> <i class='fa fa-cog'></i> <i class="caret"></i> </button>
                            <div class="dropdown-menu dropdown-menu-right">
                               <?php if ($permisos_editar == 1) {?>
                               <a class="dropdown-item" href="editar_cotizacion.php?id_version=<?php echo $id_version; ?>"><i class='fa fa-edit'></i> Editar</a>
                               <a class="dropdown-item" href="#" onclick="imprimir_factura('<?php echo $id_version; ?>');"><i class='fa fa-print'></i> Imprimir</a>
                               <?php }
            if ($permisos_eliminar == 1) {?>
                               <!--<a class="dropdown-item" href="#" data-toggle="modal" data-target="#dataDelete" data-id="<?php //echo $row['id_factura']; ?>"><i class='fa fa-trash'></i> Eliminar</a>-->
                               <?php }?>


                           </div>
                       </div>

                   </td>

               </tr>
               <?php
}
        ?>
           <tr>
              <td colspan=7><span class="pull-right"><?php
echo paginate($reload, $page, $total_pages, $adjacents);
        ?></span></td>
            </tr>
        </table>
    </div>
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
// fin else
}
?>