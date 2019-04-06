<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "servlets.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Práctica Web</title>
	</head>
	<body>
		<b><a href="MiServlet?action=displaylist" target="_self">Lista de Alumnos</a></b>
		<b><a href="MiServlet?action=newAlumno" target="_self">Alta de Alumno</a></b>
		<br><br>
		<b><a href="MiServlet?action=displaylistCursos" target="_self">Lista de Cursos</a></b>
		<b><a href="MiServlet?action=newCurso" target="_self">Alta de Curso</a></b>
	</body>
</html>