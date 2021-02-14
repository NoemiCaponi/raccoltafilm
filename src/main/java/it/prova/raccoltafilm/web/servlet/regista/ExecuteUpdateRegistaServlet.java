package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.model.Sesso;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.utility.UtilityForm;

@WebServlet("/ExecuteUpdateRegistaServlet")
public class ExecuteUpdateRegistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam=request.getParameter("idRegista");
		String nomeParam = request.getParameter("nome");
		String cognomeParam = request.getParameter("cognome");
		String dataDiNascitaParam = request.getParameter("dataDiNascita");
		String sessoParam = request.getParameter("sesso");
		String nickNameParam=request.getParameter("nickName");
		
		Date dataDiNascitaParsed = UtilityForm.parseDateArrivoFromString(dataDiNascitaParam);
		Long idParamConvertito=Long.parseLong(idParam);
		Sesso sessoParsed=Sesso.valueOf(sessoParam);
	
		if (!UtilityForm.validateRegistaFormInput(nomeParam, cognomeParam, nickNameParam, dataDiNascitaParam) || dataDiNascitaParsed == null) {
			request.setAttribute("errorMessage", "Attenzione sono presenti errori");
			request.getRequestDispatcher("/regista/update.jsp").forward(request, response);
			return;
		}
		
		try {
			Regista registaInstance=MyServiceFactory.getRegistaServiceInstance().caricaSingoloElemento(idParamConvertito);
			registaInstance.setNome(nomeParam);
			registaInstance.setCognome(cognomeParam);
			registaInstance.setDataDiNascita(dataDiNascitaParsed);
			registaInstance.setSesso(sessoParsed);
			
			MyServiceFactory.getRegistaServiceInstance().aggiorna(registaInstance);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/regista/update.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect("ExecuteListRegistaServlet?operationResult=SUCCESS");

	}

}
