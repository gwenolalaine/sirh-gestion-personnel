<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Document</title>
	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.css">
		<style>
		.error {
			color: red;
		}
		</style>
	</head>
	<body ng-app="myApp" class="ng-scope">
		<nav class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<li><a href="#!">X</a></li>
				<li><a href="<%=request.getContextPath()%>/collaborateurs/lister" id="collaborateurs">Collaborateurs</a></li>
				<li><a href="#!statistiques" id="statistiques">Statistiques</a></li>
				<li><a href="#!activites" id="activites">Activites</a></li>
			</ul>
		</nav>
		<div class="container-fluid" id="content">
			<a href="/sgp/collaborateurs/ajouter" id="ajoutCollaborateur" class="btn btn-default col-sm-offset-10 col-sm-2">Ajouter un nouveau collaborateur</a>
	
			<h1>Les collaborateurs</h1>
	
			<form id="departement" method="post" action="lister"
				class="form-horizontal">
				<div class="row">
					<div class="col-5">
						<label for="nom" class="col-form-label"> Rechercher un nom ou un prénom qui commence par :</label> 
						<input type="text" name="nom" />
						<input type="checkbox" name="activer"
							<%if (request.getParameter("activer") != null){%> checked <% }%>/>
							Voir les collaborateurs désactivés <br />
					</div>
				</div>
				<div class="row">
					<div class="col-5">
						<label for="departement" class="col-form-label">Filtrer par département :</label> <select class="form" name="departement">
							<option value="tous" selected="selected">Tous</option>
							<%final DepartementService departService = Constantes.DEPART_SERVICE;
								List<Departement> departements = departService.listerDepartements();
								for (Departement departement : departements) {%>
									<option value="<%=departement.getNom()%>"><%=departement.getNom()%></option>
							<% }%>
						</select>
						<input type="submit" id="chercher" />
					</div>
				</div>
			</form>
	
			<div id="tab-collaborateurs" class="row justify-content-between">
				<%
					int i = 0;
					List<Collaborateur> collaborateurs = (List<Collaborateur>) request.getAttribute("collaborateurs");
					for (Collaborateur collab : collaborateurs) {
				%>
				<div class="row pannel panel-default col-sm-offset-1 col-sm-3" id="row_collab">
	
					<div class="panel-heading" id="collab">
						<%=collab.getNom()%>
						<%=collab.getPrenom()%>
					</div>
					<div class="panel-body" id="collab">
						<div class="col-sm-4">
							<img src="<%=collab.getPhoto()%>" class="img-responsive" />
						</div>
						<div class="col-sm-8">
							<h3>Fonction</h3>
							<%if (collab.getIntitulePoste() != null){%>
								<%=collab.getIntitulePoste()%>
								<% }%>
							<h3>Departement</h3>
							<%if (collab.getDepartement() != null || !collab.getDepartement().getNom().equals("Indefini")){%>
								<%=collab.getDepartement().getNom()%>
								<% }%>
							<h3>Email :</h3>
							<%if (collab.getEmailPro() != null){%>
								<%=collab.getEmailPro()%>
								<% }%>
							<h3>Téléphone</h3>
							<% if (collab.getTelephone() != null){%>
								<%=collab.getTelephone()%>
								<% }%>
							<a href="/sgp/collaborateurs/editer?matricule=<%=collab.getMatricule()%>" id="modif" class="btn btn-default col-sm-offset-8 col-sm-4">Editer</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	</body>
</html>