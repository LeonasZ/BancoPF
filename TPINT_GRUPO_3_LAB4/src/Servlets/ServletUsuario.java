package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Usuario;
import Negocio.NegocioUsuario;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletUsuario() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		if (request.getParameter("btnIngresar") != null) {
			boolean ingresa = false;
			boolean esCliente = false;
			Usuario user = new Usuario();

			NegocioUsuario usuarioneg = new NegocioUsuario();

			try {
				List<Usuario> listaUsuarios = usuarioneg.readAll();
				String usuario = request.getParameter("txtUsuario");
				String contrasenia = request.getParameter("txtContraseña");

				for (Usuario us : listaUsuarios) {
					if (us.getUsuario().equals(usuario) && us.getPass().equals(contrasenia)) {
						user = us;
						ingresa = true;
						if (us.getTipoUsuario().equals("cliente")) {
							esCliente = true;
						}
						break;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			getServletContext().setAttribute("usuarioLogeado", user);
			request.setAttribute("ingresa", ingresa);
			request.setAttribute("esCliente", esCliente);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/LoginAdminCliente/Log.jsp");
			dispatcher.forward(request, response);

		}
	}
}
