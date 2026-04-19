package com.metier;

import java.sql.Date;

public class Emprunt {
	private int id;
	private Date date_debut;
	private Date date_fin;
	private int appoge;
	private String isbn;
	private String titre;
	
	
	public Emprunt(Date db, Date fin) {
		date_debut = db;
		date_fin = fin;
	}
	
	
	public Emprunt(int id,String isbn, int appoge,String titre ,Date db, Date fin) {
		this.appoge=appoge;
		this.isbn=isbn;
		this.setTitre(titre);
		this.id=id;
		date_debut = db;
		date_fin = fin;
	}

	public Date getDate_debut() {
		return date_debut;
	}

	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}

	public Date getDate_fin() {
		return date_fin;
	}

	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getAppoge() {
		return appoge;
	}

	public void setAppoge(int appoge) {
		this.appoge = appoge;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}
	
}