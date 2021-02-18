<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Visualizza Utente</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
		
		<div class='card'>
		    <div class='card-header'>
		        Visualizza dettaglio utente
		    </div>
		
		    <div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Id:</dt>
				  <dd class="col-sm-9">${show_c_attr.id}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Nome:</dt>
				  <dd class="col-sm-9">${show_utente_attr.nome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Cognome:</dt>
				  <dd class="col-sm-9">${show_utente_attr.cognome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Username:</dt>
				  <dd class="col-sm-9">${show_utente_attr.username}</dd>
		    	</dl>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Password:</dt>
				  <dd class="col-sm-9">${show_utente_attr.password}</dd>
		    	</dl>		    	
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Data creazione:</dt>
				  <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${show_utente_attr.dateCreated}" /></dd>
		    	</dl>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Stato:</dt>
				  <dd class="col-sm-9">${show_utente_attr.stato}" /></dd>
		    	</dl>
		    	<p>
				  <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				    Info Ruolo</a>
				</p>
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				  <div class='table-responsive'>
		            <table class='table table-striped ' >
		                <thead>
		                    <tr>
		                        <th>Descrizione</th>
		                        <th>Codice</th>
		                       
		                    </tr>
		                </thead>
		                <tbody>
		                <%-- 	<c:forEach items="${show_utente_attr.ruoli}" var="ruoliItem">
								<tr>
									<td>${ruoliItem.descrizione}</td>
									<td>${ruoliItem.codice}</td>
									
								</tr>
							</c:forEach> --%>
		                </tbody>
		            </table>
		        </div>
				    
				  </div>
				</div>
		    	
		    </div>
		    
		    <div class='card-footer'>
		        <a href="ExecuteListUtenteServlet" class='btn btn-outline-secondary' style='width:80px'>
		            <i class='fa fa-chevron-left'></i> Back
		        </a>
		    </div>
		</div>	
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>