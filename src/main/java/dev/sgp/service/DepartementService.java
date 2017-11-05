package dev.sgp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sgp.entite.Departement;
import dev.sgp.repository.DepartementRepository;

@Service
public class DepartementService {
	@Autowired private DepartementRepository departementRepository;
	
	public DepartementService(){
		departementRepository.save(new Departement("Comptabilite"));
		departementRepository.save(new Departement("Ressource Humaines"));
		departementRepository.save(new Departement("Informatique"));
		departementRepository.save(new Departement("Administratif"));
		departementRepository.save(new Departement("Indefini"));
	}
	
	public List<Departement> listerDepartements() {
		return departementRepository.findAll();
	}
	
	public void sauvegarderDepartement(Departement depart) {
		departementRepository.save(depart);
	}
}
