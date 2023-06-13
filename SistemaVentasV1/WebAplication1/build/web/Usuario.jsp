<%-- 
    Document   : Usuario
    Created on : 1/06/2023, 04:26:34 AM
    Author     : Sunjay
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
         
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-6">
            <div class="card-body">
                <form action="Controlador?menu=Empleado" method="POST">
                    <div class="form-group">
                        <label>Dni</label>
                        <input type="text" value="${empleado.getDni()}" name="txtDni" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Nombres</label>
                        <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" value="${empleado.getTel()}" name="txtTel" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <input type="text" value="${empleado.getEstados()}" name="txtEstado" class="form-control" >
                    </div>
                    <div class="form-group">
                        <label>Usuario</label>
                        <input type="text" value="${empleado.getUser()}" name="txtUser" class="form-control" >
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
                        <th>DNI</th>
                        <th>Nombres</th>
                        <th>Telefono</th>
                        <th>Estado</th>
                        <th>User</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="em" items="${empleados}">
                    <tr>
                        
                        <td>${em.getDni()}</td>
                        <td>${em.getNom()}</td>
                        <td>${em.getTel()}</td>
                        <td>${em.getEstados()}</td>
                        <td>${em.getUser()}</td>
                        <td>
                            <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Editar&id=${em.getId()}">Editar</a>
                            <a class="btn btn-danger" href="Controlador?menu=Empleado&accion=Eliminar&id=${em.getId()}">Borrar</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        </div>
        
        
        
    </body>
</html>
