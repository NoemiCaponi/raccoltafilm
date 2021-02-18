package it.prova.raccoltafilm.model;

public enum StatoUtente {
	ATTIVO ("attivo"),DISABILITATO("disabilitato"),CREATO("creato");
	
	private String stato;
	
	StatoUtente(String stato){
		this.stato=stato;
	}
	
	public String getStato() {
		return stato;
	}
	
	
}
