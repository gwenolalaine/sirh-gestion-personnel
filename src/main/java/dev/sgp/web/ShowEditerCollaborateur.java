package dev.sgp.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes.Constantes;

public class ShowEditerCollaborateur extends HttpServlet{
	CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
	DepartementService departService = Constantes.DEPART_SERVICE;
	List<Departement> departements = departService.listerDepartements();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		
		if(matricule == null){
			resp.sendError(400, "Le matricule doit être renseigné");
			return;
		}
		
		
		for(Collaborateur collab : collaborateurs){
			if(collab.getMatricule().equals(matricule)){
				req.setAttribute("collaborateur", collab);
				
				req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateur.jsp")
				.forward(req, resp);
			}
		}
		
		resp.sendError(400, "Le matricule doit être celui d'un de nos collaborateurs");
	}
}
