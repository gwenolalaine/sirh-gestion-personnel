package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes.Constantes;

public class EditerCollaborateurController extends HttpServlet{
	CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
	DepartementService departService = Constantes.DEPART_SERVICE;
	List<Departement> departements = departService.listerDepartements();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String adresse = req.getParameter("adresse");
		Optional<Departement> oDep = Constantes.DEPART_SERVICE.listerDepartements().stream().filter(p -> p.getNom().equals(req.getParameter("departement"))).findFirst();
		String nomPoste = req.getParameter("nomPoste");
		String iban = req.getParameter("iban");
		String bic = req.getParameter("bic");
		
		String error = ErrorBuilder.buildError("adresse:"+ adresse);
		if(!error.equals("")){
			resp.sendError(400, "Il manque ce paramètre : " + error);
			return;
		}
			
		Collaborateur nouveauCollaborateur = collaborateurs.stream()
			.filter(p->p.getMatricule().equals(matricule))
			.collect(Collectors.toList()).get(0);
		if(oDep.isPresent()){
			nouveauCollaborateur.setDepartement(oDep.get());
		}
		nouveauCollaborateur.setAdresse(adresse);
		nouveauCollaborateur.setIntitulePoste(nomPoste);
		nouveauCollaborateur.setIban(iban);
		nouveauCollaborateur.setBic(bic);
		resp.sendRedirect("/sgp/collaborateurs/lister");
	}
}
