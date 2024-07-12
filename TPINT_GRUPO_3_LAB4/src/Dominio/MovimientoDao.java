package Dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Entidades.Movimiento;

public class MovimientoDao {
	private static String host = "jdbc:mysql://localhost:3306/";
	private static String user = "root";
	private static String pass = "root";
	private static String dbName = "banco";

	private final static String readAll = "SELECT * FROM movimientos";
	private final static String obtenerMovxCuenta = "SELECT * FROM movimientos WHERE numerodecuenta_id = ?";

	public static List<Movimiento> readAll() {
		List<Movimiento> listaMovimientos = new ArrayList<>();
		Connection cn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			cn = ConexionBD.getConexion().getSQLConexion();
			if (cn != null) {
				statement = cn.prepareStatement(readAll);
				rs = statement.executeQuery();

				while (rs.next()) {
					Movimiento movimiento = new Movimiento();
					movimiento.setMovimientoId(rs.getInt("movimiento_id"));
					movimiento.setNumeroDeCuentaId(rs.getInt("numerodecuenta_id"));
					movimiento.setTipoMovimientoId(rs.getInt("tipomovimiento_id"));
					movimiento.setFechaMovimiento(rs.getString("fechamovimiento"));
					movimiento.setImporte(rs.getFloat("importe"));
					movimiento.setDetalleMovimiento(rs.getString("detallemovimiento"));

					listaMovimientos.add(movimiento);
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

		return listaMovimientos;
	}

	public int agregarMovimiento(Movimiento movimiento) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1;
		}

		Connection cn = null;
		int idMovimiento = -1;

		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			String query = "INSERT INTO movimientos (numerodecuenta_id, tipomovimiento_id, fechamovimiento, importe, detallemovimiento) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pst = cn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, movimiento.getNumeroDeCuentaId());
			pst.setInt(2, movimiento.getTipoMovimientoId());
			pst.setString(3, movimiento.getFechaMovimiento());
			pst.setFloat(4, movimiento.getImporte());
			pst.setString(5, movimiento.getDetalleMovimiento());

			int filas = pst.executeUpdate();

			if (filas > 0) {
				ResultSet rs = pst.getGeneratedKeys();
				if (rs.next()) {
					idMovimiento = rs.getInt(1);
				}
				rs.close();
			}
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (cn != null && !cn.isClosed()) {
					cn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return idMovimiento;
	}

	public List<Movimiento> obtenerMovimientosPorCuenta(int idCuenta) {
		List<Movimiento> listaMovimientos = new ArrayList<>();
		Connection cn = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {
			cn = ConexionBD.getConexion().getSQLConexion();
			if (cn != null) {
				statement = cn.prepareStatement(obtenerMovxCuenta);
				statement.setInt(1, idCuenta);
				rs = statement.executeQuery();

				while (rs.next()) {
					Movimiento movimiento = new Movimiento();
					movimiento.setMovimientoId(rs.getInt("movimiento_id"));
					movimiento.setNumeroDeCuentaId(rs.getInt("numerodecuenta_id"));
					movimiento.setTipoMovimientoId(rs.getInt("tipomovimiento_id"));
					movimiento.setFechaMovimiento(rs.getString("fechamovimiento"));
					movimiento.setImporte(rs.getFloat("importe"));
					movimiento.setDetalleMovimiento(rs.getString("detallemovimiento"));

					listaMovimientos.add(movimiento);
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

		return listaMovimientos;
	}

}
