<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
		    <form method="post" action="ExecuteDeleteFilmServlet" novalidate="novalidate">
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Id:</dt>
				  <dd class="col-sm-9">${delete_film_attr.id}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Titolo:</dt>
				  <dd class="col-sm-9">${delete_film_attr.titolo}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Genere:</dt>
				  <dd class="col-sm-9">${delete_film_attr.genere}</dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Data Pubblicazione:</dt>
				  <dd class="col-sm-9"><fmt:formatDate type = "date" value = "${delete_film_attr.dataPubblicazione}" /></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Durata (min.):</dt>
				  <dd class="col-sm-9">${delete_film_attr.minutiDurata}</dd>
		    	</dl>
		    	<input type="hidden" name="idFilm" value="${delete_film_attr.id}">
		    		<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Elimina</button>
		
		    	</form>
		    </div>
		    
		    <div class='card-footer'>
		        <a href="ExecuteListFilmServlet" class='btn btn-outline-secondary' style='width:80px'>
		            <i class='fa fa-chevron-left'></i> Back
		        </a>
		    </div>
		</div>	
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>