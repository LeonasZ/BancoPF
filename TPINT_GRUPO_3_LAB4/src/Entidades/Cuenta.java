package Entidades;

public class Cuenta {
	
	private int numerodecuenta_id;
	private String dni;
	private int usuario_id;
	private String tipocuenta;
	private String cbu;
	private float saldo;
	private String fechacreacion;
	private boolean estado;
	
	
	public Cuenta(String dni, int usuario_id, String tipocuenta, String cbu, float saldo, String fechacreacion,
			boolean estado) {
		super();
		this.dni = dni;
		this.usuario_id = usuario_id;
		this.tipocuenta = tipocuenta;
		this.cbu = cbu;
		this.saldo = saldo;
		this.fechacreacion = fechacreacion;
		this.estado = estado;
	}
	
	public Cuenta() {
		usuario_id = -1;
	}
	
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public int getUsuario_id() {
		return usuario_id;
	}
	public void setUsuario_id(int usuario_id) {
		this.usuario_id = usuario_id;
	}
	public String getTipocuenta() {
		return tipocuenta;
	}
	public void setTipocuenta(String tipocuenta) {
		this.tipocuenta = tipocuenta;
	}
	public String getCbu() {
		return cbu;
	}
	public void setCbu(String cbu) {
		this.cbu = cbu;
	}
	public float getSaldo() {
		return saldo;
	}
	public void setSaldo(float saldo) {
		this.saldo = saldo;
	}
	public String getFechacreacion() {
		return fechacreacion;
	}
	public void setFechacreacion(String fechacreacion) {
		this.fechacreacion = fechacreacion;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Cuenta [dni=" + dni + ", usuario_id=" + usuario_id + ", tipocuenta=" + tipocuenta + ", cbu=" + cbu
				+ ", saldo=" + saldo + ", fechacreacion=" + fechacreacion + ", estado=" + estado + "]";
	}

	public int getNumerodecuenta_id() {
		return numerodecuenta_id;
	}

	public void setNumerodecuenta_id(int numerodecuenta_id) {
		this.numerodecuenta_id = numerodecuenta_id;
	}

	
}
