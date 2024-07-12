package Entidades;

public class Provincia {

	private int provincia_id;
	private String nombreprovincia;
	private String codigoprovincia;
	
	public Provincia(){
		
	}
	
	public Provincia(int id,String nombre,String codigo){
		this.provincia_id = id;
		this.nombreprovincia = nombre;
		this.codigoprovincia = codigo;
	}

	public int getProvincia_id() {
		return provincia_id;
	}

	public void setProvincia_id(int provincia_id) {
		this.provincia_id = provincia_id;
	}

	public String getNombreprovincia() {
		return nombreprovincia;
	}

	public void setNombreprovincia(String nombreprovincia) {
		this.nombreprovincia = nombreprovincia;
	}

	public String getCodigoprovincia() {
		return codigoprovincia;
	}

	public void setCodigoprovincia(String codigoprovincia) {
		this.codigoprovincia = codigoprovincia;
	}
	
	

}
