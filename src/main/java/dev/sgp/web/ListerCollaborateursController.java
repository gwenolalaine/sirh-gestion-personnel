package dev.sgp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes.Constantes;

public class ListerCollaborateursController extends HttpServlet{
	
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();

		req.setAttribute("collaborateurs", collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String departement = req.getParameter("departement");
		
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		collaborateurs = collaborateurs.stream().filter(p->p.getActif()).collect(Collectors.toList());
		
		if(req.getParameter("activer") != null){
			collaborateurs = collaborateurs.stream().filter(p->p.getActif()).collect(Collectors.toList());
		}
		
		if(!departement.equals("tous")){
			collaborateurs = collaborateurs.stream().filter(p->p.getDepartement() != null && p.getDepartement().getNom().equals(departement)).collect(Collectors.toList());
		}
		
		if(req.getParameter("nom") != null){
			collaborateurs = collaborateurs.stream().filter(p->p.getNom().startsWith(req.getParameter("nom"))).collect(Collectors.toList());
		}
		
		req.setAttribute("collaborateurs", collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		
	}
}
