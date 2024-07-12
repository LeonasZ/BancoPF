<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Entidades.Usuario" %>
     <%@page import="Entidades.Cuenta" %>
     <%@page import="java.util.List" %>
     <%@page import="Servlets.servletCuenta" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="CSScss.css" />
      <title>Transferencia Bancaria</title>
        
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            justify-content: center;
            align-items: center;
            height: 100vh;
        	display: block;
            margin: top;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 500px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
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
    <div class="container" style="margin-top: 100px;">
    <!-- lista de mis cuentas -->
    <%
        List<Cuenta> misCuentas = null;
        if (session.getAttribute("misCuentas") != null) {
            misCuentas = (List<Cuenta>) session.getAttribute("misCuentas");
        }
    %>


    <h2>Transferencia Bancaria</h2>
    <form action="${pageContext.request.contextPath}/servletTransferenciaMovimiento?procesarTransferencia=true" method="POST">
        <div class="form-group">
            <label for="cuenta-remitente">CBU Cuenta Remitente:</label>
            <select id="cuenta-remitente" name="cuenta_remitente" required>
                <%
                    if (misCuentas != null && user != null) {
                        for (Cuenta c : misCuentas) {
                            if (c.getUsuario_id() == user.getIdUsuario()) {
                %>
                <option value="<%= c.getCbu() %>"><%= c.getCbu() %> - <%= c.getTipocuenta() %> - $<%= c.getSaldo() %></option>
                <%
                            }
                        }
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="cuenta-destinatario">CBU Cuenta Destinatario:</label>
            <input type="text" id="cuenta-destinatario" name="cuenta_destinatario" required>
        </div>
        <div class="form-group">
            <label for="monto">Monto a Transferir:</label>
            <input type="number" id="monto" name="monto" step="1" required>
        </div>
        <div class="form-group">
            <label for="concepto">Concepto de la Transferencia:</label>
            <input type="text" id="concepto" name="concepto" required>
        </div>
        <div class="form-group">
            <button type="submit">Realizar Transferencia</button>
        </div>
    </form>

    <%
        Boolean transferenciaRealizada = (Boolean) request.getAttribute("transferenciaRealizada");
        if (transferenciaRealizada != null && transferenciaRealizada) {
            out.println("<p>TRANSFERENCIA REALIZADA CON �XITO</p>");
        } else if (transferenciaRealizada != null && !transferenciaRealizada) {
            out.println("<p>HUBO UN ERROR EN LA TRANSFERENCIA</p>");
        }
    %>
</div>

    
   
    
    
    
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>