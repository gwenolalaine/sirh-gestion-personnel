<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="style.css">
	<style>
	.error {
		color: red;
	}
	</style>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
	   	 	<div class="navbar-header">
	     		<a class="navbar-brand" href="#" style="max-width: 5%" >Enterprise</a>
	   		</div>
			<ul class="nav navbar-nav">
				<li><a href="<%=request.getContextPath()%>/collaborateurs/lister" id="collaborateurs">Collaborateurs</a></li>
				<li><a href="#!statistiques" id="statistiques">Statistiques</a></li>
				<li><a href="#!activites" id="activites">Activites</a></li>
			</ul>
		</div>
	</nav>
	
<div class="container-fluid" id="content">