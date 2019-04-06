package servlets;

import java.io.IOException;
import java.util.List;

//import javax.print.attribute.IntegerSyntax;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.*;
import controlador.ControladorNegocio;
import view.*;

/**
 * Servlet implementation class MiServlet
 */
@WebServlet("/MiServlet")

public class MiServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    /*public Controlador() {
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
        String jspPage = "/index.jsp";
        System.out.println(jspPage);
        if ((action == null) || (action.length() < 1))
        {
            action = "default";
        }

        if ("default".equals(action))
        {
            jspPage = "/index.jsp";
        }
        
        else if ("displaylist".equals(action))
        {
            List<AlumnoView> Alumnos = ControladorNegocio.getInstancia().getAlumnos();
            request.setAttribute("Alumnos", Alumnos);
            
            jspPage = "/ListaAlumnos.jsp";
        }
        
        else if ("displaylistCursos".equals(action))
        {
            List<CursoView> Cursos = ControladorNegocio.getInstancia().getCursos();
            request.setAttribute("Cursos", Cursos);
            
            jspPage = "/ListaCursos.jsp";
        }
        
        else if ("newAlumno".equals(action)){
        	jspPage = "/AltaAlumno.jsp";
        }
        
        else if ("saveAlumno".equals(action)) {
        	String nombre = request.getParameter("nombre");
        	ControladorNegocio.getInstancia().agregarAlumno(nombre);
			
        	jspPage = "/ListaAlumnos.jsp";
        }
        
        else if("newCurso".equals(action)) {
        	jspPage = "/AltaCurso.jsp";
        }
        
        else if ("saveCurso".equals(action)) {
        	String codigo = request.getParameter("codigo");
        	int legajo = Integer.parseInt(request.getParameter("legajo"));
        	String dia = request.getParameter("dia");
        	String turno = request.getParameter("turno");
        	int maximo = Integer.parseInt(request.getParameter("maximo"));
        	
        	ControladorNegocio.getInstancia().crearCurso(codigo, legajo, dia, turno, maximo);
			
        	jspPage = "/ListaCursos.jsp";
        }
        
        else if ("displayAlumno".equals(action))
        {
            int legajo = Integer.parseInt(request.getParameter("legajo"));
            Alumno Alumno = ControladorNegocio.getInstancia().buscarAlumno(legajo);
            request.setAttribute("Alumno", Alumno);

            jspPage = "/MostrarAlumno.jsp";
        }
        
        else if ("displayCurso".equals(action))
        {
            int numero = Integer.parseInt(request.getParameter("numero"));
            Curso Curso = ControladorNegocio.getInstancia().buscarCurso(numero);
            request.setAttribute("Curso", Curso);

            jspPage = "/MostrarCurso.jsp";
        }
        
        else if("enroll".equals(action)) {
        	int legajo = Integer.parseInt(request.getParameter("legajo"));
            request.setAttribute("legajo", legajo);
            
        	jspPage = "/FormInscripcion.jsp";
        }
        
        else if("saveInscription".equals(action)) {
        	int legajo = Integer.parseInt(request.getParameter("legajo"));
        	int numero = Integer.parseInt(request.getParameter("numero"));
        	
        	ControladorNegocio.getInstancia().inscribirAlumno(legajo, numero);
        	
        	jspPage = "/ListaAlumnos.jsp";
        }
        
        
        // En el detalle de Alumno, envia al formulario de edición
        else if ("editAlumno".equals(action))
        {
        	int legajo = Integer.parseInt(request.getParameter("legajo"));
            Alumno Alumno = ControladorNegocio.getInstancia().buscarAlumno(legajo);
            request.setAttribute("Alumno", Alumno);

            jspPage = "/EditarAlumno.jsp";            
        }
        
        // Después de la edición vuelve a la lista
        else if ("modificarAlumno".equals(action))
        {
            int legajo = Integer.parseInt(request.getParameter("legajo"));
            String nombre = request.getParameter("nombre");
            // String apellido = request.getParameter("apellido");
                                
           	ControladorNegocio.getInstancia().modificarAlumno(legajo, nombre);
         
            List<AlumnoView> Alumnos = ControladorNegocio.getInstancia().getAlumnos();
            request.setAttribute("Alumnos", Alumnos);
            
            jspPage = "/ListaAlumnos.jsp";            
        }
        
        dispatch(jspPage, request, response);
	}
	
	protected void dispatch(String jsp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if (jsp != null)
        {
        	/*Envía el control al JSP que pasamos como parámetro, y con los 
        	 * request / response cargados con los parámetros */
            RequestDispatcher rd = request.getRequestDispatcher(jsp);
            rd.forward(request, response);
        }
    }

}
