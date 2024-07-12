package Negocio;

import java.util.List;

import Dominio.MovimientoDao;
import Entidades.Movimiento;

public class NegocioMovimiento {
	private MovimientoDao movimientoDao;

	public NegocioMovimiento() {
		movimientoDao = new MovimientoDao();
	}

	public int agregarMovimiento(Movimiento mov) {

		return movimientoDao.agregarMovimiento(mov);

	}

	public List<Movimiento> obtenerMovimientosPorCuenta(int idCuenta) {
		return movimientoDao.obtenerMovimientosPorCuenta(idCuenta);
	}

	public List<Movimiento> readAll() {
		return MovimientoDao.readAll();
	}
}
