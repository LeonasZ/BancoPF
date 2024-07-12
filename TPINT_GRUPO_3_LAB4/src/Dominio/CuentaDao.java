package Dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Entidades.Cuenta;

public class CuentaDao {

	private static String host = "jdbc:mysql://localhost:3306/";
	private static String user = "root";
	private static String pass = "root";
	private static String dbName = "banco";
	
	private static String modificarSaldo = "UPDATE cuenta SET saldo = ? WHERE cbu = ?";

	/// alta cuenta
	
	public int agregarCuenta(Cuenta ct){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int filas=0;
		Connection cn = null;
	    Date date = new Date();
	    long timeInMilliSeconds = date.getTime();
	    java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);

		try
		{
			
			cn = DriverManager.getConnection(host+dbName, user,pass);
			Statement st = cn.createStatement();
			String query = "Insert into cuenta (dni,usuario_id,tipocuenta,cbu) values ('"+ct.getDni()+"','"+ct.getUsuario_id()+"','"+ct.getTipocuenta()+"','"+ct.getCbu()+"')";
			filas=st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}
	
	/// Cantidad de cuentas por cliente
	
	public int cantidadCuentasPorCliente(String dni) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;
		int cont = 0;
		
		try{
			cn = DriverManager.getConnection(host+dbName, user,pass);
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM cuenta WHERE dni =  ("+dni+")");
			while(rs.next()) {
				cont++;
			}
			cn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		
		}
		
		return cont;
		
	}

	private final static String readAll = "select * from cuenta";

	public List<Cuenta> readAll() {
		List<Cuenta> listaCuentas = new ArrayList<>();

		Connection cn = null;
		PreparedStatement statement;

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			statement = cn.prepareStatement(readAll);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				Cuenta cuenta = new Cuenta();
				
				cuenta.setNumerodecuenta_id(rs.getInt("numerodecuenta_id"));
				cuenta.setDni(rs.getString("dni"));
				cuenta.setUsuario_id(rs.getInt("usuario_id"));
				cuenta.setTipocuenta(rs.getString("tipocuenta"));
				cuenta.setCbu(rs.getString("cbu"));
				cuenta.setSaldo(rs.getFloat("saldo"));
				cuenta.setFechacreacion(rs.getString("fechacreacion"));

				if (rs.getString("estado").equals("activa")) {
					cuenta.setEstado(true);
				} else {
					cuenta.setEstado(false);
				}



				listaCuentas.add(cuenta);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaCuentas;
	}

	public Cuenta obtenerCuenta(String cbu) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Cuenta cuentaRs = null;
		try (Connection con = DriverManager.getConnection(host + dbName, user, pass);
				PreparedStatement miSentencia = con.prepareStatement("SELECT * FROM cuenta WHERE cbu = ?")) {

			miSentencia.setString(1, cbu);
			try (ResultSet rs = miSentencia.executeQuery()) {
				if (rs.next()) {
					cuentaRs = new Cuenta();
					cuentaRs.setNumerodecuenta_id(rs.getInt("numerodecuenta_id"));
					cuentaRs.setDni(rs.getString("dni"));
					cuentaRs.setUsuario_id(rs.getInt("usuario_id"));
					cuentaRs.setTipocuenta(rs.getString("tipocuenta"));
					cuentaRs.setCbu(cbu);
					cuentaRs.setSaldo(rs.getFloat("saldo"));
					cuentaRs.setFechacreacion(rs.getString("fechacreacion"));

					cuentaRs.setEstado(rs.getString("estado").equals("activo"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Conexion fallida");
		}
		return cuentaRs;
	}

	public int actualizarSaldo(float saldo, String cbu) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		int filas = 0;
		try (Connection cn = DriverManager.getConnection(host + dbName, user, pass);
				PreparedStatement statement = cn.prepareStatement(modificarSaldo)) {

			statement.setFloat(1, saldo);
			statement.setString(2, cbu);
			filas = statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
	}

}
