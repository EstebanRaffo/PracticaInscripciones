<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "java.util.Iterator"%>
<%@ page import= "java.util.List"%>
<%@ page import= "negocio.Alumno"%>
<%@ page import= "controlador.ControladorNegocio"%>
<%@ page import= "view.AlumnoView"%>

<html>
	<head>
		<title>Alumnos</title>
	</head>
	<body>
		
		<%
			List<AlumnoView> alumnos = ControladorNegocio.getInstancia().getAlumnos();
		%>
		
		<table cellspacing="3" cellpadding="3" border="1" width="500">
			<tr>
				<td colspan="4"><b>Lista de Alumnos</b></td>
			</tr>
			<tr>
				<td><b>Legajo</b></td>
				<td><b>Nombre</b></td>
			</tr>
		<%
			AlumnoView unAlumno;
			int legajo; 	
			//List<Alumno> Alumnos = (List<Alumno>)request.getAttribute("Alumnos");
			
			for(Iterator<AlumnoView> i = alumnos.iterator(); i.hasNext();)
			{
				unAlumno = i.next();
				legajo = unAlumno.getLegajo();
		%>
			<tr>
				<td>
					<a href="Controlador?action=displayAlumno&legajo=<%=legajo%>"><%=legajo%></a>
				</td>
		
				<td><%=unAlumno.getNombre()%></td>
				<td><%=unAlumno.getLegajo()%></td>
			</tr>
		<% } %>
		</table>
	</body>
</html>