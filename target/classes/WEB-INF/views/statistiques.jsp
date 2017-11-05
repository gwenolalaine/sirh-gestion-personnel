<%@page import="java.util.List"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.service.DepartementService"%>
<%@page import="dev.sgp.util.Constantes.Constantes"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>Statistiques</h1>

<table class="table table-responsive table-striped table-bordered">
    <thead>
        <tr>
            <th>Chemin</th>
            <th>Nombre de visites</th>
            <th>Min (ms)</th>
            <th>Max (ms)</th>
            <th>Moyenne (ms)</th>
         </tr>
    </thead>
    <tbody>
       <c:forEach var="visite" items="${requestScope.visites}">
	        <tr>
	          	<td>${visite.chemin}</td>
	          	<td>${visite.nbVisites}</td>
	          	<td>${requestScope.min}</td>
	          	<td>${requestScope.max}</td>
	          	<td>${requestScope.moy}</td>
	        </tr>
        </c:forEach>
    </tbody>
</table>

<%@ include file="footer.jsp" %>