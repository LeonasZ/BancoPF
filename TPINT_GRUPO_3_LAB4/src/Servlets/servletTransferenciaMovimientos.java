package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Cuenta;
import Entidades.Movimiento;
import Entidades.Transferencia;
import Negocio.NegocioCuenta;
import Negocio.NegocioMovimiento;
import Negocio.NegocioTransferencia;

@WebServlet("/servletTransferenciaMovimiento")
public class servletTransferenciaMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public servletTransferenciaMovimientos() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("procesarTransferencia") != null) {
			String cbuOrigen = request.getParameter("cuenta_remitente");
			String cbuDestino = request.getParameter("cuenta_destinatario");
			String detalleMov = request.getParameter("concepto");
			float importe = Float.parseFloat(request.getParameter("monto"));


			NegocioCuenta cneg = new NegocioCuenta();
			Cuenta cuentaDestino = cneg.obtenerCuenta(cbuDestino);
			Cuenta cuentaOrigen = cneg.obtenerCuenta(cbuOrigen);

			boolean transferenciaRealizada = false;
			if (cuentaDestino != null && cuentaDestino.getUsuario_id() != -1
					&& !cuentaOrigen.getCbu().equals(cuentaDestino.getCbu())) {
				if (importe <= cuentaOrigen.getSaldo()) {

					NegocioMovimiento mneg = new NegocioMovimiento();

					float saldoCuentaOrigen = cuentaOrigen.getSaldo() - importe;
					cneg.actualizarSaldo(saldoCuentaOrigen, cuentaOrigen.getCbu());

					float saldoCuentaDestino = cuentaDestino.getSaldo() + importe;
					cneg.actualizarSaldo(saldoCuentaDestino, cuentaDestino.getCbu());

					Date fecha = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String fechaFormateada = sdf.format(fecha);

					Movimiento movCuentaOrigen = new Movimiento(cuentaOrigen.getNumerodecuenta_id(), 4, fechaFormateada,
							importe, detalleMov);
					Movimiento movCuentaDestino = new Movimiento(cuentaDestino.getNumerodecuenta_id(), 3,
							fechaFormateada, importe, detalleMov);

					int idMovOrigen = mneg.agregarMovimiento(movCuentaOrigen);
					int idMovDestino = mneg.agregarMovimiento(movCuentaDestino);

					NegocioTransferencia tneg = new NegocioTransferencia();
					tneg.agregarTransferencia(new Transferencia(idMovOrigen, idMovDestino));

					transferenciaRealizada = true;
				}
			}

			request.setAttribute("transferenciaRealizada", transferenciaRealizada);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/VistasClienteJSP/RealizarTransferencia.jsp");
			dispatcher.forward(request, response);
		}

				
		if (request.getParameter("btnMostrarHistorial") != null) {
            String idCuentaStr = request.getParameter("id_cuenta_remitente");

            if (idCuentaStr != null && !idCuentaStr.isEmpty()) {
                try {
                    int idCuenta = Integer.parseInt(idCuentaStr);
                    NegocioMovimiento movneg = new NegocioMovimiento();
                    List<Movimiento> listaMovimientos = movneg.obtenerMovimientosPorCuenta(idCuenta);
                    request.setAttribute("listaMovimientos", listaMovimientos);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            } else {
                // Manejo de caso en que id_cuenta_remitente es nulo o vacío
                System.out.println("id_cuenta_remitente es nulo o vacío");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/VistasClienteJSP/VerMovimientos.jsp");
            dispatcher.forward(request, response);
        

		}
	}

}
