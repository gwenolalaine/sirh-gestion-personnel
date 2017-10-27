package dev.sgp.entite;

public class Departement {
	int id;
	String nom;
	int compteur = 0;
	
	public Departement(String nom) {
		super();
		this.id = compteur++;
		this.nom = nom;
	}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}
	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
}
