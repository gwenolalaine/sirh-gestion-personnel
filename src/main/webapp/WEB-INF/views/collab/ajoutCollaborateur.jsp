<%@page import="java.util.List"%>
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
		.error {
			color: red;
		}
	</style>

<script>
		function showModal(){
			$('#modal').modal('show');
			$('#modalValues').html('<br/>' + $('#nom').val() + '<br/>' + $('#prenom').val() + '<br/>' + $('#date').val() + '<br/>' + $('#adresse').val() + '<br/>' + $('#numero').val() + '<br/>');
		}
		
		function submit(){
			document.forms[0].action = "<%=request.getContextPath()%>/collaborateurs/ajouter";
			document.forms[0].method = "post";
			document.forms[0].submit();
		}
	</script>
</head>
<body class="ng-scope">
	<nav class="navbar navbar-default">
		<ul class="nav navbar-nav">
			<li><a href="#!">X</a></li>
			<li><a
				href="<%=request.getContextPath()%>/collaborateurs/lister"
				id="collaborateurs">Collaborateurs</a></li>
			<li><a href="#!statistiques" id="statistiques">Statistiques</a></li>
			<li><a href="#!activites" id="activites">Activites</a></li>
		</ul>
	</nav>
	<div class="container-fluid" id="content">
		<h1>Nouveau collaborateur</h1>
		<br /> <br />
		<form
			class="form-horizontal col-sm-offset-1 col-sm-9  col-sm-offset-1"
			method="post" action="ajouter" id="ajout">
			<div class="form-group">
				<label class="col-sm-4" for="nom">Nom :</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="nom" id="nom" required>
				</div>
			</div>
			<div class="form-group">
				<label for="prenom" class="col-sm-4">Prénom :</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="prenom" id="prenom" required>
				</div>
			</div>
			<div class="form-group">
				<label for="date" class="col-sm-4">Date de naissance :</label>
				<div class="col-sm-8">
					<input type="date" class="form-control" name="date" id="date" required>
				</div>
			</div>
			<div class="form-group">
				<label for="Adresse" class="col-sm-4">Adresse :</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="adresse" id="adresse" required>
				</div>
			</div>
			<div class="form-group">
				<label for="numero" class="col-sm-4">Numero de
					sécurité sociale:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="numero" id="numero"> 
				</div>
			</div>
			<div class="col-sm-offset-4 col-sm-8">
				<input type="button" value="Créer" class="btn btn-default" name="creer" onclick="showModal()">
			</div>
		</form>

		<div id="modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Création d'un collaborateur</h4>
					</div>
					<div class="modal-body">
						Vous êtes sur le point de créer un nouveau collaborateur : <br />
						<div class="col-sm-6">
							<br />Nom <br /> Prenom <br /> Date de naissance <br /> Adresse <br />
							Numero de sécurité sociale <br /> <br />
						</div>
						<div class="col-sm-offset-2 col-sm-4" id="modalValues"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
						<button type="button" class="btn btn-default" id="confirm"
							onclick="submit()">Confirmer</button>
					</div>
				</div>

			</div>
		</div>
	</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>
