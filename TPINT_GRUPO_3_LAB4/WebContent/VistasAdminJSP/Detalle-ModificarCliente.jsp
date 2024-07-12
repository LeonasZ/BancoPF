<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Entidades.Cliente"%>
<%@page import="Entidades.Usuario" %>
<%@ page import = "Entidades.Provincia"%>
<%@ page import = "Entidades.Localidad"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "Negocio.NegocioCliente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>BANCO</title>

</head>
<body>

<!-- Header --><nav class="navbar bg-body-tertiary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="Principal-Estadisticas.jsp">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
        <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z"/>
      </svg>
    </a>
    
    <div class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Clientes
          </a>
          <ul class="dropdown-menu">
          	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasAdminJSP/ListarClientes.jsp">Ver Clientes</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasAdminJSP/AgregarClientes.jsp">Agregar Cliente</a></li>
         
          
          </ul>
        </div>
        <div class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Cuentas
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasAdminJSP/ListarCuentas.jsp">Listar Cuentas</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasAdminJSP/AgregarCuentas.jsp">Nueva Cuenta</a></li>
            
          </ul>
        </div>
        
        <div class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/VistasAdminJSP/Prestamos.jsp">Autorizacion de Préstamos</a>
        </div>
         
    
    
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header"><% 
    		  Usuario user = new Usuario();
      if(application.getAttribute("usuarioLogeado")!= null){
    	  user=(Usuario)application.getAttribute("usuarioLogeado");
      }
      %>
      
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Bienvenido,  <%= user.getUsuario() %></h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/VistasAdminJSP/Principal-Estadisticas.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
                <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z"/>
              </svg> Menu Principal
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/VistasAdminJSP/MiPerfil.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
              </svg> Mi Perfil
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/LoginAdminCliente/Log.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0z"/>
                <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
              </svg> Cerrar Sesión
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<div class="container" style="margin-top: 100px;">
<!-- Boton volver -->
  <a style="margin-bottom:10px;" href="${pageContext.request.contextPath}/VistasAdminJSP/ListarClientes.jsp" type="button" class="btn btn-secondary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
  <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1"/>
</svg> Volver</a>
<form action="/TPINT_GRUPO_3_LAB4/servletCliente" method="get">
<%
Cliente cl = new Cliente();
if(request.getAttribute("datosCliente")!=null)
			cl= (Cliente)request.getAttribute("datosCliente");
			%>
  <h1>Detalle Cliente</h1>
  
  <% 
NegocioCliente nc = new NegocioCliente();
ArrayList<Provincia> listap = nc.obtenerProvincia();
ArrayList<Localidad> listal = nc.obtenerLocalidad();
%>
  
  <form class="row g-6" >	
    <div class="col-md-6">
      <label for="inputDni" class="form-label">DNI = <%=cl.getDni() %></label><input type="hidden" name="txtDni" value="<%=cl.getDni() %>">
    </div>
    <div class="col-md-6">
      <label for="inputCuil" class="form-label">CUIL = <%=cl.getCuil() %></label>
    </div>
    <div class="col-md-6">
      <label for="inputNombre" class="form-label">Nombre</label>
      <input type="text" class="form-control form-control-sm" name="txtNombre" id="inputNombre" value="<%=cl.getNombre() %>" >
    </div>
    <div class="col-md-6">
      <label for="inputApellido" class="form-label">Apellido</label>
      <input type="text" class="form-control form-control-sm" name="txtApellido" id="inputApellido" value="<%= cl.getApellido() %>">
    </div>
    <div class="col-md-6">
      <label for="inputNacionalidad" class="form-label">Nacionalidad</label>
      <input type="text" class="form-control form-control-sm" name="txtNacionalidad" id="inputNacionalidad" value="<%=cl.getNacionalidad() %>">
    </div>
    <div class="col-md-6">
      <label for="inputDireccion" class="form-label">Dirección</label>
      <input type="text" class="form-control form-control-sm" name="txtDireccion" id="inputDireccion" value="<%=cl.getDireccion() %>">
    </div>
    <div class="col-md-6">
      <label for="inputLocalidad" class="form-label">Provincia</label>
      <select name="ddlProvincia">
	<%
if(listap != null)
	for(Provincia pr : listap){
		%>
		<option value="<%=pr.getProvincia_id()%>"><%=pr.getNombreprovincia()%></option>
	<%}%>
</select> 
    </div>
    <div class="col-md-6">
      <label for="inputLocalidad" class="form-label">Localidad</label>
      <select name="ddlLocalidad">
		<%
if(listal != null)
	for(Localidad lo : listal){
		%>
		<option value="<%=lo.getLocalidad_id()%>"><%=lo.getNombrelocalidad()%></option>
	<%}%>
	</select>
    </div>
    <div class="col-md-6">
      <label for="inputFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
      <input type="text" class="form-control form-control-sm" name="txtNacimiento" id="inputFechaNacimiento"value="<%=cl.getNacimiento() %> ">
    </div>
    <div class="col-md-6">
    Sexo <select name="ddlSexo"> 
	<option  value="M">Masculino</option>
	<option  value="F">Femenino</option>
	<option  value="X">Otro</option>
	</select> 
    </div>
    <div class="col-md-6">
      <label for="inputCorreoElectronico" class="form-label">Correo Electrónico</label>
      <input type="text" class="form-control form-control-sm" name="txtCorreo" id="inputCorreoElectronico" value="<%=cl.getCorreo() %>">
    </div><div class="col-md-6">
      <label for="inputContrasena" class="form-label">Telefono</label>
      <input type="text" class="form-control form-control-sm" name="txtTelefono" id="inputtelefono" value="<%=cl.getTelefono() %>">
    </div>
    <div class="col-md-6">
    <label for="inputDni" class="form-label">Usuario = <%=cl.getUsuario_nombre() %></label>
    <input type="hidden" name="txtUsuario" value="<%=cl.getUsuario_nombre() %>">
    </div> 
    <div class="col-md-6">
      <label for="inputContrasena" class="form-label">Contraseña</label>
      <input type="text" class="form-control form-control-sm" name="txtContraseña" id="inputContrasena" value="<%=cl.getContraseña() %>">
    </div></div>
    
    <div class="col-md-12">
    </div>
    <div class="col-md-12" style="margin-top:20px;">
      <button type="submit"  name= "btnModificarCliente"class="btn btn-primary">Guardar Cambios</button>
      <button type="submit"  name="btnEliminar" class="btn btn-danger">Dar de Baja  </button>
    </div>
  </form>
  </form>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
