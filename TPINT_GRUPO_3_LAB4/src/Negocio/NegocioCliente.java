package Negocio;

import java.util.ArrayList;

import Dominio.ClienteDao;
import Entidades.Cliente;
import Entidades.Localidad;
import Entidades.Provincia;
import Entidades.Usuario;

public class NegocioCliente {
	ClienteDao cdao = new ClienteDao();

	
	public int agregarCliente(Cliente c, Usuario u) {
		return cdao.agregarCliente(c, u);
		}

	public int agregarUsuario(Cliente u) {
		return cdao.agregarUsuario(u);
	}
	public ArrayList<Provincia> obtenerProvincia() {
		return ClienteDao.obtenerProvincia();
	}
	
	public ArrayList<Localidad> obtenerLocalidad() {
		return ClienteDao.obtenerLocalidad();}
	
	public Usuario obtenerUsuario(String usuario) {
		return cdao.obtenerUsuario(usuario);
	}

	public ArrayList<Cliente> obtenerClientes() {

		return cdao.obtenerClientes();

	}

	public Cliente obtenerCliente(String dni, int usuario) {
		return cdao.obtenerCliente(dni,usuario);
	}

	public int eliminarCliente(String dni) {
		return cdao.eliminarCliente(dni);
	}
	
	public int modificarCliente(Cliente c) {
			return cdao.modificarCliente(c);
	}

	public int modificarUsuario(Usuario u) {
		return cdao.modificarUsuario(u);
		
	}
	
	public int existeCliente(String dni) {
		return cdao.existeCliente(dni);
	}
	
	public int extraerUsuarioCliente(String dni) {
		return cdao.extraerUsuarioCliente(dni);
	}
}

