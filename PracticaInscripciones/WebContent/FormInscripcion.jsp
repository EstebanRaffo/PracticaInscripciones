<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "negocio.Alumno"%>
<%@ page import= "negocio.Curso" %>
<%@ page import= "view.CursoView" %>
<%@ page import= "java.util.Iterator"%>
<%@ page import= "java.util.List"%>
<%@ page import= "controlador.ControladorNegocio" %>
<%@ include file="index.jsp" %>

<!DOCTYPE html>
<html>
	<head>
	    <!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<title>Inscripción</title>
	</head>
	<body>
		<% 
			List<CursoView> cursos = ControladorNegocio.getInstancia().getCursos();
	        int legajo = Integer.parseInt(request.getParameter("legajo"));
	        Alumno unAlumno = ControladorNegocio.getInstancia().buscarAlumno(legajo);
		%>
		<form action="MiServlet?action=saveInscription" method="post">
			<div class="form-row">		
				<div class="col">
					<div class="form-group">
					    <label>Nombre y Apellido</label> 
						<input name="nombre" type="text" class="form-control" id="exampleInputName" value=<%=unAlumno.getNombre()%>>
						<small id="nameHelp" class="form-text text-muted"></small>
					</div>
				</div>
								
				<div class="col">
					<div class="form-group">
						<label>Legajo:</label>
						<input name="legajo" type="text" class="form-control" value=<%=legajo%>>
						<small id="nameHelp" class="form-text text-muted"></small>
					</div>
				</div>
			</div>
			
			<div class="form-row">
				<div class="col">
					<div class="form-group">			
						<label>Numero de Curso:</label>
						<input name="numero" type="text">
						<small id="nameHelp" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="col">
					<div class="form-group">
						<label>Seleccione el Curso</label>
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
						 <small id="nameHelp" class="form-text text-muted"></small>
					</div>
				</div>		
			</div>
			<br><br>
			<button type="submit" class="btn btn-primary">Inscribir</button>
		</form>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</body>
</html>