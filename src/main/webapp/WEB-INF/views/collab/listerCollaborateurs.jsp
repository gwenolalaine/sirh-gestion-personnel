<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp" %>

<div class="col-md-11 col-md-offset-1">
	<a href="<c:url value="/collaborateurs/ajouter"/>" id="ajoutCollaborateur" class="btn btn-default col-md-offset-10 col-md-2">Ajouter un nouveau collaborateur</a>
	
	<h1>Les collaborateurs</h1>

	<form id="departement" method="post" action="lister" class="form-horizontal">
	
		<div class="row">
			<div class="col-sm-8">
				<label for="nom" class="col-form-label"> Rechercher un nom ou un prénom qui commence par :</label> 
				<input type="text" name="nom" class="btn btn-default" <c:if test="${!empty requestScope.nom}">value="${requestScope.nom}"</c:if>/>
				<input type="checkbox" name="activer" id="activer"
				<c:if test="${requestScope.activer!=null}">checked</c:if>>
				Voir les collaborateurs désactivés <br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<label for="departement" class="col-form-label" >Filtrer par département :</label> 
				<select class="btn btn-default dropdown-toggle"name="departement">
					<option value="tous" <c:if test="${empty requestScope.departement}">selected="selected"</c:if>>Tous</option>

					<c:forEach items="${requestScope.departements}" var="dep" >
						<option value="${dep.nom}"
							<c:if test="${requestScope.departement!= null && requestScope.departement==dep.nom}">selected</c:if>>${dep.nom}</option>
					</c:forEach>
				</select>
				
				<input type="submit" id="chercher" class="btn btn-inverse right-rounded"/>
			</div>
		</div>
	</form>
</div>
<br/>
<br/>
<br/>
<br/>

<div id="tab-collaborateurs">

<c:set var="listCollab" value="${requestScope.collaborateurs}"></c:set>
<c:forEach var="collab" items="${listCollab}">
	<div class="pannel panel-primary col-sm-4" id="row_collab">
		<div class="panel-heading" id="collab">
			${collab.nom}
			${collab.prenom}
		</div>
							
		<div class="panel-body" id="collab">
			<div class="col-sm-4">
				<img src="${collab.photo}" class="img-responsive" />
			</div>
		
			<div class="col-sm-8">
				<h4>Fonction</h4>
				<c:if test="${!empty collab.intitulePoste}">
				${collab.intitulePoste}
				</c:if>
				
				<h4>Departement</h4>
				<c:if test="${!empty collab.departement}">
				${collab.departement.nom}
				</c:if>
				
				<h4>Email :</h4>
				<c:if test="${!empty collab.emailPro}">
				${collab.emailPro}
				</c:if>
								
				<h4>Téléphone</h4>
				<c:if test="${!empty collab.telephone}">
				${collab.telephone}
				</c:if>
				
				<a href="/sgp/collaborateurs/editer?matricule=${collab.matricule}" id="modif" class="btn btn-primary col-sm-offset-8 col-sm-4">Editer</a>
			</div>
		</div>
	</div>
</c:forEach>
</div>

<%@ include file="footer.jsp" %>