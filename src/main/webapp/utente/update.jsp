<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Aggiorna elemento</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Aggiorna elemento</h5> 
		    </div>
		    <div class='card-body'>
		    
		    		<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>

					<form method="post" action="ExecuteUpdateUtenteServlet" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Nome <span class="text-danger">*</span></label>
								<input type="text" name="nome" id="nome" class="form-control" value="${update_utente_attr.nome}"required>
							</div>
							
							<div class="form-group col-md-6">
								<label>Cognome <span class="text-danger">*</span></label>
								<input type="text" name="cognome" id="cognome" class="form-control" value="${update_utente_attr.cognome}" required>
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>Username <span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="username" name="username" value="${update_utente_attr.username}"required>
							</div>
							<div class="form-group col-md-6">
								<label>Password<span class="text-danger">*</span></label>
								<input type="text" class="form-control" id="password" name="password" value="${update_utente_attr.password}"required>
							</div>
						</div>
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label for="stato">Stato<span class="text-danger"></span></label>
								<!-- <input type="text" class="form-control" id="stato" name="stato" value="${update_utente_attr.stato}"required>-->
								<select class="form-control" id="stato" name="stato" required>
							    	<option value=""> - Selezionare - </option>
							      	<option value="ATTIVO">ATTIVO</option>
							      	<option value="CREATO">CREATO</option>
							      	<option value="DISABILITATO">DISABILITATO</option>
							    </select>
							</div>
							
							    
							</div>
							
							<input type="hidden" name="idUtente" value="${update_utente_attr.id}">
						<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Conferma</button>

					</form>

		    
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>