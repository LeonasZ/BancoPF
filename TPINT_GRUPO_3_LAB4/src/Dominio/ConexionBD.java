package Dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

	private static ConexionBD instancia;
	private Connection connection;

	private ConexionBD() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/banco?autoReconnect=true&useSSL=true", "root", "root");
			this.connection.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ConexionBD getConexion() {
		if (instancia == null) {
			instancia = new ConexionBD();
		}
		return instancia;
	}

	public Connection getSQLConexion() {
		return this.connection;
	}

	public void cerrarConexion() {
		try {
			if (this.connection != null && !this.connection.isClosed()) {
				this.connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			instancia = null;
		}
	}
}
