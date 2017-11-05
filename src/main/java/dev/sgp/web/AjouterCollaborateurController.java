package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes.Constantes;

public class AjouterCollaborateurController extends HttpServlet{
		
		private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
		private DepartementService departService = Constantes.DEPART_SERVICE;
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.getRequestDispatcher("/WEB-INF/views/collab/ajoutCollaborateur.jsp")
			.forward(req, resp);
		}
		
		public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String resultat;
			Map<String, String> erreurs = new HashMap<String, String>();
			CollaborateurService collabService = Constantes.COLLAB_SERVICE;
			
			/* Récuperation du formulaire */
			String nom = req.getParameter("nom");
			String prenom = req.getParameter("prenom");
			LocalDate dateDeNaissance = LocalDate.parse(req.getParameter("date"));
			String adresse = req.getParameter("adresse");
			String numero = req.getParameter("numero");
			
			/*validation des champs*/
			String error = ErrorBuilder.buildError("nom:" + nom, "prenom:" + prenom, "date:"+ dateDeNaissance, "adresse:"+adresse, "numero:"+numero);
			if(!error.equals("")){
				resp.sendError(400, "Les paramètres suivants sont incorrects : " + error);
				return;
			}
			
			if(numero.length() != 15){
				resp.sendError(400, "Le numero de sécu doit être composé de 15 chiffre");
				return;
			}
			
			/* Creation du reste des paramètres */
			ZonedDateTime dateCreation = ZonedDateTime.now();
			String emailPro = prenom.toLowerCase() + "." + nom.toLowerCase() + "@societe.com";
			String photo = "https://image.freepik.com/icones-gratuites/symbole-d-39-utilisateur-inconnu_318-54178.jpg";
			/*Envoi*/
			Collaborateur nouveauCollaborateur = new Collaborateur(nom, prenom, dateDeNaissance, adresse, numero, emailPro, dateCreation, true, photo);
			
			Constantes.COLLAB_SERVICE.sauvegarderCollaborateur(nouveauCollaborateur);
			
			List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
			collaborateurs = collaborateurs.stream().filter(p->p.getActif()).collect(Collectors.toList());
			req.setAttribute("collaborateurs", collaborateurs);
			req.setAttribute("departements", departService.listerDepartements());
			req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp")
			.forward(req, resp);
		}
}
