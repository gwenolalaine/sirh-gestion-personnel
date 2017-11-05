package dev.sgp.entite;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="visiteWeb")
public class VisiteWeb {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	@Column
	String chemin;
	@Column
	Integer tempsExecution;
	@Column
	int nbVisites;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChemin() {
		return chemin;
	}
	public void setChemin(String chemin) {
		this.chemin = chemin;
	}
	public Integer getTempsExecution() {
		return tempsExecution;
	}
	public void setTempsExecution(Integer tempsExecution) {
		this.tempsExecution = tempsExecution;
	}
	public int getNbVisites() {
		return nbVisites;
	}
	public void setNbVisites(int nbVisites) {
		this.nbVisites = nbVisites;
	}
	
	
}
