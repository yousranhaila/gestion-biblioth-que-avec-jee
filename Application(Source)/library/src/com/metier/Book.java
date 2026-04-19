package com.metier;

public class Book {
	private String isbn;
	private String titre;
	private String auteur;
	private String categorie;
	private String description;
	private int nbExemplaire;
	
	public Book() {
		
	}

	public Book(String isbn, String titre, String auteur, String categorie, String description,int nbExemplaire) {
		this.isbn = isbn;
		this.titre = titre;
		this.auteur = auteur;
		this.categorie = categorie;
		this.description = description;
		this.nbExemplaire = nbExemplaire;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getAuteur() {
		return auteur;
	}

	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNbExemplaire() {
		return nbExemplaire;
	}

	public void setNbExemplaires(int nbExemplaire) {
		this.nbExemplaire = nbExemplaire;
	}
	
	
	
	
}
