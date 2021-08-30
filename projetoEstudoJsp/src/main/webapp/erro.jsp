<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tela de erro</title>
</head>
<body>
	<h2>Mensagem de erro , entre em contato com a equipe de suporte do sistema</h2>

<%
	out.print(request.getAttribute("msg"));
%>

</body>
</html>