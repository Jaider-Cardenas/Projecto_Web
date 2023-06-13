/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.VentaDao;
import Modelo.Venta;
import Modelo.Cliente;
import Modelo.ClienteDao;
import Modelo.Empleado;
import Modelo.EmpleadoDao;
import Modelo.Producto;
import Modelo.ProductoDao;
import config.GenerarSerie;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sunjay
 */
public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    EmpleadoDao edao = new EmpleadoDao();
    Producto pd = new Producto();
    ProductoDao pdao = new ProductoDao();
    Cliente cl = new Cliente();
    ClienteDao cdao = new ClienteDao();
    Venta ve = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item ;
    int cod;
    String desripcion;
    double precio;
    int cant;
    double subtotal;
    double totalPagar;
    String numeroserie;
    VentaDao vdao = new VentaDao();
    
    public Controlador() {
    }
    int ide;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if(menu.equals("Principal")){
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
        if(menu.equals("Empleado")){
            switch(accion){
                case "Listar":
                    List lista = edao.listar();
                    request.setAttribute("empleados", lista);
                    break;
                case "Agregar":
                    String dni = request.getParameter("txtDni");
                    String nom = request.getParameter("txtNombres");
                    String tel = request.getParameter("txtTel");
                    String est = request.getParameter("txtEstado");
                    String user = request.getParameter("txtUser");
                    em.setDni(dni);
                    em.setNom(nom);
                    em.setTel(tel);
                    em.setEstados(est);
                    em.setUser(user); 
                    edao.agregar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Empleado e = edao.listarId(ide);
                        request.setAttribute("empleado", e);
                        request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String dni1 = request.getParameter("txtDni");
                    String nom1 = request.getParameter("txtNombres");
                    String tel1 = request.getParameter("txtTel");
                    String est1 = request.getParameter("txtEstado");
                    String user1 = request.getParameter("txtUser");
                    em.setDni(dni1);
                    em.setNom(nom1);
                    em.setTel(tel1);
                    em.setEstados(est1);
                    em.setUser(user1);
                    em.setId(ide);
                    edao.actualizar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    ide=Integer.parseInt(request.getParameter("id"));
                    edao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Usuario.jsp").forward(request, response);
        }
        if(menu.equals("Producto")){
            switch(accion){
                case "Listar":
                    List lista = pdao.listar();
                    request.setAttribute("productos", lista);
                    break;
                case "Agregar":
                    
                    String nom = request.getParameter("txtNombres");
                    Double pre = Double.parseDouble(request.getParameter("txtPrecio")); 
                    int stock = Integer.parseInt(request.getParameter("txtStock"));
                    String est = request.getParameter("txtEstado");
                    
                    pd.setNom(nom);
                    pd.setPrecio(pre);
                    pd.setStock(stock);
                    pd.setEstados(est);
                    pdao.agregar(pd);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Producto p = pdao.listarId(ide);
                        request.setAttribute("producto", p);
                        request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String nom1 = request.getParameter("txtNombres");
                    Double pre1 = Double.parseDouble(request.getParameter("txtPrecio")); 
                    int stock1 = Integer.parseInt(request.getParameter("txtStock"));
                    String est1 = request.getParameter("txtEstado");
                    
                    pd.setNom(nom1);
                    pd.setPrecio(pre1);
                    pd.setStock(stock1);
                    pd.setEstados(est1);
                    pd.setId(ide);
                    pdao.actualizar(pd);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    ide=Integer.parseInt(request.getParameter("id"));
                    pdao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        } 
        if(menu.equals("Cliente")){
            switch(accion){
                case "Listar":
                    List lista = cdao.listar();
                    request.setAttribute("clientes", lista);
                    break;
                case "Agregar":
                    
                    String Dni = request.getParameter("txtDni");
                    String Nom = request.getParameter("txtNombres"); 
                    String Dir = request.getParameter("txtDir");
                    String est = request.getParameter("txtEstado");
                    
                    cl.setDni(Dni);
                    cl.setNom(Nom);
                    cl.setDir(Dir);
                    cl.setEstado(est);
                    cdao.agregar(cl);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                        ide = Integer.parseInt(request.getParameter("id"));
                        Cliente c = cdao.listarId(ide);
                        request.setAttribute("cliente", c);
                        request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    String Dni1 = request.getParameter("txtDni");
                    String Nom1 = request.getParameter("txtNombres"); 
                    String Dir1 = request.getParameter("txtDir");
                    String est1 = request.getParameter("txtEstado");
                    
                    cl.setDni(Dni1);
                    cl.setNom(Nom1);
                    cl.setDir(Dir1);
                    cl.setEstado(est1);
                    cl.setId(ide);
                    cdao.actualizar(cl);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    ide=Integer.parseInt(request.getParameter("id"));
                    cdao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Cliente&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Cliente.jsp").forward(request, response);
        }
        if(menu.equals("NuevaVenta")){
            switch(accion){
                case "BuscarCliente":
                    String dni = request.getParameter("codigocliente");
                    cl.setDni(dni);
                    cl = cdao.buscar(dni);
                    request.setAttribute("c", cl);
                    break;
                case "BuscarProducto":
                    int id = Integer.parseInt(request.getParameter("codigoproducto"));
                    pd=pdao.listarId(id);
                    request.setAttribute("c", cl);
                    request.setAttribute("producto", pd);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalPagar);
                    break;
                    
                case "Agregar":
                    request.setAttribute("c", cl);
                        totalPagar = 0.0; 
                        item = item+1;
                        cod = pd.getId();
                        desripcion = request.getParameter("nomproducto");
                        precio = Double.parseDouble(request.getParameter("precio"));
                        cant = Integer.parseInt(request.getParameter("cant"));
                        subtotal = precio*cant;
                        
                        ve = new Venta();
                        
                        ve.setItem(item);
                        ve.setIdproducto(cod);
                        ve.setDescripcionP(desripcion);
                        ve.setPrecio(precio);
                        ve.setCantidad(cant);
                        ve.setSubtotal(subtotal);
                        lista.add(ve);
                        
                        for (int i = 0; i < lista.size(); i++) {
                            totalPagar=totalPagar + lista.get(i).getSubtotal();
                        }
                        request.setAttribute("totalpagar", totalPagar);
                        
                        request.setAttribute("lista", lista);
                        
                    break;
                    
                case "GenerarVenta":
                    //Actualizar stock
                    
                    for (int i = 0; i < lista.size(); i++) {
                        Producto pr = new Producto();
                        int cantidad = lista.get(i).getCantidad();
                        int idproducto = lista.get(i).getIdproducto();
                        ProductoDao ao = new ProductoDao();
                        pr = ao.buscar(idproducto);
                        int sac = pr.getStock()-cantidad;
                        ao.actualizarstock(idproducto, sac);
                    }
                    
                    //Guardar Venta
                    ve.setIdcliente(cl.getId());
                    ve.setIdEmpleado(1);
                    ve.setNumserie(numeroserie);
                    ve.setFecha("2019-06-14");
                    ve.setMonto(totalPagar);
                    ve.setEstado("1");
                    vdao.guardarventa(ve);
                    
                    //Guardar detalle de venta
                    int idv = Integer.parseInt(vdao.IdVentas());
                    for (int i = 0; i < lista.size(); i++) {
                        ve = new Venta();
                        ve.setId(idv);
                        ve.setIdproducto(lista.get(i).getIdproducto());
                        ve.setCantidad(lista.get(i).getCantidad());
                        ve.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleventas(ve);
                        
                    }
                    lista.clear();
                    item = 0;
                    break;
                    
                case "Cancelar":
                    item = 0;
                    lista.clear();
                    request.setAttribute("lista", lista);
                    break;
                default:
                    numeroserie = vdao.GenerarSerie();
                    
                    if(numeroserie == null){
                        numeroserie = "00000001";
                        request.setAttribute("nserie", numeroserie);
                    }
                    else{
                        int inc = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                         numeroserie = gs.NumeroSerie(inc);
                         request.setAttribute("nserie", numeroserie);
                    }
                    
                    request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
                    
            }
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
