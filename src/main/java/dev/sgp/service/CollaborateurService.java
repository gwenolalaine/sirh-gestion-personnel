package dev.sgp.service;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;

public class CollaborateurService {
	
	List<Collaborateur> listeCollaborateurs = new ArrayList<>();
	
	public CollaborateurService(){
		Collaborateur collab = new Collaborateur("Captain", "Janeway", LocalDate.now(), "15 rue Voyager", "123456789123456", "captain.janeway@societe.com", ZonedDateTime.now(), true, "https://image.freepik.com/icones-gratuites/symbole-d-39-utilisateur-inconnu_318-54178.jpg");
		listeCollaborateurs.add(collab);
		Collaborateur collab1 = new Collaborateur("Roslin", "Laura", LocalDate.now(), "15 rue galactica", "123456789123456", "roslin.laura@societe.com", ZonedDateTime.now(), true, "https://image.freepik.com/icones-gratuites/symbole-d-39-utilisateur-inconnu_318-54178.jpg");
		listeCollaborateurs.add(collab1);
		

	}	
	
	public List<Collaborateur> listerCollaborateurs() {
		return listeCollaborateurs;
	}
	
	public void sauvegarderCollaborateur(Collaborateur collab) {
		listeCollaborateurs.add(collab);
	}
}
