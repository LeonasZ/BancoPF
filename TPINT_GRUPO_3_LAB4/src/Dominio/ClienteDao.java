package Dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Entidades.Cliente;
import Entidades.Localidad;
import Entidades.Provincia;
import Entidades.Usuario;

public class ClienteDao {

	private static String host = "jdbc:mysql://localhost:3306/";
	private static String user = "root";
	private static String pass = "root";
	private static String dbName = "banco";
	
	// alta
	
	public int agregarUsuario(Cliente cl)
		{
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int filas=0;
			Connection cn = null;

			try
			{

			String estado = "activo";
			String TipoUsuario = "cliente";

				cn = DriverManager.getConnection(host+dbName, user,pass);
				Statement st = cn.createStatement();
			String query = "Insert into usuario(usuario, contraseña,tipousuario,estado) values ('"
					+ cl.getUsuario_nombre() + "','" + cl.getContraseña() + "','" + TipoUsuario + "','" + estado + "')";
				filas=st.executeUpdate(query);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return filas;
		}

	public int agregarCliente(Cliente cl, Usuario u) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int filas = 0;
		Connection cn = null;
		String estado = "activo";
		try {
			cn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = cn.createStatement();
			String query = "Insert into cliente(dni, usuario_id_cliente, cuil, nombre, apellido, sexo, nacionalidad, fechadenacimiento, direccion, localidad_id_cliente,"
					+ "provincia_id_cliente, correoelectronico, telefono,estado) values ('" + cl.getDni() + "','"
					+ u.getIdUsuario() + "','" + cl.getCuil() + "'," + "'" + cl.getNombre() + "','" + cl.getApellido()
					+ "','" + cl.getSexo() + "','" + cl.getNacionalidad() + "','" + cl.getNacimiento() + "','"
					+ cl.getDireccion() + "','" + "" + cl.getLocalidad() + "','" + cl.getProvincia() + "','"
					+ cl.getCorreo() + "','" + cl.getTelefono() + "','" + estado + "')";
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filas;
	}

	public static ArrayList<Provincia> obtenerProvincia() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		ArrayList<Provincia> lista = new ArrayList<Provincia>();
		Connection conn = null;
			
		try {
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
				
			ResultSet rs = st.executeQuery("SELECT provincia_id, nombreprovincia FROM provincia");
				
			while (rs.next()) {

				Provincia tc = new Provincia();
				tc.setProvincia_id(rs.getInt(1));
				tc.setNombreprovincia(rs.getString(2));

				lista.add(tc);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			}

		return lista;

		}

	public static ArrayList<Localidad> obtenerLocalidad() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		ArrayList<Localidad> lista = new ArrayList<Localidad>();
		Connection conn = null;
			
		try {
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
				
			ResultSet rs = st.executeQuery("SELECT localidad_id, provincia_id, nombrelocalidad FROM localidad");
				
			while (rs.next()) {

				Localidad l = new Localidad();
				l.setLocalidad_id(rs.getInt(1));
				l.setProvincia_id(rs.getInt(2));
				l.setNombrelocalidad(rs.getString(3));

				lista.add(l);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			}

		return lista;

		}

	public Usuario obtenerUsuario(String usuario) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Usuario c = new Usuario();
		Connection con = null;
		try {
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con
					.prepareStatement("Select * from banco.usuario where usuario.usuario = ? and estado = 1");
			miSentencia.setString(1, usuario);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			c.setIdUsuario(resultado.getInt(1));
			c.setUsuario(resultado.getString(2));
			c.setPass(resultado.getString(3));
			c.setTipoUsuario(resultado.getString(4));
			c.setEstado(true);
			con.close();
		} catch (Exception e) {
			System.out.println("Conexion fallida");
		} finally {
		}
		return c;
		}

	public ArrayList<Cliente> obtenerClientes() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ArrayList<Cliente> lista = new ArrayList<Cliente>();
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();

			ResultSet rs = st.executeQuery(
					"SELECT dni, usuario_id_cliente, cuil, nombre, apellido, sexo, nacionalidad, fechadenacimiento, direccion, localidad_id_cliente,"
							+ "provincia_id_cliente, correoelectronico, telefono,estado FROM banco.cliente WHERE estado = 'activo';");

			while (rs.next()) {

				Cliente clienteRs = new Cliente();
				clienteRs.setDni(rs.getString("dni"));
				clienteRs.setCuil(rs.getString("cuil"));
				clienteRs.setNombre(rs.getString("nombre"));
				clienteRs.setApellido(rs.getString("apellido"));
				clienteRs.setSexo(rs.getString("sexo"));
				clienteRs.setNacionalidad(rs.getString("nacionalidad"));
				clienteRs.setNacimiento(rs.getString("fechadenacimiento"));
				clienteRs.setDireccion(rs.getString("direccion"));
				clienteRs.setLocalidad(rs.getString("localidad_id_cliente"));
				clienteRs.setProvincia(rs.getString("provincia_id_cliente"));
				clienteRs.setCorreo(rs.getString("correoelectronico"));
				clienteRs.setTelefono(rs.getString("telefono"));
				clienteRs.setUsuario(rs.getInt("usuario_id_cliente"));
				
				if (rs.getString("estado").equals("activo")) {
					clienteRs.setEstado(true);
				}
				else {
					clienteRs.setEstado(false);
				}


				lista.add(clienteRs);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return lista;
	}

