package Dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Entidades.Transferencia;

public class TransferenciaDao {
	private static String host = "jdbc:mysql://localhost:3306/";
	private static String user = "root";
	private static String pass = "root";
	private static String dbName = "banco";

	private final static String readAll = "SELECT * FROM transferencia";

	public static List<Transferencia> readAll() {
		List<Transferencia> listaTransferencias = new ArrayList<>();
		Connection cn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			cn = ConexionBD.getConexion().getSQLConexion();
			if (cn != null) {
				statement = cn.prepareStatement(readAll);
				rs = statement.executeQuery();

				while (rs.next()) {
					Transferencia transferencia = new Transferencia();
					transferencia.setTransferencia_id(rs.getInt("transferencia_id"));
					transferencia.setMovimientoOrigen(rs.getInt("movimientoorigen"));
					transferencia.setMovimientoDestino(rs.getInt("movimientodestino"));



					listaTransferencias.add(transferencia);
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

		return listaTransferencias;
	}

	public int agregarTransferencia(Transferencia transferencia) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int filas = 0;
		Connection cn = null;

		try {

			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			String query = "Insert into transferencia (movimientoorigen,movimientodestino) values ('"
					+ transferencia.getMovimientoOrigen() + "','" + transferencia.getMovimientoDestino() + "')";
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;

	}

}
