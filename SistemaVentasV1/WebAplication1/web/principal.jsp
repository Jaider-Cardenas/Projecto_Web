<%-- 
    Document   : principal
    Author     : Jaider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
         
        <title>Tienda Mi Niño</title>
    </head>
    <body>
       <nav class="navbar navbar-expand-lg bg-info">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="#">Home</a>
        </li>
        <li class="nav-item">
            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Producto</a>
        </li>
        <li class="nav-item">
          <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a>
        </li>
        <li class="nav-item">
          <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=Cliente&accion=Listar" target="myFrame">Clientes</a>
        </li>
        <li class="nav-item">
          <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva venta</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="dropdown">
  <button class="btn btn-outline-light dropdown-toggle" id="dropdownMenuButton" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    ${usuario.getNom()}
  </button>
  <ul class="dropdown-menu text-center">
      <li><a class="dropdown-item" href="#">
              <img src="img/user.png" alt="60" width="60"/>
          </a></li>
    <li><a class="dropdown-item" href="#">${usuario.getNom()}</a></li>
    <li><a class="dropdown-item" href="#">Correo</a></li>
    <li><a class="dropdown-divider" href="index.jsp">Salir</a></li>
    <div class="dropdown-divider">
         <a class="dropdown-item" href="index.jsp">Salir</a>
    </div>
  </ul>
</div>
</nav>
    
    <div class="mt-4" style="height: 650px; ">
        <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
       
    </div>
        
         </body>
</html>
