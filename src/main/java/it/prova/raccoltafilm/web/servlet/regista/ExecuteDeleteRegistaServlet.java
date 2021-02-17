package it.prova.raccoltafilm.web.servlet.regista;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.service.MyServiceFactory;

@WebServlet("/ExecuteDeleteRegistaServlet")
public class ExecuteDeleteRegistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idParam=request.getParameter("idRegista");
		Long idParamConvertito=Long.parseLong(idParam);
		
		try {
			Regista registaInstance=MyServiceFactory.getRegistaServiceInstance().caricaSingoloElementoConFilms(idParamConvertito);
	
			MyServiceFactory.getRegistaServiceInstance().rimuovi(registaInstance);
			request.setAttribute("successMessage", "Operazione effettuata con successo");
			//request.setAttribute("delete_regista_attr", MyServiceFactory.getRegistaServiceInstance().listAllElements());
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/regista/delete.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect("ExecuteListRegistaServlet?operationResult=SUCCESS");
	}

}
