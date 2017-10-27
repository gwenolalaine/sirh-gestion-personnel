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
		
		
		String error = ErrorBuilder.buildError("matricule :" + matricule, "titre:" + titre, "nom:"+ nom, "prenom:"+prenom);
		if(!error.equals("")){
			resp.sendError(400, "Les paramatres suivants sont incorrects : " + error);
			return;
		}
			
		resp.getWriter().write("<h1>Edition de collaborateur</h1>");
		resp.setStatus(201);
		resp.getWriter().write("Création d'un collaborateur avec les informations suivantes : matricule=" + matricule + ",titre=" + titre + ",nom=" + nom + ",prenom="+prenom);
		
	}
}
