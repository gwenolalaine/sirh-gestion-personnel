package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
	private DepartementService departService = Constantes.DEPART_SERVICE;
	private List<Departement> departements = departService.listerDepartements();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		
		if(matricule == null){
			resp.sendError(400, "Le matricule doit être renseigné");
			return;
		}
		
		Optional<Collaborateur> collab = collaborateurs.stream().filter(c->c.getMatricule().equals(matricule)).findFirst();

		if(collab.isPresent()) {
			req.setAttribute("collaborateur", collab.get());
			req.setAttribute("departements", departService.listerDepartements());
			req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateur.jsp")
			.forward(req, resp);
		}else {
			resp.sendError(400, "Le matricule doit être celui d'un de nos collaborateurs");
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String matricule = req.getParameter("matricule");
		
		String titre = req.getParameter("titre");
		String adresse = req.getParameter("adresse");
		Optional<Departement> oDep = Constantes.DEPART_SERVICE.listerDepartements().stream().filter(p -> p.getNom().equals(req.getParameter("departement"))).findFirst();
		String nomPoste = req.getParameter("nomPoste");
		String iban = req.getParameter("iban");
		String bic = req.getParameter("bic");
		String telephone = req.getParameter("telephone");
			
		String error = ErrorBuilder.buildError("adresse:"+ adresse);
		
		if(!error.equals("")){
			resp.sendError(400, "Il manque ce paramètre : " + error);
				
			return;
		}
				
		Collaborateur nouveauCollaborateur = collaborateurs.stream()
			.filter(p->p.getMatricule().equals(matricule))
			.collect(Collectors.toList()).get(0);
			
		if(req.getParameter("delete") != null){
			nouveauCollaborateur.setActif(false);
		}else{
			nouveauCollaborateur.setActif(true);
		}
		
		if(oDep.isPresent()){
			nouveauCollaborateur.setDepartement(oDep.get());
		}
		nouveauCollaborateur.setAdresse(adresse);
		nouveauCollaborateur.setIntitulePoste(nomPoste);
		nouveauCollaborateur.setIban(iban);
		nouveauCollaborateur.setBic(bic);
		nouveauCollaborateur.setTelephone(telephone);
		
		collaborateurs = collaborateurs.stream().filter(p->p.getActif()).collect(Collectors.toList());
		req.setAttribute("collaborateurs", collaborateurs);
		req.setAttribute("departements", departements);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
	}
}
