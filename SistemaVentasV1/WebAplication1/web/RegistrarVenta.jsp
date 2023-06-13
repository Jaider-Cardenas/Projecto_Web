<%-- 
    Document   : RegistrarVenta
    Created on : 1/06/2023, 04:26:47 AM
    Author     : Sunjay
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <title>Ventas</title>
        <style>
            @media print{
                .parte01, .btn, .accion{
                    display: none;
                }
                
                
            }
        </style>
    </head>
    <body>

        <div class="d-flex">
            <div class="col-sm-5 parte01">
                <div class="card">
                    <form action="Controlador?menu=NuevaVenta" method="Post">
                    <div class="card-body">
                        <!--Datos de cliente-->
                        <div class="form-group">
                            <label>Datos de Cliente</label>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigocliente" value="${c.getDni()}" class="form-control" placeholder="codigo">
                                <input style="margin-left: 10px" type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info">
                            </div>
                            <div class="col-sm-6">
                                <input style="margin-left: 10px" type="text" name="nombrescliente" value="${c.getNom()}" placeholder="Datos Cliente" class="form-control">
                            </div> 
                        </div> 
                            <!--Datos de producto-->
                        <div class="form-group ">
                            <label>Datos producto</label>
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <div class="col-sm-6 d-flex">
                                <input type="text" name="codigoproducto" value="${producto.getId()}" class="form-control" placeholder="codigo">
                                <input style="margin-left: 10px" type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">
                            </div>
                            <div class="col-sm-3">
                                <input style="margin-left: 10px" type="text" name="nomproducto" value="${producto.getNom()}" class="form-control" style="width: auto">
                            </div>  
                        </div>
                        <br>
                        <div class="form-group d-flex">
                            <div class="col-sm-3 d-flex">
                                <input type="text" name="precio" value="${producto.getPrecio()}" class="form-control" placeholder="s/.0.00"> 
                            </div>
                            <div class="col-sm-2">
                                <input style="margin-left: 10px" type="number" placeholder="" value="1" name="cant" class="form-control">
                            </div> 
                            <div class="col-sm-6">
                                <input style="margin-left: 20px" type="text" placeholder="stock" value="${producto.getStock()}" name="stock" class="form-control">
                            </div> 
                        </div>
                        <!-- Agregar un producto -->
                        <div class="form-group"> 
                            <button type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
                                Agregar
                            </button>
                        </div>
                    </div>
                   </form>    
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex col-sm-5 ml-auto">
                            <label>Numero de serie </label>
                            <input type="text" name="NroSerie" value="${nserie}" class="form-control">
                        </div>  
                        <table class="table table-hover ">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Codigo</th>
                                    <th>Descripcion</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>SubTotal</th>
                                    <th class="accion">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${lista}">
                                <tr>
                                    <td>${list.getItem()}</td>
                                    <td>${list.getIdproducto()}</td> 
                                    <td>${list.getDescripcionP()}</td>
                                    <td>${list.getPrecio()}</td>
                                    <td>${list.getCantidad()}</td>
                                    <td>${list.getSubtotal()}</td>
                                    <td class="d-flex">
                                        <a class="btn btn-danger">Editar</a>
                                        <a class="btn btn-warning" style="margin-left: 10px">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table>

                    </div>
                    <div class="card-footer">
                        <div class="col-sm-6">
                            <a href="Controlador?menu=NuevaVenta&accion=GenerarVenta" class="btn btn-success" onclick="print()">Generar Venta</a>
                            <a href="Controlador?menu=NuevaVenta&accion=Cancelar" class="btn btn-danger">Cancelar</a>
                            
                        </div>
                        <div class="col-sm-4 ml-auto"> 
                            <input type="text" name="txtTotal" value="$/${totalpagar}" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </body>
</html>
