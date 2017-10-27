<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

   <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.css">
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body ng-app="myApp" class="ng-scope">
    <nav class="navbar navbar-default">
        <ul class="nav navbar-nav">
            <li><a href="#!">X</a></li>
            <li><a href="#!collaborateurs" id="collaborateurs">Collaborateurs</a></li>
            <li><a href="#!statistiques" id="statistiques">Statistiques</a></li>
            <li><a href="#!activites" id="activites">Activites</a></li>
        </ul>
    </nav>
<div class="container-fluid" id="content">
    <a href="/sgp/collaborateurs/ajouter" id="ajoutCollaborateur" class="btn btn-default col-sm-offset-10 col-sm-2">Ajouter un nouveau collaborateur</a>
	<h1>Les collaborateurs</h1>
	<p> Rechercher un nom ou un prénom qui commence par :
	    <input type="text" id="nom"/> 
	    <input type="submit" id="chercher"/>
	    <input type="checkbox"/> Voir les collaborateurs désactivés
	</p>
	<p class="form-control-static" id="filtre">
	    Filtrer par département :
	    <select name="departement">
	        <option value="tous" default>Tous</option>
	        <option value="comptabilite">Comptabilité</option>
	        <option value="ressources">Ressources humaines</option>
	        <option value="informatique">Informatique</option>
	    </select>
	</p>
	
	<div id="tab-collaborateurs" class="row justify-content-between">
	<%
		int i = 0;
		List<Collaborateur> collaborateurs =(List<Collaborateur>)request.getAttribute("collaborateurs");
		for (Collaborateur collab : collaborateurs) {

		%>
		<div class="row pannel panel-default col-sm-offset-1 col-sm-3" id="row_collab">
		
			<div class="panel-heading" id="collab">
			<%= collab.getNom() %>
			</div>
			<div class="panel-body" id="collab">
				<div class="col-sm-4">
					Img ici
				</div>
				<div class="col-sm-8">
					<h3>Fonction</h3>
					<h3>Departement</h3>
					<h3>Email : </h3> <%= collab.getEmailPro() %>
					<h3>Téléphone</h3>
					<a  id="modifCollaborateur" class="btn btn-default col-sm-offset-8 col-sm-4">Editer</a>
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