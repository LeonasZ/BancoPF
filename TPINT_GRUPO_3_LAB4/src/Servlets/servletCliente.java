package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Cliente;
import Entidades.Usuario;
import Negocio.NegocioCliente;

/**
 * Servlet implementation class servletCliente
 */
@WebServlet("/servletCliente")
public class servletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NegocioCliente ncl = new NegocioCliente();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("btnAgregar")!=null)
		{
			int filas = 0;
			if(request.getParameter("txtContrasena").equals(request.getParameter("txtRepetirContrasena"))) {
				
				Cliente c  =  new Cliente();
				c.setDni(request.getParameter("txtDni"));
				c.setCuil(request.getParameter("txtCuil"));
				c.setNombre(request.getParameter("txtNombre"));
				c.setApellido(request.getParameter("txtApellido"));
				c.setSexo(request.getParameter("ddlSexo"));
				c.setNacionalidad(request.getParameter("txtNacionalidad"));
				c.setNacimiento(request.getParameter("txtNacimiento"));
				c.setDireccion(request.getParameter("txtDireccion"));
				c.setLocalidad(request.getParameter("ddlLocalidad"));
				c.setProvincia(request.getParameter("ddlProvincia"));
				c.setCorreo(request.getParameter("txtCorreo"));
				c.setTelefono(request.getParameter("txtTelefono"));
				c.setUsuario_nombre(request.getParameter("txtUsuario"));
				c.setContraseña(request.getParameter("txtContrasena"));
				c.setEstado(true);
		
							try {
					ncl.agregarUsuario(c);
					Usuario u = ncl.obtenerUsuario(c.getUsuario_nombre());
					filas = ncl.agregarCliente(c, u);
							}
							catch (Exception e) {
								e.printStackTrace();
							}
							
							request.setAttribute("cantFilas", filas);
							request.setAttribute("infoCliente", c);
						
			}
			else { request.setAttribute("cantFilas", -2); } //las contraseñas no coinciden
			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/AgregarClientes.jsp");   
	        rd.forward(request, response);   
		
			
		}
		if (request.getParameter("Modificar") != null) {

			Cliente c = new Cliente();

			c.setDni(request.getParameter("dniCliente"));
			c.setUsuario( Integer.parseInt(request.getParameter("UsuarioCliente")));

			c = ncl.obtenerCliente(c.getDni(),c.getUsuario());

			request.setAttribute("datosCliente", c);

			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/Detalle-ModificarCliente.jsp");
			rd.forward(request, response);

		}
		int filas = 0;

		if (request.getParameter("btnEliminar") != null) {

			String dni = (request.getParameter("txtDni").toString());
			filas = ncl.eliminarCliente(dni);

			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/ListarClientes.jsp");
			rd.forward(request, response);
	}
		if(request.getParameter("btnModificarCliente")!=null)
		{
			filas=0;
			
			Cliente c  =  new Cliente();
			Usuario u = new Usuario();
			
			c.setDni(request.getParameter("txtDni"));
			c.setNombre(request.getParameter("txtNombre"));
			c.setApellido(request.getParameter("txtApellido"));
			c.setSexo(request.getParameter("ddlSexo"));
			c.setNacionalidad(request.getParameter("txtNacionalidad"));
			c.setNacimiento(request.getParameter("txtNacimiento"));
			c.setDireccion(request.getParameter("txtDireccion"));
			c.setLocalidad(request.getParameter("ddlLocalidad"));
			c.setProvincia(request.getParameter("ddlProvincia"));
			c.setCorreo(request.getParameter("txtCorreo"));
			c.setTelefono(request.getParameter("txtTelefono"));
			u.setPass(request.getParameter("txtContraseña"));
			u.setUsuario(request.getParameter("txtUsuario"));
			
			ncl.modificarUsuario(u);
			filas = ncl.modificarCliente(c);
			

			request.setAttribute("cantFilas", filas);
			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/ListarClientes.jsp");   
	        rd.forward(request, response);    
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("btnListarClientes") != null) {
			ArrayList<Cliente> lista = ncl.obtenerClientes();

			request.setAttribute("listaC", lista);
			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/ListarClientes.jsp");
			rd.forward(request, response);
		}

	}

	}


