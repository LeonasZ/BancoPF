<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Entidades.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>BANCO</title>
<style>
  #chart-container {
  	display:flex;
  	flex-direction:row;
    width: 35%;
    height: 200px;
    margin: 5px 5px;
  }
  
  .chart-item{
  	border:1px solid black;
  }
 
 
</style>
</head>
<body>

<!-- Header -->
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


<div class="container" style="margin-top: 100px;">
  <h1 style="margin: 0 27%;">Dashboard del Administrador</h1>

  <h2>Estadísticas Generales</h2>
  <ul>
<li>Número de clientes activos: Gráfico de barras mostrando la cantidad de clientes nuevos por mes.</li>
<li>Número de cuentas: Gráfico de barras mostrando el tipo de cuentas (Caja de ahorro, Cuenta corriente).</li>
<li>Total de saldos en cuentas: Gráfico circular mostrando la distribución del saldo total por tipo de cuenta.</li>
<li>Préstamos aprobados y rechazados: Gráfico de barras o pastel mostrando la cantidad de préstamos aprobados y rechazados.</li>
<li>Monto total de préstamos: Gráfico de líneas mostrando la evolución del monto total de préstamos en el tiempo.</li>
<li>Historial de movimientos: Tabla mostrando los movimientos más recientes y la opción de filtrar por fechas, tipo de movimiento, etc.</li>
</ul>
  <!-- Añadir más estadísticas -->

  <h2>Gráficos</h2>
  <div id="chart-container">
    <canvas class="chart-item" id="clientesChart"></canvas>
 	<canvas class="chart-item" id="tortaChart"></canvas>
 	<canvas class="chart-item" id="polarChart"></canvas>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var ctx = document.getElementById('clientesChart').getContext('2d');
    var clientesChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Clientes'],
        datasets: [{
          label: 'Total de Clientes',
          data: [5],
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  });
  
  var ctx2 = document.getElementById('tortaChart').getContext('2d');
  
  var tortaChart = new Chart(ctx2,{
	  type: 'doughnut',
	  data: {
		  labels: [
			    'Red',
			    'Blue',
			    'Yellow'
			  ],
			  datasets: [{
			    label: 'My First Dataset',
			    data: [300, 50, 100],
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(54, 162, 235)',
			      'rgb(255, 205, 86)'
			    ],
			    hoverOffset: 4
			  }]
			}, 
			options: {
		        responsive: true,
		        maintainAspectRatio: false,
			}
  });
  
  
  var ctx3 = document.getElementById('polarChart').getContext('2d');
  
  var polarChart = new Chart(ctx3,{
	  type: 'polarArea',
	  data: {
		  labels: [
			    'Red',
			    'Green',
			    'Yellow',
			    'Grey',
			    'Blue'
			  ],
			  datasets: [{
			    label: 'My First Dataset',
			    data: [11, 16, 7, 3, 14],
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(75, 192, 192)',
			      'rgb(255, 205, 86)',
			      'rgb(201, 203, 207)',
			      'rgb(54, 162, 235)'
			    ]
			  }]
			},
	  options: {responsive: true,
	        maintainAspectRatio: false,}
	});
  
  
  
  
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
