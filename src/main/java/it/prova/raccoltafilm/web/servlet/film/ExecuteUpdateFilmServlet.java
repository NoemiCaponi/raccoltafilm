package it.prova.raccoltafilm.web.servlet.film;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.raccoltafilm.model.Film;
import it.prova.raccoltafilm.model.Regista;
import it.prova.raccoltafilm.service.MyServiceFactory;
import it.prova.raccoltafilm.utility.UtilityForm;

@WebServlet("/ExecuteUpdateFilmServlet")
public class ExecuteUpdateFilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam=request.getParameter("idFilm");
		String titoloParam = request.getParameter("titolo");
		String genereParam = request.getParameter("genere");
		String dataPubblicazioneParam = request.getParameter("dataPubblicazione");
		String minutiDurataParam = request.getParameter("minutiDurata");
		String registaIdParam = request.getParameter("regista.id");
		
		Date dataPubblicazioneParsed = UtilityForm.parseDateArrivoFromString(dataPubblicazioneParam);
		Long idParamConvertito=Long.parseLong(idParam);
		Integer minutiDurataParsed=Integer.parseInt(minutiDurataParam);
		Long registaIdParsed=Long.parseLong(registaIdParam);

		if (!UtilityForm.validateFilmFormInput(titoloParam, genereParam, minutiDurataParam, dataPubblicazioneParam,
				registaIdParam) || dataPubblicazioneParsed == null) {
			request.setAttribute("errorMessage", "Attenzione sono presenti errori");
			request.getRequestDispatcher("/film/update.jsp").forward(request, response);
			return;
		}
		
		try {
			Film filmInstance=MyServiceFactory.getFilmServiceInstance().caricaSingoloElementoEager(idParamConvertito);
			filmInstance.setGenere(genereParam);
			filmInstance.setTitolo(titoloParam);
			filmInstance.setDataPubblicazione(dataPubblicazioneParsed);
			filmInstance.setMinutiDurata(minutiDurataParsed);
			Regista registaInstance=MyServiceFactory.getRegistaServiceInstance().caricaSingoloElemento(registaIdParsed);
			filmInstance.setRegista(registaInstance);
			
			MyServiceFactory.getFilmServiceInstance().aggiorna(filmInstance);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/film/update.jsp").forward(request, response);
			return;
		}
		
		response.sendRedirect("ExecuteListFilmServlet?operationResult=SUCCESS");

	}

}
