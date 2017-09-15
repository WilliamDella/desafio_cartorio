<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<style type="text/css">
	.cabecalho {
		text-align: center;
	}
</style>
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
						  		<th><input type="text" class="form-control" placeholder="Filtrar" name="filtro"></th>
						  		<th><input type="text" class="form-control" placeholder="Filtrar" name="filtro"></th>
						  		<th></th>
						  		<th></th>
						  	</tr>
						    <tr class="bg-info">
						      <th class="cabecalho">ID</th>
						      <th class="cabecalho">Cartório</th>
						      <th class="cabecalho">Editar</th>
						      <th class="cabecalho">Remover</th>
						    </tr>
						  </thead>
						  <tbody>
						    <c:forEach items="${cartorios}" var="cart">
						        <tr class="table-info">
						            <td>${cart.id}</td>
						            <td>${cart.cartorio}</td>
						            <td>
						            	<a href="<c:url value='editar/${cart.id}'/>" class="badge badge-primary">Editar</a>
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