<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Inserisci Utente</title>
	
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
		        <h5>Inserisci nuovo utente</h5> 
		    </div>
		    <div class='card-body'>

					<form method="post" action="ExecuteInsertUtenteServlet" >
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>Nome</label>
								<input type="text" name="nome" id="nome" class="form-control" placeholder="Inserire il nome" >
							</div>
							
							<div class="form-group col-md-6">
								<label>Cognome</label>
								<input type="text" name="cognome" id="cognome" class="form-control" placeholder="Inserire il cognome" >
							</div>
						</div>
						
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>Username</label>
                        		<input class="form-control" type="text" id="username" name="username" placeholder="Inserire username" >
							</div>
							<div class="form-group col-md-6">
								<label>Password</label>
								<input type="password" class="form-control" name="password" id="password" placeholder="Inserire la password" >
							</div>
						</div>
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label>Data di Creazione</label>
                        		<input class="form-control" id="dateCreated" type="date" placeholder="dd/MM/yy"
                            		title="formato : gg/mm/aaaa"  name="dateCreated" >
							</div>
							</div>
						<div class="form-row">	
							<div class="form-group col-md-6">
								<label for="ruolo.id">Ruolo</label>
							    <select class="form-control" id="ruolo.id" name="ruolo.id">
							    	<option value=""> -- Selezionare un ruolo -- </option>
							      	<c:forEach items="${ruoli_list_attribute }" var="ruoloItem">
							      		<option value="${ruoloItem.id}">${ruoloItem.descrizione}</option>
							      	</c:forEach>
							    </select>
							</div>
						</div>
							
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