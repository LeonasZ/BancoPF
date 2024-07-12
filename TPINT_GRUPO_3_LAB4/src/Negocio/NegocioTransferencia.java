package Negocio;

import java.util.List;

import Dominio.TransferenciaDao;
import Entidades.Transferencia;

public class NegocioTransferencia {
	private TransferenciaDao transferenciaDao;

	public NegocioTransferencia() {
		transferenciaDao = new TransferenciaDao();
	}

	public int agregarTransferencia(Transferencia transf) {

		return transferenciaDao.agregarTransferencia(transf);

	}

	public List<Transferencia> readAll() {
		return TransferenciaDao.readAll();
	}

}
