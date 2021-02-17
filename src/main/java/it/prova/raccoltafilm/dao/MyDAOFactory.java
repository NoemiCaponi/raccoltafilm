package it.prova.raccoltafilm.dao;

public class MyDAOFactory {

	private static FilmDAO filmDAOInstance = null;
	private static RegistaDAO registaDAOInstance = null;

	public static FilmDAO getFilmDAOInstance() {
		if (filmDAOInstance == null)
			filmDAOInstance = new FilmDAOImpl();
		return filmDAOInstance;
	}

	public static RegistaDAO getRegistaDAOInstance(){
		if(registaDAOInstance == null)
			registaDAOInstance= new RegistaDAOImpl();
		return registaDAOInstance;
	}

}
