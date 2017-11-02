<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<%
	Collaborateur collaborateur = (Collaborateur) request.getAttribute("collaborateur");
%>
		
<div id="photo" class="col-sm-4">
	<img src="<%=collaborateur.getPhoto()%>" class="img-responsive" />
</div>
		
<div id="form" class="col-sm-8" id="collaborateur">
	<h1 class="col-sm-8">
		<%=collaborateur.getNom()%>
		<%=collaborateur.getPrenom()%>
		-
		<%=collaborateur.getMatricule()%>
	</h1>

	<form class="form-horizontal" action="<%=request.getContextPath()%>/collaborateurs/editer" method="post">
		<div class="col-sm-4">
			<input type="checkbox" name="delete"
			<%if (!collaborateur.getActif()){%> checked <% }%>/> Désactiver	
		</div>

		<input type="hidden" name="matricule" value="<%=collaborateur.getMatricule()%>"> 
		<input type="button" value="Identité" data-toggle="collapse" data-target="#identite" class="btn btn-block">

		<div id="identite" class="collapse">
		<br />

		<div class="form-group">
			<label class="col-sm-4" for="titre">Titre :</label>
			
			<div class="col-sm-8">
				<select class="form-control" name="titre">
					<option value="M">M.</option>
					<option value="Mme">Mme</option>
					<option value="Captain">Captain</option>
					<option value="Aucun">Aucun</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4" for="nom"><%=collaborateur.getNom()%></label>
		</div>
		
		<div class="form-group">
			<label for="prenom" class="col-sm-4"><%=collaborateur.getPrenom()%></label>
		</div>
		
		<div class="form-group">
			<label for="date" class="col-sm-4"><%=collaborateur.getDateDeNaissance()%></label>
		</div>
		
		<div class="form-group">
			<label for="Adresse" class="col-sm-4">Adresse :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="adresse" value="<%=collaborateur.getAdresse()%>" required>
			</div>
		</div>
		
		<div class="form-group">
			<label for="numero" class="col-sm-4">Numero de sécurité sociale :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="numero" value="<%=collaborateur.getNumeroSecuriteSociale()%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="telephone" class="col-sm-4">Téléphone :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="telephone" value="<%=collaborateur.getTelephone()%>">
			</div>
		</div>
	</div>

	<input type="button" value="Poste" data-toggle="collapse" data-target="#poste" class="btn btn-block">

	<div id="poste" class="collapse">
	<br />
		<div class="form-group">
			<label class="col-sm-4" for="departement">Département :</label>
			<div class="col-sm-8">
				<select class="form-control" name="departement">
					<%	final DepartementService departService = Constantes.DEPART_SERVICE;
						List<Departement> departements = departService.listerDepartements();
						for (Departement departement : departements) {
					%>
					
					<option <%if (collaborateur.getDepartement().equals(departement)) %>selected value="<%=departement.getNom()%>"><%=departement.getNom()%></option>
					<% }%>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="nomPoste" class="col-sm-4">Nom du poste</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="nomPoste" value="<%=collaborateur.getIntitulePoste()%>">
			</div>
		</div>
	</div>

	<input type="button" value="Coordonnées bancaires" data-toggle="collapse" data-target="#banque" class="btn btn-block">

	<div id="banque" class="collapse">
	<br />
		<div class="form-group">
			<label class="col-sm-4" for="iban">IBAN :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="iban" value="<%=collaborateur.getIban()%>">
			</div>
		</div>

		<div class="form-group">
			<label for="bic" class="col-sm-4">BIC</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="bic" value="<%=collaborateur.getBic()%>">
			</div>
		</div>
	</div>

	<div class="col-sm-offset-10 col-sm-2">
		<button class="btn btn-default">Sauvegarder</button>
	</div>
</form>
</div>
		
<%@ include file="footer.jsp" %>