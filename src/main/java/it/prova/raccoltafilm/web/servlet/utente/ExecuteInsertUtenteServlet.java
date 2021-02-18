package it.prova.raccoltafilm.web.servlet.utente;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Ruolo;
import it.prova.raccoltafilm.model.Utente;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.utility.UtilityForm;

@WebServlet("/ExecuteInsertUtenteServlet")
public class ExecuteInsertUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeParam=request.getParameter("nome");
		String cognomeParam=request.getParameter("cognome");
		String usernameParam=request.getParameter("username");
		String passwordParam=request.getParameter("password");
		String dateCreatedParam=request.getParameter("dateCreated");
		String ruoloInputParam=request.getParameter("ruolo.id");
		
		Date dateCreatedParsed= UtilityForm.parseDateArrivoFromString(dateCreatedParam);
		
		if(!UtilityForm.validateUtenteFormInput(nomeParam, cognomeParam, usernameParam, passwordParam, dateCreatedParam, ruoloInputParam) || dateCreatedParsed==null) {
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
			return;
		}
		
		Utente utenteInstance=new Utente(usernameParam,passwordParam,nomeParam, cognomeParam, dateCreatedParsed);
		Ruolo ruolo=new Ruolo();
		ruolo.setId(Long.parseLong(ruoloInputParam));
		utenteInstance.addRuolo(ruolo);
		
		try {
			MyServiceFactory.getUtenteServiceInstance().inserisciNuovo(utenteInstance);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/utente/insert.jsp").forward(request, response);
			return;
		}
		response.sendRedirect("ExecuteListUtenteServlet?operationResult=SUCCESS");

	}

}
