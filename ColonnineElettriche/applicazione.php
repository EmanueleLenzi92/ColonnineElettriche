<!DOCTYPE html>
<?php
include ('apiDB/config.php');

//prepare query
$query = "SELECT * from province";
$query2 = "SELECT * from consumi_auto";

?>

<html lang="en">

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
    <title>Articolo auto elettriche - Applicazione</title>  
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
	

   

	
	
	<!-- leaflet main -->
   <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" />
   <!--[if lte IE 8]><link rel="stylesheet" href="leaflet/leaflet.ie.css" /><![endif]-->
  
   
   <!-- leaflet draw -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.3/leaflet.draw.css"/>
	
   


    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	
	<style>
   .button_App {
	  display: inline-block;
	  
	  margin: 1em;
	}
	.after-button_App {
	  clear: left;
	}
	
	#map{height: 500px}
	
	#buttonSubmit{
		
		padding: 15px 32px;
		color: darkorange;
		cursor: pointer;
		
	}
	
	#loadApp{display:none; text-align:center;}
	
	
   </style>

</head>
<body class="seo_version">

	<!-- LOADER -->
	<div id="preloader">
		<div class="loader-wrapper"  >
			<div class="loader-new">
				<img src="images/autogif.gif" alt="" />
				<!--
				<div class="ball"></div>
				<div class="ball"  ></div>
				<div class="ball"></div>-->
			</div>
			<div class="text">   LOADING...</div>
		</div>
	</div>
	<!-- END LOADER -->

    <!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html">
					<img src="images/logoweb.png" alt="logo"/>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-seo" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
								<div class="collapse navbar-collapse" id="navbars-seo">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
						<li class="nav-item active"><a class="nav-link" href="applicazione.php">App</a></li>
						<li class="nav-item"><a class="nav-link" href="interviste.html">Interviste</a></li>
						<li class="nav-item"><a class="nav-link" href="approfondimenti.html">Approfondimenti</a></li>
						<li class="nav-item"><a class="nav-link" href="fonti.html">Fonti</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Credits</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->

    <div class="all-page-title" style="background-image:url(images/pattern-4.png);">
		<!--Page -->
        <div class="page-info">
            <div class="container">
            	<div class="inner-container">
                    <ul class="bread-crumb">
                        <li><a href="index.html">Home</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i></li>
                        <li><span>Applicazione</span></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--End Page-->
        <div class="container text-center">
            <h1>Applicazione</h1>
			<p>Ma quindi dove si trovano le colonnine elettriche e i punti di ricarica? Come può il possessore di auto elettrica pianificare il suo viaggio e le eventuali ricariche? </p>
        </div>
    </div><!-- end section -->

    <div id="services" class="section lb">
        <div class="container-fluid">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p>
						Siamo partiti riunendo tutti i dati raccolti in modo da ricostruire le coordinate geografiche delle stazioni di ricarica. Il dataset ottenuto comprende latitudine, longitudine e caratteristiche 
						di ogni singola stazione.
						Sulla base del dataset abbiamo poi costruito un’applicazione che permette di selezionare la tipologia dell’auto elettrica (ne abbiamo selezionata una casistica rappresentativa dai modelli più popolari) che verrà utilizzata 
						per il viaggio, la località di partenza e quella di destinazione. La mappa è un importante passo avanti per avvicinare ancora di più le persone alla mobilità elettrica e ispirarle a questa forma innovativa di mobilità. 
						Premendo il tasto di avvio sulla mappa viene mostrato il percorso più idoneo, con l’indicazione dei km da percorrere e del numero di ricariche presumibilmente necessarie. Lungo il percorso sono segnalate tutte le colonnine 
						disponibili, selezionate attraverso la funzione raggio, che permette di definire entro quale raggio di deviazione, rispetto al percorso segnalato, si vogliono individuare le colonnine di ricarica. Tutto questo fa sì che
						 l’utente possa organizzarsi più consapevolmente.
						L’applicazione rende evidente la problematica della distribuzione delle colonnine elettriche in Italia; in molti casi infatti, nel punto in cui si dovrebbe ricaricare l’auto non è presente alcuna colonnina o, quelle che 
						ci sono, sono poche. Un altro dato da tenere in considerazione è che, generalmente, le colonnine elettriche sono concentrate perlopiù nelle città mentre in autostrada sono rare. Questo fa si che per fare lunghi spostamenti 
						si è spesso costretti ad uscire dall’autostrada per ricaricare o trovare percorsi alternativi che richiedono, necessariamente, tempi di percorrenza più lunghi.
						
						</p>
						
						<br/> <br/> 
						
						<div id="appContainer">
						
							<form name='formDistance' id='formDistance'>

								<div id="BoxSelectAuto" class="button_App">

									<?php $result = mysqli_query($con, $query2);?>
									<h1>Auto</h1>
									<?php
									echo "<select id='selectAuto'>";
									echo "<option selected disabled>seleziona</option>";
									while($row = mysqli_fetch_assoc($result)){
										echo "<option value='" . $row['Km_con_un_pieno'] . "|" .$row['Costo_un_pieno']. "'>" . $row["modello"] .  "</option>";
									}
									echo "</select>";
									?>

								</div>


								<div id="BoxSelectStart" class="button_App">

									<?php $result = mysqli_query($con, $query);?>
									<h1>Partenza</h1>
									<?php
									echo "<select id='selectStart'>";
									echo "<option selected disabled>seleziona</option>";
									while($row = mysqli_fetch_assoc($result)){
										echo "<option class='start" . $row['gruppo'] . "' value='" . $row['longitudine'] . "|" .$row['latitudine']. "'>" . $row["nome_province"] . "</option>";
									}
									echo "</select>";
									?>

								</div>


								<div id="BoxSelectArrive" class="button_App">

									<?php $result = mysqli_query($con, $query);?>
									<h1>Destinazione</h1>
									<?php
									echo "<select id='selectArrive' disabled>";
									echo "<option selected disabled>seleziona</option>";
									while($row = mysqli_fetch_assoc($result)){
										echo "<option class='dest" . $row['gruppo'] . "' value='" . $row['longitudine'] . "|" .$row['latitudine']. "'>" . $row["nome_province"] . "</option>";
									}
									echo "</select>";
									?>

								</div>
								
								<div id="BoxSelectRange" class="button_App">
									
									<h1>Raggio</h1>
									<input type="range" min="1" max="3000" value="2500" id="myRange">
									<p>Metri: <span id="RangeMetri"></span></p>
									
									<script>
										var slider = document.getElementById("myRange");
										var output = document.getElementById("RangeMetri");
										output.innerHTML = slider.value;

										slider.oninput = function() {
										  output.innerHTML = this.value;
										}
									</script>
									
								</div>
								
								
								
								<div id="BoxEsegui" class="button_App">
									
									
									<button type='button' id="buttonSubmit">Esegui</button>
								
								</div>
								
								</form>


								</br></br>
								
								<div id="loadApp"><p>Attendi...</p><br/><img src="images/loadApp.gif"></div>
								
								<i>L'applicazione è realizzata con mezzi totalmente gratuiti. In base al percorso, al raggio e al numero di richieste al server, può impiegare fino a qualche secondo di attesa per elaborare i dati </i>
								<div id="map" ></div>

								
								</br></br>


								<div id="resultForm">

									<div id="resultData"></div>
									
								</div>
						
						</div>
						
					</div><!-- end title -->
				</div>
			</div>
		</div>
	</div>
	
    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-left">
                    <p class="footer-company-name">All Rights Reserved. &copy; 2019  Design By : Gruppo Aquila</p>
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
	
	
	<!-- Turf/leaflet -->
   <script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>
   <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.3/leaflet.draw.js"></script>
	
	
	<!-- My functions (main for init map/ajax call) (timing for minutes to hours) (columnMarkers for list of coordinates columns) -->
   <script src="js/App/ColumnsMakers.js"></script> 
    <script src="js/App/timing.js"></script>
	<script src="js/App/selectHtmlGestion.js"></script>
    <script src="js/App/main.js"></script>
	
	
	
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
	<script src="js/tippy.all.min.js"></script>
	<script>
		tippy('.btn-a')
	</script>

</body>
</html>