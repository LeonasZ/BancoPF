package Negocio;

import java.util.List;

import Dominio.UsuarioDao;
import Entidades.Usuario;

public class NegocioUsuario {

	public List<Usuario> readAll() {

		List<Usuario> listaUsuarios = UsuarioDao.readAll();

		return listaUsuarios;
	}

}
