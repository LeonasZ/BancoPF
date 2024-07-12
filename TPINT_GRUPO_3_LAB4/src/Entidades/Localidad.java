package Entidades;

public class Localidad {
	
	private int localidad_id;
	private int provincia_id;
	private String nombrelocalidad;
	
	public Localidad() {}
	
	public Localidad (int localidad_id, int provincia_id, String nombre) {
		this.localidad_id= localidad_id;
		this.provincia_id= provincia_id;
		this.nombrelocalidad= nombre;
	}

	public int getLocalidad_id() {
		return localidad_id;
	}

	public void setLocalidad_id(int localidad_id) {
		this.localidad_id = localidad_id;
	}

	public int getProvincia_id() {
		return provincia_id;
	}

	public void setProvincia_id(int provincia_id) {
		this.provincia_id = provincia_id;
	}

	public String getNombrelocalidad() {
		return nombrelocalidad;
	}

	public void setNombrelocalidad(String nombrelocalidad) {
		this.nombrelocalidad = nombrelocalidad;
	}
	
	
}
