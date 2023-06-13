<%-- 
    Document   : Cliente
    Created on : 1/06/2023, 04:26:20 AM
    Author     : Sunjay
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
         
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-6">
            <div class="card-body">
                <form action="Controlador?menu=Cliente" method="POST">
                    <div class="form-group">
                        <label>Dni</label>
                        <input type="text" value="${cliente.getDni()}" name="txtDni" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Nombres</label>
                        <input type="text" value="${cliente.getNom()}" name="txtNombres" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Direccion</label>
                        <input type="text" value="${cliente.getDir()}" name="txtDir" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input type="text" value="${cliente.getEstado()}" name="txtEstado" class="form-control" >
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
                        <th>Dni</th>
                        <th>Nombre</th>
                        <th>Dirrecion</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="cl" items="${clientes}">
                    <tr>
                        
                        <td>${cl.getDni()}</td>
                        <td>${cl.getNom()}</td>
                        <td>${cl.getDir()}</td>
                        <td>${cl.getEstado()}</td>
                        <td>
                            <a class="btn btn-warning" href="Controlador?menu=Cliente&accion=Editar&id=${cl.getId()}">Editar</a>
                            <a class="btn btn-danger" href="Controlador?menu=Cliente&accion=Eliminar&id=${cl.getId()}">Borrar</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        </div>
        
        
        
    </body>
</html>

