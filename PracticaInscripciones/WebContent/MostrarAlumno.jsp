<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import= "controlador.ControladorNegocio"%>
<%@ page import= "negocio.Alumno"%>
<%@ page import= "negocio.Curso"%>
<%@ page import= "view.CursoView"%>
<%@ page import= "java.util.Iterator"%>
<%@ page import= "java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Datos del Alumno</title>
	</head>
	<body>
		<%
			Alumno unAlumno = (Alumno)request.getAttribute("Alumno");
	        List<Curso> cursos = unAlumno.getCursos();
	        //request.setAttribute("Cursos", Cursos);
		
		%>
		<table cellspacing="3" cellpadding="3" border="1" width="60%">
			<tr>
				<td colspan="2"><b>Alumno:</b> 
			     <%=unAlumno.getNombre()%>,<%=unAlumno.getNombre()%>
				</td>
			</tr>
			<tr>
				<td><b>Legajo</b></td>
				<td><%=unAlumno.getLegajo()%></td>
			</tr>
			<tr>
				<td><b>Nombre</b></td>
				<td><%=unAlumno.getNombre()%></td>
			</tr>
			<tr>
				<td><b>Cursos</b></td>
				<% 
				for(Curso unCurso : cursos){
				%>
				<td><%=unCurso.getNumero()%></td>
				<% } %>
			</tr>
			<tr>
				<td colspan="2">
				   <a href="Controlador?action=editAlumno&legajo=<%=unAlumno.getLegajo()%>">Editar Alumno</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="Controlador?action=enroll&legajo=<%=unAlumno.getLegajo()%>">Inscribir</a>
				</td>
			</tr>
		</table>
	</body>
</html>