package dev.sgp.service;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sgp.entite.Collaborateur;
import dev.sgp.repository.CollaborateurRepository;

@Service
public class CollaborateurService {
	
	@Autowired private CollaborateurRepository collaborateurRepository;
	
	public CollaborateurService(){
		Collaborateur collab = new Collaborateur("Captain", "Janeway", LocalDate.now(), "15 rue Voyager", "123456789123456", "captain.janeway@societe.com", ZonedDateTime.now(), true, "https://image.freepik.com/icones-gratuites/symbole-d-39-utilisateur-inconnu_318-54178.jpg");
		collaborateurRepository.save(collab);
		Collaborateur collab1 = new Collaborateur("Roslin", "Laura", LocalDate.now(), "15 rue galactica", "123456789123456", "roslin.laura@societe.com", ZonedDateTime.now(), true, "https://image.freepik.com/icones-gratuites/symbole-d-39-utilisateur-inconnu_318-54178.jpg");
		collaborateurRepository.save(collab1);
	}	
	
	public List<Collaborateur> listerCollaborateurs() {
		return collaborateurRepository.findAll();
	}
	
	public void sauvegarderCollaborateur(Collaborateur collab) {
		collaborateurRepository.save(collab);
	}
}
