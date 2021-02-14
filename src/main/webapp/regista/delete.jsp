<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Elimina elemento</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
		
		<div class='card'>
		    <div class='card-header'>
		        Conferma Eliminazione
		    </div>
		
		    <div class='card-body'>
		     <form method="post" action="ExecuteDeleteRegistaServlet" novalidate="novalidate">
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Id:</dt>
				  <dd class="col-sm-9">${delete_regista_attr.id}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Nome:</dt>
				  <dd class="col-sm-9">${delete_regista_attr.nome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Cognome:</dt>
				  <dd class="col-sm-9">${delete_regista_attr.cognome}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Nickname:</dt>
				  <dd class="col-sm-9">${delete_regista_attr.nickName}</dd>
		    	</dl>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Sesso:</dt>
				  <dd class="col-sm-9">${delete_regista_attr.sesso}</dd>
		    	</dl>		    	
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Data di nascita:</dt>
				  <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${delete_regista_attr.dataDiNascita}" /></dd>
		    	</dl>
		    	
				 <input type="hidden" name="idRegista" value="${delete_regista_attr.id}">
		    
		 		<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Elimina</button>
		
		    	</form>
		    </div>
		    
		    <div class='card-footer'>
		        <a href="ExecuteListRegistaServlet" class='btn btn-outline-secondary' style='width:80px'>
		            <i class='fa fa-chevron-left'></i> Back
		        </a>
		    </div>
		</div>	
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>