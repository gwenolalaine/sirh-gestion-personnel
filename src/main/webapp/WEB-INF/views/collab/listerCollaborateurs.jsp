<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp" %>

<div class="col-md-11 col-md-offset-1">
	<a href="/sgp/collaborateurs/ajouter" id="ajoutCollaborateur" class="btn btn-default col-md-offset-10 col-md-2">Ajouter un nouveau collaborateur</a>
	
	<h1>Les collaborateurs</h1>

	<form id="departement" method="post" action="lister" class="form-horizontal">
	
		<div class="row">
			<div class="col-sm-8">
				<label for="nom" class="col-form-label"> Rechercher un nom ou un prénom qui commence par :</label> 
				<input type="text" name="nom" class="btn btn-default"/>
				<input type="checkbox" name="activer"
				<%if (request.getParameter("activer") != null){%> checked <% }%>/>
				Voir les collaborateurs désactivés <br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<label for="departement" class="col-form-label" >Filtrer par département :</label> 
				<select class="btn btn-default dropdown-toggle"name="departement">
					<option value="tous" selected="selected">Tous</option>
						<%final DepartementService departService = Constantes.DEPART_SERVICE;
							List<Departement> departements = departService.listerDepartements();
							for (Departement departement : departements) {%>
								<option value="<%=departement.getNom()%>"><%=departement.getNom()%></option>
						<% }%>
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

	<%
		int i = 0;
		List<Collaborateur> collaborateurs = (List<Collaborateur>) request.getAttribute("collaborateurs");
		for (Collaborateur collab : collaborateurs) {
	%>
	
	<div class="pannel panel-primary col-sm-4" id="row_collab">
		<div class="panel-heading" id="collab">
			<%=collab.getNom()%>
			<%=collab.getPrenom()%>
		</div>
							
		<div class="panel-body" id="collab">
			<div class="col-sm-4">
				<img src="<%=collab.getPhoto()%>" class="img-responsive" />
			</div>
		
			<div class="col-sm-8">
				<h4>Fonction</h4>
				<%if (collab.getIntitulePoste() != null){%>
				<%=collab.getIntitulePoste()%>
				<% }%>
				
				<h4>Departement</h4>
				<%if (collab.getDepartement() != null || !collab.getDepartement().getNom().equals("Indefini")){%>
				<%=collab.getDepartement().getNom()%>
				<% }%>
				
				<h4>Email :</h4>
				<%if (collab.getEmailPro() != null){%>
				<%=collab.getEmailPro()%>
				<% }%>
								
				<h4>Téléphone</h4>
				<% if (collab.getTelephone() != null){%>
				<%=collab.getTelephone()%>
				<% }%>
				
				<a href="/sgp/collaborateurs/editer?matricule=<%=collab.getMatricule()%>" id="modif" class="btn btn-primary col-sm-offset-8 col-sm-4">Editer</a>
			</div>
		</div>
	</div>
<%
	}
%>
</div>

<%@ include file="footer.jsp" %>