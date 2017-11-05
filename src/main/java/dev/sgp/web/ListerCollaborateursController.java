package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;

public class ListerCollaborateursController extends HttpServlet{
	
	@Autowired private CollaborateurService collabService;
	@Autowired private DepartementService departService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		
		req.setAttribute("departements", departService.listerDepartements());
		req.setAttribute("collaborateurs", collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String departement = req.getParameter("departement");
		
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		
		if(req.getParameter("activer") == null){
			collaborateurs = collaborateurs.stream().filter(p->p.getActif()).collect(Collectors.toList());
		}
		
		if(!departement.equals("tous")){
			collaborateurs = collaborateurs.stream().filter(p->p.getDepartement() != null && p.getDepartement().getNom().equals(departement)).collect(Collectors.toList());
		}
		
		if(req.getParameter("nom") != null){
			collaborateurs = collaborateurs.stream().filter(p->p.getNom().toLowerCase().startsWith(req.getParameter("nom").toLowerCase()) || p.getPrenom().toLowerCase().startsWith(req.getParameter("nom").toLowerCase())).collect(Collectors.toList());
		}
		
 		req.setAttribute("departements", departService.listerDepartements());
		req.setAttribute("departement", req.getParameter("departement"));
		req.setAttribute("nom", req.getParameter("nom"));
		req.setAttribute("activer", req.getParameter("activer"));
		req.setAttribute("collaborateurs", collaborateurs);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
		.forward(req, resp);
		
	}
}
