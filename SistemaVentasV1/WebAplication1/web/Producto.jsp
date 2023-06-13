<%-- 
    Document   : Producto
    Created on : 1/06/2023, 04:26:12 AM
    Author     : Sunjay
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
         
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-6">
            <div class="card-body">
                <form action="Controlador?menu=Producto" method="POST">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" value="${producto.getNom()}" name="txtNombres" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <input type="text" value="${producto.getPrecio()}" name="txtPrecio" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Stock</label>
                        <input type="text" value="${producto.getStock()}" name="txtStock" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input type="text" value="${producto.getEstados()}" name="txtEstado" class="form-control" >
                    </div>
                    <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                    <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                </form>
            </div>
        </div>
            <div class="col-sm-6">
            <table class="table table" border="1">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="pd" items="${productos}">
                    <tr>
                        
                        <td>${pd.getNom()}</td>
                        <td>${pd.getPrecio()}</td>
                        <td>${pd.getStock()}</td>
                        <td>${pd.getEstados()}</td>
                        <td>
                            <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&id=${pd.getId()}">Editar</a>
                            <a class="btn btn-danger" href="Controlador?menu=Producto&accion=Eliminar&id=${pd.getId()}">Borrar</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        </div>
        
        
        
    </body>
</html>
