<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "negocio.Alumno"%>
<%@ page import= "negocio.Curso" %>
<%@ page import= "view.CursoView" %>
<%@ page import= "java.util.Iterator"%>
<%@ page import= "java.util.List"%>
<%@ page import= "controlador.ControladorNegocio" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Inscripción</title>
	</head>
	<body>
		<% 
			List<CursoView> cursos = ControladorNegocio.getInstancia().getCursos();
	        int legajo = Integer.parseInt(request.getParameter("legajo"));
	        Alumno unAlumno = ControladorNegocio.getInstancia().buscarAlumno(legajo);
		%>
		<form action="MiServlet?action=saveInscription" method="post">
			<br>Legajo<br> 
			<input name="legajo" type="text" value=<%=unAlumno.getNombre()%>>
			<br>Alumno:<br>
			<input name="nombre" type="text" value=<%=legajo%>>
			<br>Numero de Curso<br>
			<input name="numero" type="text">
			<br>Seleccione el Curso<br>
			<select name="cursos">
			<% 
				CursoView unCurso;
				
				for(Iterator<CursoView> i = cursos.iterator(); i.hasNext();)
				{
					unCurso = i.next();	
					
			%>
				<option value=<%=unCurso.getNumero()%>><%=unCurso.getNumero()%></option>
			<% 	} %>
			</select>
			
			<br><br>
			<input type="submit" value="Inscribir">
		</form>
	
	</body>
</html>