package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateurController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// recupere la valeur d'un parametre dont le nom est avecPhoto
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		
		if(matricule == null){
			resp.sendError(400, "Les paramètres suivants sont incorrects : matricule");
		}
		else if(titre == null){
			resp.sendError(400, "Les paramètres suivants sont incorrects : titre");
		}
		else if(nom == null){
			resp.sendError(400, "Les paramètres suivants sont incorrects : nom");
		}
		else if(prenom == null){
			resp.sendError(400, "Les paramètres suivants sont incorrects : prenom");
		}
		else{
			resp.setStatus(201);
			resp.getWriter().write("Création d'un collaborateur avec les informations suivantes : matricule=" + matricule + ",titre=" + titre + ",nom=" + nom + ",prenom="+prenom);
		}
		
	}
}
