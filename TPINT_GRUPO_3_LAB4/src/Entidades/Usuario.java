package Entidades;

public class Usuario {

	private int idUsuario;
	private String usuario;
	private String pass;
	private String tipoUsuario;
	private boolean estado;

	public Usuario() {
		idUsuario = -1;
		usuario = "vacio";
		pass = "vacio";
		tipoUsuario = "vacio";
		estado = false;
	}

	public Usuario(int id, String usuario, String pass, String tipoUsuario, boolean estado) {
		this.idUsuario = id;
		this.usuario = usuario;
		this.pass = pass;
		this.tipoUsuario = tipoUsuario;
		this.estado = estado;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", usuario=" + usuario + ", pass=" + pass + ", tipoUsuario="
				+ tipoUsuario + ", estado=" + estado + "]";
	}

}