	public Cliente obtenerCliente(String dni, int usuario) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Cliente clienteRs = new Cliente();
		Connection con = null;
		try {
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement(
					"SELECT dni, usuario_id_cliente, cuil, nombre, apellido, sexo, nacionalidad, fechadenacimiento, direccion, localidad_id_cliente,"
							+ "provincia_id_cliente, correoelectronico, telefono,cliente.estado,usuario.usuario,usuario.contraseña  FROM cliente INNER JOIN usuario ON usuario_id_cliente = usuario.usuario_id WHERE cliente.estado = 'activo' and cliente.dni= ?");
			miSentencia.setString(1, dni);
			ResultSet rs = miSentencia.executeQuery();
			rs.next();
			clienteRs.setDni(rs.getString("dni"));
			clienteRs.setCuil(rs.getString("cuil"));
			clienteRs.setNombre(rs.getString("nombre"));
			clienteRs.setApellido(rs.getString("apellido"));
			clienteRs.setSexo(rs.getString("sexo"));
			clienteRs.setNacionalidad(rs.getString("nacionalidad"));
			clienteRs.setNacimiento(rs.getString("fechadenacimiento"));
			clienteRs.setDireccion(rs.getString("direccion"));
			clienteRs.setLocalidad(rs.getString("localidad_id_cliente"));
			clienteRs.setProvincia(rs.getString("provincia_id_cliente"));
			clienteRs.setCorreo(rs.getString("correoelectronico"));
			clienteRs.setTelefono(rs.getString("telefono"));
			clienteRs.setUsuario_nombre(rs.getString("usuario.usuario"));
			clienteRs.setContraseña(rs.getString("usuario.contraseña"));

			if (rs.getString("estado").equals("activo")) {
				clienteRs.setEstado(true);
			} else {
				clienteRs.setEstado(false);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Conexion fallida");
		} finally {
			}
		return clienteRs;
		}
	
	public int eliminarCliente(String dni) {

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
			String query = "UPDATE cliente SET estado = 'inactivo' WHERE dni = '" + dni + "'";
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
			}
		return filas;
		}

	public int modificarCliente(Cliente cl)
	{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int filas=0;
		Connection cn = null;
		
		try
		{
			cn = DriverManager.getConnection(host + dbName, user, pass);
	        String query = "UPDATE cliente SET nombre = ?, apellido = ?, sexo = ?, nacionalidad = ?, fechadenacimiento = ?, direccion = ?, localidad_id_cliente = ?, "
	        		+ "provincia_id_cliente = ?, correoelectronico = ?, telefono = ? WHERE dni = ?";
	        PreparedStatement ps = cn.prepareStatement(query);
	        ps.setString(1, cl.getNombre());
	        ps.setString(2, cl.getApellido());
	        ps.setString(3, cl.getSexo());
	        ps.setString(4, cl.getNacionalidad());
	        ps.setString(5, cl.getNacimiento());
	        ps.setString(6, cl.getDireccion());
	        ps.setString(7, cl.getLocalidad());
	        ps.setString(8, cl.getProvincia());
	        ps.setString(9, cl.getCorreo());
	        ps.setString(10, cl.getTelefono());
	        ps.setString(11, cl.getDni());

	        filas = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}

	public int modificarUsuario(Usuario u) {
		
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	int filas=0;
	Connection cn = null;
	
	try
	{
		cn = DriverManager.getConnection(host + dbName, user, pass);
        String query = "UPDATE usuario SET contraseña = ? WHERE usuario = ?";
        PreparedStatement ps = cn.prepareStatement(query);
        ps.setString(1, u.getPass());
        ps.setString(2, u.getUsuario());
      

        filas = ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return filas;

		
	}
	
	public int existeCliente(String dni){
		
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
			ResultSet rs = st.executeQuery("SELECT * FROM cliente WHERE dni =  ("+dni+")");
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
	
	public int extraerUsuarioCliente(String dni){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection cn = null;
		int usuario = 0;
		
		try{
			cn = DriverManager.getConnection(host+dbName, user,pass);
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT dni, usuario_id_cliente FROM cliente WHERE dni =  ("+dni+")");
			while(rs.next()) {
				usuario = rs.getInt(2);
			}
			cn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		
		}
		
		return usuario;
	}
}
