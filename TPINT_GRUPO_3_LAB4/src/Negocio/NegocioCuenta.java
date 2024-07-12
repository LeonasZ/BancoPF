package Negocio;

import java.util.List;

import Dominio.CuentaDao;
import Entidades.Cuenta;

public class NegocioCuenta {

	CuentaDao cDao = new CuentaDao();
	
	public int agregarCuenta(Cuenta ct) {
		return cDao.agregarCuenta(ct);
	}
	
	public int cantidadCuentasPorCliente(String dni) {
		return cDao.cantidadCuentasPorCliente(dni);
	}
	
	public List<Cuenta> readAll() {

		return cDao.readAll();
	}

	public Cuenta obtenerCuenta(String cbu) {
		return cDao.obtenerCuenta(cbu);
	}

	public int actualizarSaldo(float saldo, String cbu) {
		return cDao.actualizarSaldo(saldo, cbu);
	}

}
