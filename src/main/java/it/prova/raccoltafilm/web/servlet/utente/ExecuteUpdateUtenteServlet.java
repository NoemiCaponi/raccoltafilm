package it.prova.raccoltafilm.web.servlet.utente;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.StatoUtente;
import it.prova.raccoltafilm.model.Utente;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.utility.UtilityForm;

@WebServlet("/ExecuteUpdateUtenteServlet")
public class ExecuteUpdateUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("idUtente");
		String nomeParam = request.getParameter("nome");
		String cognomeParam = request.getParameter("cognome");
		String usernameParam = request.getParameter("username");
		String passwordParam = request.getParameter("password");
		String statoParam = request.getParameter("stato");

		Long idParamConvertito = Long.parseLong(idParam);
		StatoUtente statoParsed = StatoUtente.valueOf(statoParam);

		if (!UtilityForm.validateUtenteFormInput(nomeParam, cognomeParam, usernameParam, passwordParam)) {
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("/utente/update.jsp").forward(request, response);
			return;
		}

		try {

			Utente utenteInstance = MyServiceFactory.getUtenteServiceInstance().caricaUtenteConRuolo(idParamConvertito);
			utenteInstance.setNome(nomeParam);
			utenteInstance.setCognome(cognomeParam);
			utenteInstance.setUsername(usernameParam);
			utenteInstance.setPassword(passwordParam);
			utenteInstance.setStato(statoParsed);
			
			MyServiceFactory.getUtenteServiceInstance().aggiorna(utenteInstance);
			

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/utente/update.jsp").forward(request, response);
			return;
		}
		response.sendRedirect("ExecuteListUtenteServlet?operationResult=SUCCESS");

	}

}
