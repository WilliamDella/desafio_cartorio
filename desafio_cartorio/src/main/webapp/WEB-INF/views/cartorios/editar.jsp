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
<title>Edição de Cartório</title>
</head>
<body style="background-color: #3580B5">
	<div style="margin: 50px"></div>
	<div class="container">
		<div class="row justify-content-center">
    		<div class="col-8">
				<div class="card text-center">
				  <div class="card-header">
				  	<h5>Editar Cartório</h5>
				  </div>
				  <div class="card-body">
				    <form:form action="${s:mvcUrl('CC#altera').arg(0, cartorio.id).build()}" method="post" modelAttribute="cartorio">
					 	<div class="form-group row">
					      <form:label path="id" class="col-sm-2 col-form-label">ID:</form:label>
					      <div class="col-sm-2">
					      	 <form:input path="id" type="text" readonly="true" class="form-control-plaintext" value="${cartorio.id}"/>
					      </div>
					  	</div>
					 	<div class="form-group row">					 	  
					      <form:label path="cartorio" class="col-sm-2 col-form-label">Cartório</form:label>
					      <div class="col-sm-8">
					        <form:input path="cartorio" type="text" class="form-control" name="cartorio" value="${cartorio.cartorio}"/>
					      </div>
					      <button type="submit" class="btn btn-outline-dark">Editar</button>
					    </div>
					</form:form>
				  </div>
				  <div class="card-footer text-muted">
				    <a href="${s:mvcUrl('CC#form').build()}" class="badge badge-danger">Cancelar</a>
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>