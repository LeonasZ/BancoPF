<%@page import="Servlets.ServletUsuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Login Administradores/clientes</title>

</head>
<body>

<!-- Header -->

<nav class="navbar bg-body-tertiary fixed-top">
  <div class="container-fluid">
     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
       <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.5.5 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89zM3.777 3h8.447L8 1zM2 6v7h1V6zm2 0v7h2.5V6zm3.5 0v7h1V6zm2 0v7H12V6zM13 6v7h1V6zm2-1V4H1v1zm-.39 9H1.39l-.25 1h13.72z"/>
      </svg>
      
      <div class="container" style="margin-top: 5px;">
      <h1>Banco CAC</h1>
      </div>
       
  </div>
</nav>

<div class="container" style="margin-top: 100px;">
<h4>Iniciar sesión en tu banca online</h4>

<form method="post" action="${pageContext.request.contextPath}/ServletUsuario">
<table border = "0">
<tr>
	<td width="50%"> Usuario </td>
	<td width="50%"> <input type="text" name="txtUsuario" required> </td>
</tr>
<tr>
	<td width="50%"> Contraseña </td>
	<td width="50%"> <input type="password" name="txtContraseña" required> </td>
</tr>
<tr width="50%">
	<td style="height: 28px;">  </td> 
</tr>
<tr>
	<td width="50%"> <input type="submit" name="btnIngresar"  value="Ingresar"> </td>
</tr>

</table>

<img src="${pageContext.request.contextPath}/LoginAdminCliente/codoacodo.png" style="width: 550px;
	margin-left: 500px;
	margin-top: -190px;">

</form>
<div >

<%  
Boolean ingresa = (Boolean) request.getAttribute("ingresa");
Boolean esCliente = (Boolean) request.getAttribute("esCliente");
if (ingresa != null && ingresa) {
	
	if(esCliente){
		 response.sendRedirect(request.getContextPath() + "/VistasClienteJSP/Menu.jsp");
	}
	else{
		 response.sendRedirect(request.getContextPath() + "/VistasAdminJSP/Principal-Estadisticas.jsp");
	}
	
} else if(ingresa != null && !ingresa){
    out.println("<p>Usuario y contraseña incorrectos.</p>");
}

%>

</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
