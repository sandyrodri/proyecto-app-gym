<!doctype html>
<html lang="en">
  <head>
    <title>Colorlib Fitnezz</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/rutina.css">
  </head>
  <body>
    
    <header role="banner">
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="index.php">Fit<span>up</span></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExample05">
            <ul class="navbar-nav mr-auto pl-lg-5 pl-0">
              <li class="nav-item">
                <a class="nav-link" href="index.php">Inicio</a>
              </li>
            </ul>
            
          </div>
        </div>
      </nav>
    </header>
    <!-- END header -->
    <!-- END slider -->
    <?php
	if(isset($_POST['usuario']) && isset($_POST['password'])) {
		$conexion = mysqli_connect("localhost", "root", "", "proyectofinal");
		$query = "SELECT id_nivel FROM login where usuario='".$_POST['usuario']."' and password='".$_POST['password']."'";
		$rs = mysqli_query($conexion, $query)  or die(mysqli_error($conexion));
		if($rs->num_rows !==0) {
			$row = mysqli_fetch_array($rs);
			$id_nivel = $row['id_nivel'];		
	?>
    <section class="home-slider-loop-false  inner-page owl-carousel">
	<div class="slider-item" style="background-image: url('img/slider-1.jpg');">
	  
	  <div class="container">
		<div class="row slider-text align-items-center justify-content-center">
		  <div class="col-md-8 text-center col-sm-12 element-animate">
			<h1>RUTINA </h1>
			</div>
		</div>
	  </div>

	</div>
  	</section>	
	  <section class="section rutina">
      <div class="container">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
            <div class="form-wrap overlap primary element-animate">	  
			<?php
			$conexion = mysqli_connect("localhost", "root", "", "proyectofinal");
			$query = "SELECT ejercicio, lunes, martes, miercoles, jueves, viernes, observaciones FROM ejercicios where id_nivel=".$id_nivel;
			$rs = mysqli_query($conexion, $query)  or die(mysqli_error($conexion));
			if($rs->num_rows !==0) {
				?>				
				<ul>
					<li><b>Lunes</b></li>
			<?php				
				while($row = mysqli_fetch_array($rs)) {
					if($row['lunes'] == 1) {
			?>
					<li><?php echo $row['ejercicio']. ' - '.$row['observaciones']?></li> 
			<?php
					}
				}
				?>
				</ul>
				<ul>
					<li><b>Martes</b></li>
			<?php			
				$rs->data_seek(0);	
				while($row = mysqli_fetch_array($rs)) {
					if($row['martes'] == 1) {
			?>
					<li><?php echo $row['ejercicio']. ' - '.$row['observaciones']?></li> 
			<?php
					}
				}
				?>
				</ul>				
				<ul>
					<li><b>Miercoles</b></li>
			<?php			
				$rs->data_seek(0);	
				while($row = mysqli_fetch_array($rs)) {
					if($row['miercoles'] == 1) {
			?>
					<li><?php echo $row['ejercicio']. ' - '.$row['observaciones']?></li> 
			<?php
					}
				}
				?>
				</ul>
				<ul>
					<li><b>Jueves</b></li>
			<?php			
				$rs->data_seek(0);	
				while($row = mysqli_fetch_array($rs)) {
					if($row['jueves'] == 1) {
			?>
					<li><?php echo $row['ejercicio']. ' - '.$row['observaciones']?></li> 
			<?php
					}
				}
				?>
				</ul>		
				<ul>
					<li><b>Viernes</b></li>
			<?php			
				$rs->data_seek(0);	
				while($row = mysqli_fetch_array($rs)) {
					if($row['viernes'] == 1) {
			?>
					<li><?php echo $row['ejercicio']. ' - '.$row['observaciones']?></li> 
			<?php
					}
				}
				?>
				</ul>										
				<?php
			}
			?>
            </div>
          </div>
          <div class="col-md-3"></div>
        </div>
      </div>
    </section>			

  	<?php			
			} else {
	?>
    <section class="home-slider-loop-false  inner-page owl-carousel">
	<div class="slider-item" style="background-image: url('img/slider-1.jpg');">
	  
	  <div class="container">
		<div class="row slider-text align-items-center justify-content-center">
		  <div class="col-md-8 text-center col-sm-12 element-animate">
			<h1>USUARIO/PASSWORD NO EXISTE</h1>
			<p><a href="login.php" class="btn btn-white btn-outline-white">Volver a Entrar</a></p>
		  </div>
		</div>
	  </div>

	</div>
	  </section>		<?php				
			}	
	}
	?>

    <footer class="site-footer" role="contentinfo">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 mb-5">
            <h3>Sobre nosotros</h3>
            <p class="mb-5">Pasa por nuestro gimnasio y hazte socio, tendrás acceso a tu rutina diaria a través de una web personal para ti.</p>
            <ul class="list-unstyled footer-link d-flex footer-social">
              <li><a href="#" class="p-2"><span class="fa fa-twitter"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-facebook"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-linkedin"></span></a></li>
              <li><a href="#" class="p-2"><span class="fa fa-instagram"></span></a></li>
            </ul>

          </div>
          <div class="col-md-5 mb-5">
            <h3>Datos de Contacto</h3>
            <ul class="list-unstyled footer-link">
              <li class="d-block">
                <span class="d-block">Dirección:</span>
                <span class="text-white">Calle de Jesus 99, Valencia España</span></li>
              <li class="d-block"><span class="d-block">Telefono:</span><span class="text-white">+1 99 999 999</span></li>
              <li class="d-block"><span class="d-block">Email:</span><span class="text-white">info@fitplus.com</span></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <h3>Enlaces</h3>
            <ul class="list-unstyled footer-link">
              <li><a href="index.php">Inicio</a></li>
            </ul>
          </div>
          <div class="col-md-3">
          
          </div>
        </div>
        <div class="row">
          <div class="col-12 text-md-center text-left">
            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> <br> Demo Images Unsplash</p>
          </div>
        </div>
      </div>
    </footer>
    <!-- END footer -->

    <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>

    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/magnific-popup-options.js"></script>

    <script src="js/main.js"></script>
  </body>
</html>