package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;

public class DepartementService {
	List<Departement> listeDepartements = new ArrayList<>();
	
	public DepartementService(){
		listeDepartements.add(new Departement("Comptabilité"));
		listeDepartements.add(new Departement("Ressource Humaines"));
		listeDepartements.add(new Departement("Informatique"));
		listeDepartements.add(new Departement("Administratif"));
		listeDepartements.add(new Departement("Indefini"));
	}
	
	public List<Departement> listerDepartements() {
		return listeDepartements;
	}
	
	public void sauvegarderDepartement(Departement depart) {
		listeDepartements.add(depart);
	}
}
