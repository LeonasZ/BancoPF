<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="Entidades.Usuario" %>
     <%@page import="Entidades.Cuenta" %>
     <%@page import="Entidades.Movimiento" %>
     <%@page import="java.util.List" %>
     <%@page import="Servlets.servletCuenta" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="CSScss.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            justify-content: center;
            align-items: center;
            height: 90vh;
           display: block;
            margin: top;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
        }
        .table thead {
            background-color: #343a40;
            color: #fff;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body><nav class="navbar bg-body-tertiary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/VistasClienteJSP/Menu.jsp">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
        <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z"/>
      </svg>
    </a>
    
    <div class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Prestamos
          </a>
          <ul class="dropdown-menu">
          	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasClienteJSP/PagoDePrestamo.jsp">Pagar Prestamo</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/VistasClienteJSP/PedidoPrestamo.jsp">Pedir Prestamo</a></li>
          
          </ul>
          </div>
     <div class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/servletCuenta?loadCuentas=true&loadHistorial=false">Realizar Transferencia</a>
        </div>
        <div class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/servletCuenta?loadCuentas=true&loadHistorial=true">Ver Movimientos</a>
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
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/VistasClienteJSP/Menu.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
                <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z"/>
              </svg> Menu Principal
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/VistasClienteJSP/PerfilCliente.jsp">
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
              </svg> Cerrar Sesi�n
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<%
        List<Cuenta> misCuentas = null;
        if (session.getAttribute("misCuentas") != null) {
            misCuentas = (List<Cuenta>) session.getAttribute("misCuentas");
        }
    %>

    
<div class="container" style="margin-top: 100px;">
    <h2 class="text-center mb-4">Movimientos/Historial de Cuenta</h2>
    <div class="table-responsive">
        <form method="post" action="${pageContext.request.contextPath}/servletTransferenciaMovimiento">
            <div class="form-group">
                <label for="cuenta-remitente">Mis cuentas:</label>
                <select id="cuenta-remitente" name="id_cuenta_remitente" required>
                    <%
                        if (misCuentas != null && user != null) {
                            for (Cuenta c : misCuentas) {
                                if (c.getUsuario_id() == user.getIdUsuario()) {
                    %>
                    <option value="<%= c.getNumerodecuenta_id() %>"><%= c.getCbu() %> - <%= c.getTipocuenta() %> - $<%= c.getSaldo() %></option>
                    <%
                                }
                            }
                        }
                    %>
                </select>
            </div>
            <div>
                <input type="submit" value="Mostrar Historial" name="btnMostrarHistorial">
            </div>
        </form>
        
        <%
        List<Movimiento> listaMovimientos = null;
        if (request.getAttribute("listaMovimientos") != null) {
            listaMovimientos = (List<Movimiento>) request.getAttribute("listaMovimientos");
        }
        %>
        
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Tipo de Movimiento</th>
                    <th>Fecha Movimiento</th>
                    <th>Importe</th>
                    <th>Descripci�n Movimiento</th>
                </tr>
            </thead>
            <tbody class="table-group-divider"> 
                <%
                    if (listaMovimientos != null) {
                        for (Movimiento m : listaMovimientos) {
                %>
                <tr>
                     <td>
                        <%
                            int tipoMovimientoId = m.getTipoMovimientoId();
                            if (tipoMovimientoId == 1) {
                        %>
                            Dep�sito
                        <%
                            } else if (tipoMovimientoId == 2) {
                        %>
                            Extracci�n
                        <%
                            } else if (tipoMovimientoId == 3) {
                        %>
                            Transferencia Entrante
                        <%
                            } else if (tipoMovimientoId == 4) {
                        %>
                            Transferencia Saliente
                        <%
                            } 
                        %>
                    </td>
                    <td><%= m.getFechaMovimiento() %> </td>
                    <td><%= m.getImporte() %> </td>
                    <td><%= m.getDetalleMovimiento() %> </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">No hay movimientos disponibles</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>