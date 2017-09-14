<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<%@ taglib uri= "http://www.springframework.org/tags/form" prefix= "form" %>
<%@ taglib uri= "http://www.springframework.org/tags" prefix= "s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
 integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>CRUD de Cartórios</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/estilo.css"/>"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
</head>
<body style="background-color: #3580B5">
	<div style="margin: 50px"></div>
	<div class="container">
		<div class="row justify-content-center">
    		<div class="col-8">
				<div class="card text-center">
				  <div class="card-header">
				  	<h5>Formulário</h5>
				  </div>
				  <div class="card-body">
				    <form:form action="${s:mvcUrl('CC#gravar').build()}" method="post" commandName="cartorio">
					 	<div class="form-group row">
					      <label class="col-sm-2 col-form-label">Cartório</label>
					      <div class="col-sm-8">
					        <input type="text" class="form-control" id="inputEmail3" placeholder="Cartório" name="cartorio">
					      </div>
					      <button type="submit" class="btn btn-outline-dark">Cadastrar</button>
					      <form:errors path="cartorio"></form:errors>
					    </div>	
					    <p> ${sucesso} </p>	
					    <div class="form-group row">
					    <table class="table table-hove table-responsive table-bordered table-sm" id="tabela">
						  <thead>
						  	<tr>
						  		<th></th>
						  		<th><input type="text" class="form-control" placeholder="Filtrar" name="filtro"></th>
						  		<th></th>
						  		<th></th>
						  	</tr>
						    <tr class="bg-info">
						      <th class="cabeçalho">ID</th>
						      <th class="cabeçalho">Cartório</th>
						      <th class="cabeçalho">Editar</th>
						      <th class="cabeçalho">Remover</th>
						    </tr>
						  </thead>
						  <tbody>
						    <c:forEach items="${cartorios}" var="cart">
						        <tr class="table-info">
						            <td>${cart.id}</td>
						            <td>${cart.cartorio}</td>
						            <td>
						            	<a href="editar?id=${cart.id}" class="badge badge-primary">Editar</a>
						            <td>
						            	<a href="remover?id=${cart.id}" class="badge badge-danger">Remover</a>
						            </td>
						        </tr>
						    </c:forEach>
						  </tbody>
						</table>
					    </div>			 	
					</form:form>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value="/resources/js/filtro.js"/>"></script>
</body>
</html>