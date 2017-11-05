<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="collaborateur" value="${requestScope.collaborateur}"></c:set>
		
<div id="photo" class="col-sm-4">
	<img src="${collaborateur.photo}" class="img-responsive" />
</div>
		
<div id="form" class="col-sm-8" id="collaborateur">
	<h1 class="col-sm-8">
		${collaborateur.nom}
		${collaborateur.prenom}
		-
		${collaborateur.matricule}
	</h1>

	<form class="form-horizontal" action="<%=request.getContextPath()%>/collaborateurs/editer" method="post">
		<div class="col-sm-4">
			<input type="checkbox" name="delete"
			<c:if test="${!collaborateur.actif}">checked</c:if>/> Désactiver	
		</div>

		<input type="hidden" name="matricule" value="${collaborateur.matricule }"> 
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
			<label class="col-sm-4" for="nom">${collaborateur.nom}</label>
		</div>
		
		<div class="form-group">
			<label for="prenom" class="col-sm-4 ">${collaborateur.prenom}</label>
		</div>
		
		<div class="form-group">
			<label for="date" class="col-sm-4">${collaborateur.dateDeNaissance}</label>
		</div>
		
		<div class="form-group">
			<label for="Adresse" class="col-sm-4">Adresse :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="adresse" value="${collaborateur.adresse}" required>
			</div>
		</div>
		
		<div class="form-group">
			<label for="numero" class="col-sm-4">Numero de sécurité sociale :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="numero" value="${collaborateur.numeroSecuriteSociale}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="telephone" class="col-sm-4">Téléphone :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="telephone" value="${collaborateur.telephone}">
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
					<c:forEach items="${requestScope.departements}" var="dep" >
						<option value="${dep.nom}"
							<c:if test="${collaborateur.departement == dep}">selected</c:if>>${dep.nom}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="nomPoste" class="col-sm-4">Nom du poste</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="nomPoste" value="${collaborateur.intitulePoste}">
			</div>
		</div>
	</div>

	<input type="button" value="Coordonnées bancaires" data-toggle="collapse" data-target="#banque" class="btn btn-block">

	<div id="banque" class="collapse">
	<br />
		<div class="form-group">
			<label class="col-sm-4" for="iban">IBAN :</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="iban" value="${collaborateur.iban}">
			</div>
		</div>

		<div class="form-group">
			<label for="bic" class="col-sm-4">BIC</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="bic" value="${collaborateur.bic}">
			</div>
		</div>
	</div>

	<div class="col-sm-offset-10 col-sm-2">
		<button class="btn btn-default">Sauvegarder</button>
	</div>
</form>
</div>
		
<%@ include file="../footer.jsp" %>