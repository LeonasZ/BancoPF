package Entidades;

public class Transferencia {

	private int transferencia_id;
	private int movimientoOrigen;
	private int movimientoDestino;

	public Transferencia() {
		transferencia_id = -1;
		movimientoOrigen = -1;
		movimientoDestino = -1;
	}


	public Transferencia(int movOrigen, int movDestino) {
		this.movimientoOrigen = movOrigen;
		this.movimientoDestino = movDestino;
	}

	public int getTransferencia_id() {
		return transferencia_id;
	}

	public void setTransferencia_id(int transferencia_id) {
		this.transferencia_id = transferencia_id;
	}

	public int getMovimientoOrigen() {
		return movimientoOrigen;
	}

	public void setMovimientoOrigen(int movimientoOrigen) {
		this.movimientoOrigen = movimientoOrigen;
	}

	public int getMovimientoDestino() {
		return movimientoDestino;
	}

	public void setMovimientoDestino(int movimientoDestino) {
		this.movimientoDestino = movimientoDestino;
	}

}
