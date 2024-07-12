package Entidades;

public class Cliente {
	
	private String dni;
	private int usuario_id;
	private String cuil;
	private String nombre;
	private String apellido;
	private String sexo;
	private String nacionalidad;
	private String fechadenacimiento;
	private String direccion;
	private String localidad_id;
	private String provincia_id;
	private String correoelectronico;
	private String telefono;
	private String usuario_nombre;
	private String contraseña;
	private Boolean estado;
	
	private static int cont = 1;
	
	public String getUsuario_nombre() {
		return usuario_nombre;
	}


	public void setUsuario_nombre(String usuario_nombre) {
		this.usuario_nombre = usuario_nombre;
	}


	public String getContraseña() {
		return contraseña;
	}


	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}


	public Cliente() {
		cont++;
	}

	
	public Cliente(String dni, String cuil, String nombre, String apellido, String sexo, String nacionalidad,
			String nacimiento, String direccion, String localidad, String provincia, String correo, String telefono,
			String contrasena, Boolean estado) {
		super();
		this.dni = dni;
		this.cuil = cuil;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.nacionalidad = nacionalidad;
		this.fechadenacimiento = nacimiento;
		this.direccion = direccion;
		this.localidad_id = localidad;
		this.provincia_id = provincia;
		this.correoelectronico = correo;
		this.telefono = telefono;
		this.usuario_id = cont;
		this.estado = estado;
		cont++;
	}




	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getCuil() {
		return cuil;
	}

	public void setCuil(String cuil) {
		this.cuil = cuil;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public String getNacimiento() {
		return fechadenacimiento;
	}

	public void setNacimiento(String nacimiento) {
		this.fechadenacimiento = nacimiento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getLocalidad() {
		return localidad_id;
	}

	public void setLocalidad(String localidad) {
		this.localidad_id = localidad;
	}

	public String getProvincia() {
		return provincia_id;
	}

	public void setProvincia(String provincia) {
		this.provincia_id = provincia;
	}

	public String getCorreo() {
		return correoelectronico;
	}

	public void setCorreo(String correo) {
		this.correoelectronico = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public int getUsuario() {
		return usuario_id;
	}

	public void setUsuario(int usuario) {
		this.usuario_id = usuario;
	}

	public Boolean getEstado() {
		return estado;
	}

	public void setEstado(Boolean i) {
		this.estado = i;
	}
	
	
	

}
