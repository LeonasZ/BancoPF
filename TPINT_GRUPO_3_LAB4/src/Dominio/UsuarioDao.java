package Dominio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entidades.Usuario;

public class UsuarioDao {
	private final static String readAll = "SELECT * FROM usuario";

	public static List<Usuario> readAll() {
		List<Usuario> listaUsuarios = new ArrayList<>();
		Connection cn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			cn = ConexionBD.getConexion().getSQLConexion();
			if (cn != null) {
				statement = cn.prepareStatement(readAll);
				rs = statement.executeQuery();

				while (rs.next()) {
					Usuario usuario = new Usuario();
					usuario.setIdUsuario(rs.getInt("usuario_id"));
					usuario.setUsuario(rs.getString("usuario"));
					usuario.setPass(rs.getString("contraseña"));
					usuario.setTipoUsuario(rs.getString("tipousuario"));

					if ("activo".equals(rs.getString("estado"))) {
						usuario.setEstado(true);
					} else {
						usuario.setEstado(false);
					}

					listaUsuarios.add(usuario);
				}
			} else {
				System.out.println("Conexión a la base de datos no establecida.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (statement != null)
					statement.close();
				if (cn != null)
					ConexionBD.getConexion().cerrarConexion();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return listaUsuarios;
	}
}
