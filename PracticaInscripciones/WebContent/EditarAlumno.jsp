<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "controlador.ControladorNegocio"%>
<%@ page import= "negocio.Alumno"%>
<%@ page import= "negocio.Curso"%>
<%@ page import="java.util.List" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editar Alumno</title>
	</head>
	<body>
		<%
			Alumno c = (Alumno) request.getAttribute("Alumno");
			int legajo = c.getLegajo();
			List<Curso> cursos = c.getCursos();
		%>
		
			<input type="hidden" name="legajo" value="<%=legajo%>">
			<table cellspacing="3" cellpadding="3" border="1" width="60%">
				<tr>
					<td><b>Nombre:</b>
					<td><input type="text" name="nombre" value="<%=c.getNombre()%>"></td>
				</tr>
				<tr>
					<td><b>Legajo:</b>
					<td><input type="text" name="legajo" value="<%=c.getLegajo()%>"></td>
				</tr>
				<tr>
					<td><b>Cursos</b></td>
					<td>
					<% 
					for(Curso unCurso : cursos){
					%>
					<%=unCurso.getNumero() + ","%>
					<% } %></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="editar Alumno"></td>
				</tr>
				<tr>
				<td colspan="2">
				   <a href="MiServlet?action=modificarAlumno">Editar Alumno</a>
				</td>
				
				</tr>
			</table>
		
	</body>
</html>