package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Cuenta;
import Negocio.NegocioCuenta;

@WebServlet("/servletCuenta")
public class servletCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NegocioCuenta negCuenta;

    public servletCuenta() {
        super();
		this.negCuenta = new NegocioCuenta();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnVermas") != null) {

			Cuenta c = new Cuenta();

			c.setCbu(request.getParameter("cbuCuenta"));

			c = negCuenta.obtenerCuenta(c.getCbu());

			request.setAttribute("datosCuenta", c);

			RequestDispatcher rd = request.getRequestDispatcher("/VistasAdminJSP/Detalle-ModificarCuenta.jsp");
			rd.forward(request, response);

		}
		if (request.getParameter("loadCuentas") != null && request.getParameter("loadHistorial") != null) {
			List<Cuenta> misCuentas = new ArrayList<>();
			misCuentas = negCuenta.readAll();
			request.getSession().setAttribute("misCuentas", misCuentas);
			RequestDispatcher rd = null;
			
			if((Boolean.parseBoolean(request.getParameter("loadCuentas")) && !Boolean.parseBoolean(request.getParameter("loadHistorial")))) {
				
				rd = request.getRequestDispatcher("/VistasClienteJSP/RealizarTransferencia.jsp");
			}
			else if ((Boolean.parseBoolean(request.getParameter("loadCuentas"))
					&& Boolean.parseBoolean(request.getParameter("loadHistorial")))) {
				
				rd = request.getRequestDispatcher("/VistasClienteJSP/VerMovimientos.jsp");
			}
			rd.forward(request, response);
		}



	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnListarCuentas") != null) {
			negCuenta = new NegocioCuenta();
			List<Cuenta> listaCuentas = null;
			
			
			try {
				listaCuentas = negCuenta.readAll();
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("listaCuentas", listaCuentas);
			System.out.println("Se encontraron " + listaCuentas.size() + " cuentas.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/VistasAdminJSP/ListarCuentas.jsp");
			dispatcher.forward(request, response);
		}



	}
	
}