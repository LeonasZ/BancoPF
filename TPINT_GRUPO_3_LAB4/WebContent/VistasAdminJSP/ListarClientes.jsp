<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Entidades.Usuario" %>	
<%@ page import = "Entidades.Cliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>BANCO</title>
</head>



<body>
<nav class="navbar bg-body-tertiary fixed-top">
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



<div class="container" style="margin-top:100px;">
	
	<h1>Lista de Clientes </h1>
	<form method="post" action="${pageContext.request.contextPath}/servletCliente">
<input type="submit" value="Mostrar Clientes" name="btnListarClientes">

<%
	List<Cliente> listaClientes = null;
	Cliente c = new Cliente();
	if(request.getAttribute("listaC")!=null){ listaClientes = (List<Cliente>)request.getAttribute("listaC");}	
%>

</form>
	<table class="table table-responsive">
  <thead class="table-dark">
    <tr>
      <th scope="col">ID Usuario</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">DNI</th>
      <th scope="col">Nacionalidad</th>
      <th scope="col">Telefono</th>
      <th scope="col">Correo Electronico</th>
      <th scope="col">Estado</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    

	<%  if(listaClientes!=null)
		for(Cliente cl : listaClientes) 
		{
	%>
	<tr>  
	
	<form method="get" action="/TPINT_GRUPO_3_LAB4/servletCliente">
	     <td><%=cl.getUsuario()%> <input type="hidden" name="dniCliente" value="<%=cl.getDni() %>"> </td>     
	     <td><%=cl.getNombre()%></td>   
	     <td><%=cl.getApellido()%></td>   
	     <td><%=cl.getDni()%></td>   <input type="hidden" name="UsuarioCliente" value="<%=cl.getUsuario() %>"> </td>
	     <td><%=cl.getNacionalidad()%></td>
	     <td><%=cl.getTelefono() %></td> 
	     <td><%=cl.getCorreo() %></td>      
	     <td><% if(cl.getEstado()){%>Activo<%} else{%>Inactivo<%} %></td>   
	     
    <td class="btn-group btn-group-sm" role="group" aria-label="Small button group">
  <a data-bs-toggle="modal" data-bs-target="#detalleModal" type="button" class="btn btn-outline-secondary">Detalle</a>
  <input type="submit" class="btn btn-primary" value="Detalle Cliente" name="Modificar" >
 </form>	</tr> 
  <% }%>
  </tbody>
</table>

	
	<!-- Modal con detalles del cliente y opcion para mas acciones (modificar/baja) -->


<div class="modal fade" id="detalleModal" tabindex="-1" aria-labelledby="detalleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="detalleModalLabel">Detalle Cliente</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" >
<form  class="row g-3">
<div class="col-md-6">
    <label for="inputDni" class="form-label">DNI</label>
    <input type="text" class="form-control" id="inputDni" readonly>
  </div>
  <div class="col-md-6">
    <label for="inputCuil" class="form-label">CUIL</label>
    <input type="text" class="form-control" id="inputCUIL" readonly>
  </div>
  <div class="col-md-6">
    <label for="inputNombre" class="form-label">Nombre</label>
    <input type="text" class="form-control" id="inputNombre" readonly>
  </div>
  <div class="col-md-6">
    <label for="inputApellido" class="form-label">Apellido</label>
    <input type="text" class="form-control" id="inputApellido" readonly>
  </div>
  <div class="col-6">
    <label for="inputNacionalidad" class="form-label">Nacionalidad</label>
    <input type="text" class="form-control" id="inputNacionalidad" readonly>
  </div>
  
  <div class="col-6">
    <label for="inputDireccion" class="form-label">Direccion</label>
    <input type="text" class="form-control" id="inputDireccion" readonly>
  </div>
  <div class="col-6">
    <label for="inputLocalidad" class="form-label">Localidad</label>
    <input type="text" class="form-control" id="inputLocalidad" readonly>
  </div>
  <div class="col-md-4">
    <label for="inputFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
    <input type="text" class="form-control" id="inputFechaNacimiento" readonly>
  </div>
  <div class="col-md-2">
    <label for="inputGenero" class="form-label">Género</label>
    <input type="text" class="form-control" id="inputGenero" readonly>
  </div>
  
  <div class="col-md-12">
    <label for="inputCorreoElectronico" class="form-label">Correo Electronico</label>
    <input type="text" class="form-control" id="inputCorreoElectronico" readonly>
  </div>
  
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck" disabled readonly>
      <label class="form-check-label" for="gridCheck"  >
        Cliente Activo/Inactivo
      </label>
    </div>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        
      </div>
    </div>
  </div>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>