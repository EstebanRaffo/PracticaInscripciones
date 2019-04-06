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
		<title>Datos del Curso</title>
	</head>
	<body>
		<%
			Curso unCurso = (Curso)request.getAttribute("Curso");
	        List<Alumno> alumnos = unCurso.obtenerAlumnos();
	        //request.setAttribute("Cursos", Cursos);
	       
		
		%>
		<table cellspacing="3" cellpadding="3" border="1" width="60%">
			<tr>
				<td colspan="2"><b>Numero:</b> 
			     <%=unCurso.getNumero()%>
				</td>
			</tr>
			<tr>
				<td><b>Profesor</b></td>
				<td><%=unCurso.getProfesor().getNombre()%></td>
			</tr>
			<tr>
				<td><b>Materia</b></td>
				<td><%=unCurso.getMateria().getDescripcion()%></td>
			</tr>
			<tr>
				<td><b>Dia</b></td>
				<td><%=unCurso.getDia()%></td>
			</tr>
			<tr>
				<td><b>Turno</b></td>
				<td><%=unCurso.getTurno()%></td>
			</tr>
			<tr>
				<td><b>Vacantes</b></td>
				<td><%=unCurso.getMaximo()%></td>
			</tr>
			<tr>
				<td><b>Inscriptos</b></td>
				<td><% 
					for(Alumno unAlumno : alumnos){
					%>
					<a href="MiServlet?action=displayAlumno&legajo=<%=unAlumno.getLegajo()%>">
					<%=unAlumno.getNombre() + ","%> 
					<% } %></a>
				</td>
			</tr>

		</table>
	</body>
</html>