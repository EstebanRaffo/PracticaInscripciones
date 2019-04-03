<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "controlador.ControladorNegocio"%>
<%@ page import= "negocio.Alumno"%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Alta de Curso</title>
	</head>
	<body>
		<form action="Controlador?action=saveCurso">
			<br>Código de Materia<br>
			<input type="text" name="codigo">
			<br>Legajo del Profesor<br>
			<input type="text" name="legajo">
			<br>Día de cursada<br>
			<input type="text" name="dia">
			<br>Turno<br>
			<input type="text" name="turno">
			<br>Cantidad de Vacantes<br>
			<input type="text" name="maximo">
			<br><br>
			<input type="submit" value="Guardar">
		</form>
	</body>
</html>

<%-- 
	crearCurso(String codigo de materia, int legajo del profesor, String dia, String turno, int maximo de vacantes)
	
	<body>
		<%
			Cliente c = (Cliente) request.getAttribute("cliente");
			String id = c.getId();
		%>
		
			<input type="hidden" name="id" value="<%=id%>">
			<table cellspacing="3" cellpadding="3" border="1" width="60%">
				<tr>
					<td><b>Nombre:</b>
					<td><input type="text" name="nombre" value="<%=c.getNombre()%>"></td>
				</tr>
				<tr>
					<td><b>Apellido:</b>
					<td><input type="text" name="apellido" value="<%=c.getApellido()%>"></td>
				</tr>
				<tr>
					<td><b>Direccion:</b>
					<td><input type="text" size="50" name="direccion" value="<%=c.getDireccion()%>"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="editar cliente"></td>
				</tr>
				<tr>
				<td colspan="2">
				   <a href="Controlador?action=modificarCliente">Editar Cliente</a>
				</td>
				
				</tr>
			</table>
		
</body> --%>