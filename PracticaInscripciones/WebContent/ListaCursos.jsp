<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "java.util.Iterator"%>
<%@ page import= "java.util.List"%>
<%@ page import= "negocio.Curso"%>
<%@ page import= "controlador.ControladorNegocio"%>
<%@ page import= "view.CursoView"%>

<html>
	<head>
		<title>Cursos</title>
	</head>
	<body>

		<%
			List<CursoView> cursos = ControladorNegocio.getInstancia().getCursos();
		%>
		
		<table cellspacing="3" cellpadding="3" border="1" width="500">
			<tr>
				<td colspan="4"><b>Lista de Cursos</b></td>
			</tr>
			<tr>
				<td><b>Numero</b></td>
				<td><b>Materia</b></td>
				<td><b>Profesor</b></td>
				<td><b>Día</b></td>
				<td><b>Turno</b></td>
				<td><b>Vacantes</b></td>
			</tr>
		<%
			CursoView unCurso;
			
			for(Iterator<CursoView> i = cursos.iterator(); i.hasNext();)
			{
				unCurso = i.next();
				int numero = unCurso.getNumero();
				String materia = unCurso.getMateria();
				String profesor = unCurso.getProfesor();
				String dia = unCurso.getDia();
				String turno = unCurso.getTurno();
				int vacantes = unCurso.getVacantes();
		%>
			<tr>
				<td>
					<a href="MiServlet?action=displayCurso&numero=<%=numero%>"><%=numero%></a>
				</td>
				<td><%=unCurso.getMateria()%></td>
				<td><%=unCurso.getProfesor()%></td>
				<td><%=unCurso.getDia()%></td>
				<td><%=unCurso.getTurno()%></td>
				<td><%=unCurso.getVacantes()%></td>
			</tr>
		<% } %>
		</table>
	</body>
</html>