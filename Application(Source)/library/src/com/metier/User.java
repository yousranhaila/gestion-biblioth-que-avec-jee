package com.metier;


public class User {
	protected int appoge;
	protected String nom;
	protected String prenom;
	protected String email;
	protected String password;
	
	public User() {
	}
	
	public User(int appoge, String nom,String prenom, String email, String password) {
		super();
		this.appoge = appoge;
		this.nom = nom;		
		this.prenom = prenom;
		this.email = email;
		this.password = password;
	}

	public int getAppoge() {
		return appoge;
	}

	public void setAppoge(int appoge) {
		this.appoge = appoge;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
