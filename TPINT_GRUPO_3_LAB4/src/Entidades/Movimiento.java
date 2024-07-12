package Entidades;

public class Movimiento {
	private int movimientoId;
	private int numeroDeCuentaId;
	private int tipoMovimientoId;
	private String fechaMovimiento;
	private float importe;
	private String detalleMovimiento;

	public Movimiento() {

	}

	// Constructor
	public Movimiento(int numeroDeCuentaId, int tipoMovimientoId, String fechaMovimiento,
			float importe, String detalleMovimiento) {

		this.numeroDeCuentaId = numeroDeCuentaId;
		this.tipoMovimientoId = tipoMovimientoId;
		this.fechaMovimiento = fechaMovimiento;
		this.importe = importe;
		this.detalleMovimiento = detalleMovimiento;
	}

	// Getters y Setters
	public int getMovimientoId() {
		return movimientoId;
	}

	public void setMovimientoId(int movimientoId) {
		this.movimientoId = movimientoId;
	}

	public int getNumeroDeCuentaId() {
		return numeroDeCuentaId;
	}

	public void setNumeroDeCuentaId(int numeroDeCuentaId) {
		this.numeroDeCuentaId = numeroDeCuentaId;
	}

	public int getTipoMovimientoId() {
		return tipoMovimientoId;
	}

	public void setTipoMovimientoId(int tipoMovimientoId) {
		this.tipoMovimientoId = tipoMovimientoId;
	}

	public String getFechaMovimiento() {
		return fechaMovimiento;
	}

	public void setFechaMovimiento(String fechaMovimiento) {
		this.fechaMovimiento = fechaMovimiento;
	}

	public float getImporte() {
		return importe;
	}

	public void setImporte(float importe) {
		this.importe = importe;
	}

	public String getDetalleMovimiento() {
		return detalleMovimiento;
	}

	public void setDetalleMovimiento(String detalleMovimiento) {
		this.detalleMovimiento = detalleMovimiento;
	}
}

