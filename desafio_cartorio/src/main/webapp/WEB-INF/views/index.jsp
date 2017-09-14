<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri= "http://www.springframework.org/tags" prefix= "s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
 integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<title>Home</title>
</head>

<body style="background-color: #3580B5">
	<div style="margin: 100px"></div>
	<div class="container">
		<div class="row justify-content-center">
    		<div class="col-6">
				<div class="card text-center">
				  <div class="card-header">
				  	<img src="<c:url value="/resources/images/logo-header.svg"/>" style="width: 80px">
				  </div>
				  <div class="card-body">
				    <h4 class="card-title">Sistema de Cartórios</h4>
				    <p class="card-text">Este sistema consiste em um CRUD de cartórios utilizando as seguintes tecnologias: JSP, Spring MVC e JPA/Hibernate</p>
				    <a href="${s:mvcUrl('CC#form').build()}" class="btn btn-outline-info">Entre</a>
				  </div>
				  <div class="card-footer text-muted">
				    2017
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>