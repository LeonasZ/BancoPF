package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Cuenta;
import Entidades.Movimiento;
import Negocio.NegocioCliente;
import Negocio.NegocioCuenta;
import Negocio.NegocioMovimiento;

/**
 * Servlet implementation class servletsAgregarCuenta
 */
@WebServlet("/servletsAgregarCuenta")
public class servletsAgregarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletsAgregarCuenta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dni = request.getParameter("txtDni");
		String tipoCuenta = request.getParameter("ddlTipoCuenta");
		String cbu = request.getParameter("txtCBU");
		Cuenta cnt = new Cuenta();
		NegocioCliente nCli = new NegocioCliente();
		NegocioCuenta nCt = new NegocioCuenta();
		boolean flag1 = false;
		boolean flag2 = false;
		boolean flag3 = false;
		int resultado = 0;

		if (nCli.existeCliente(dni) == 1){
			
			flag1 = true;
			
			if (nCt.cantidadCuentasPorCliente(dni) < 3){
				
				flag2 = true;
				
				if(nCt.agregarCuenta(cnt) > 0) {
					
					cnt.setDni(request.getParameter("txtDni"));
					cnt.setUsuario_id(nCli.extraerUsuarioCliente(dni));
					cnt.setTipocuenta(tipoCuenta);
					cnt.setCbu(cbu);
					cnt.setSaldo(0);
					cnt.setFechacreacion("0/0/0");
					cnt.setEstado(true);
					flag3 = true;

					NegocioMovimiento mneg = new NegocioMovimiento();

					Date fecha = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String fechaFormateada = sdf.format(fecha);

					Movimiento movInicial = new Movimiento(cnt.getNumerodecuenta_id(), 1, fechaFormateada, 10000,
							"Depósito inicial");

					mneg.agregarMovimiento(movInicial);
				}
			}
		}
		
		if (flag1 == true && flag2 == false && flag3 == false) {
			//resultado = "El cliente ingresado no existe!";
			resultado = 1;
		}
		
		if (flag1 == true && flag2 == true && flag3 == false) {
			//resultado = "El cliente supera el maximo de cuentas permitidas!";
			resultado = 2;
		}
		
		if (flag1 == true && flag2 == false && flag3 == true) {
			//resultado = "Cuenta agregada con exito!";

			resultado = 3;
	}
		request.setAttribute("resultado", resultado);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/VistasAdminJSP/AgregarCuentas.jsp");
		dispatcher.forward(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
