<?php
session_start();
if (!isset($_SESSION['user_login_status']) and $_SESSION['user_login_status'] != 1) {
    header("location: ../../login.php");
    exit;
}

/* Connect To Database*/
require_once "../db.php"; //Contiene las variables de configuracion para conectar a la base de datos
require_once "../php_conexion.php"; //Contiene funcion que conecta a la base de datos
//Inicia Control de Permisos
include "../permisos.php";
$user_id = $_SESSION['id_users'];
get_cadena($user_id);
$modulo = "Reportes";
permisos($modulo, $cadena_permisos);
//Finaliza Control de Permisos
$Reportes = 1;
?>
<?php require 'includes/header_start.php';?>

<?php require 'includes/header_end.php';?>

<!-- Begin page -->
<div id="wrapper">

	<?php require 'includes/menu.php';?>

	<!-- ============================================================== -->
	<!-- Start right Content here -->
	<!-- ============================================================== -->
	<div class="content-page">
		<!-- Start content -->
		<div class="content">
			<div class="container">
				<?php if ($permisos_ver == 1) {
    ?>
					<div class="col-lg-12">
						<div class="portlet">
							<div class="portlet-heading bg-primary">
								<h3 class="portlet-title">
									Reporte Finaciero
								</h3>
								<div class="portlet-widgets">
									<a href="javascript:;" data-toggle="reload"><i class="ion-refresh"></i></a>
									<span class="divider"></span>
									<a data-toggle="collapse" data-parent="#accordion1" href="#bg-primary"><i class="ion-minus-round"></i></a>
									<span class="divider"></span>
									<a href="#" data-toggle="remove"><i class="ion-close-round"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div id="bg-primary" class="panel-collapse collapse show">
								<div class="portlet-body">

									<form class="form-horizontal" role="form" id="datos_cotizacion">

										<div class="form-group row">

											<div class="col-xs-3">
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control daterange pull-right" value="<?php echo "01" . date('/m/Y') . ' - ' . date('d/m/Y'); ?>" id="range" readonly>

												</div><!-- /input-group -->
											</div>

											<div class="col-xs-4">
												<div class="input-group">
													<select name='vendedor' id='vendedor' class="form-control" onchange="load(1);">
														<option value="">-- Selecciona Vendedor --</option>
														<option value="">Todos</option>
														<?php
														    $query_categoria = mysqli_query($conexion, "select * from users order by id_users");
    														while ($rw = mysqli_fetch_array($query_categoria)) {
        													?>
																<option value="<?php echo $rw['id_users']; ?>"><?php echo $rw['nombre_users']; ?></option>
															<?php
															}
    														?>
													</select>
													<span class="input-group-btn">
														<button class="btn btn-outline-info btn-rounded waves-effect waves-light" type="button" onclick='load(1);'><i class='fa fa-search'></i></button>
													</span>
												</div>
											</div>
											<div class="col-xs-1">
												<div id="loader" class="text-center"></div>
											</div>

											<div class="col-xs-5 ">
												<div class="btn-group pull-right">
														<?php if ($permisos_editar == 1) {?>
														<div class="btn-group dropup">
															<button aria-expanded="false" class="btn btn-outline-default btn-rounded waves-effect waves-light" data-toggle="dropdown" type="button">
																<i class='fa fa-file-text'></i> Reporte
																<span class="caret">
																</span>
															</button>
															<div class="dropdown-menu">
																<!--a class="dropdown-item" href="#" onclick="reporte();">
																	<i class='fa fa-file-pdf-o'></i> PDF
																</a-->
																<a class="dropdown-item" href="#" onclick="reporte_excel();">
																	<i class='fa fa-file-excel-o'></i> Excel
																</a>
															</div>
														</div>
														<?php }?>
													</div>
											</div>
										</div>
									</form>
									<div class="datos_ajax_delete"></div><!-- Carga los datos ajax -->
									<div class='outer_div'></div><!-- Carga los datos ajax -->


								</div>
							</div>
						</div>
					</div>

					<?php
} else {
    ?>
					<section class="content">
						<div class="alert alert-danger" align="center">
							<h3>Acceso denegado! </h3>
							<p>No cuentas con los permisos necesario para acceder a este módulo.</p>
						</div>
					</section>
					<?php
}
?>


			</div>
			<!-- end container -->
		</div>
		<!-- end content -->

		<?php require 'includes/pie.php';?>

	</div>
	<!-- ============================================================== -->
	<!-- End Right content here -->
	<!-- ============================================================== -->


</div>
<!-- END wrapper -->

<?php require 'includes/footer_start.php'
?>
<!-- ============================================================== -->
<!-- Todo el codigo js aqui -->
<!-- ============================================================== -->
<script type="text/javascript" src="../../js/VentanaCentrada.js"></script>
<script>
	$(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
    });
	$(function() {
		load(1);

//Date range picker
$('.daterange').daterangepicker({
	buttonClasses: ['btn', 'btn-sm'],
	applyClass: 'btn-success',
	cancelClass: 'btn-default',
	locale: {
		format: "DD/MM/YYYY",
		separator: " - ",
		applyLabel: "Aplicar",
		cancelLabel: "Cancelar",
		fromLabel: "Desde",
		toLabel: "Hasta",
		customRangeLabel: "Custom",
		daysOfWeek: [
		"Do",
		"Lu",
		"Ma",
		"Mi",
		"Ju",
		"Vi",
		"Sa"
		],
		monthNames: [
		"Enero",
		"Febrero",
		"Marzo",
		"Abril",
		"Mayo",
		"Junio",
		"Julio",
		"Agosto",
		"Septiembre",
		"Octubre",
		"Noviembre",
		"Diciembre"
		],
		firstDay: 1
	},
	opens: "right"

});
});
	function load(page){
    var range=$("#range").val();
    var vendedor=$("#vendedor").val();
    var parametros = {"action":"ajax","page":page,'range':range,'vendedor':vendedor	};
    $("#loader").fadeIn('slow');
    $.ajax({
      url:'../ajax/rep_financiero.php',
      data: parametros,
      beforeSend: function(objeto){
        $("#loader").html("<img src='../../img/ajax-loader.gif'>");
      },
      success:function(data){
        $(".outer_div").html(data).fadeIn('slow');
        $("#loader").html("");
      }
    })
  }
</script>
<script>
  function reporte(){
    var daterange=$("#range").val();
    var categoria=$("#categoria").val();

    VentanaCentrada('../pdf/documentos/rep_financiero.php?daterange='+daterange+"&vendedor="+vendedor,'Reporte','','800','600','true');
  }
  function reporte_excel(){
			var range=$("#range").val();
			 var vendedor=$("#vendedor").val();
			window.location.replace("../excel/rep_financiero.php?range="+range+"&vendedor="+vendedor);
    //VentanaCentrada('../excel/rep_gastos.php?daterange='+daterange+"&employee_id="+employee_id,'Reporte','','500','25','true');+"&tipo="+tipo
}
</script>

<?php require 'includes/footer_end.php'
?>

