package Modelo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sunjay
 */
import config.conexion;
 import java.sql.Connection;
 import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    
    public Producto buscar(int id){
        Producto pd = new Producto();
        String sql="select * from producto where IdProducto="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                pd.setId(rs.getInt(1));
                pd.setNom(rs.getString(2));
                pd.setPrecio(rs.getDouble(3));
                pd.setStock(rs.getInt(4));
                pd.setEstados(rs.getString(5));
            }
        } catch (Exception e) {
        }
        return pd;
    }
    
    public int actualizarstock(int id, int stock){
    
        String sql = "update producto set Stock=? where IdProducto=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }
    
    
     //Operaciones CRUD
     
     public List listar(){
         String sql="select * from producto";
         List<Producto>lista = new ArrayList<>();
         try {
             con = cn.Conexion();
             ps= con.prepareStatement(sql);
             rs=ps.executeQuery();
            
             while(rs.next()){
                 Producto pd = new Producto();
                 pd.setId(rs.getInt(1));
                 pd.setNom(rs.getString(2));
                 pd.setPrecio(rs.getDouble(3));
                 pd.setStock(rs.getInt(4));
                 pd.setEstados(rs.getString(5));
   
                 lista.add(pd);
                 
             }
         } catch (Exception e) {
             
         }
         return lista;
     }
     
     public int agregar(Producto pd){
         String sql= "insert into producto(Nombres, Precio, Stock, Estado)values(?,?,?,?)";
         try {
             con = cn.Conexion();
             ps = con.prepareStatement(sql);
             ps.setString(1, pd.getNom());
             ps.setDouble(2, pd.getPrecio());
             ps.setInt(3, pd.getStock());
             ps.setString(4, pd.getEstados());
             
             ps.executeUpdate();
         } catch (Exception e) {
         }
         return r;
     }
     public Producto listarId(int id){
         Producto pd = new Producto();
         String sql = "select * from producto where IdProducto="+id;
         try {
              con = cn.Conexion();
              ps = con.prepareStatement(sql);
              rs = ps.executeQuery();
              while (rs.next()) {
                  pd.setId(id);
                 pd.setNom(rs.getString(2));
                 pd.setPrecio(rs.getDouble(3));
                 pd.setStock(rs.getInt(4));
                 pd.setEstados(rs.getString(5));
             }
         } catch (Exception e) {
         }
         return pd;
     }
     public int actualizar(Producto pd){
         String sql= "update producto set Nombres=?, Precio=?, Stock=?, Estado=? where idProducto=?";
         try {
             con = cn.Conexion();
             ps = con.prepareStatement(sql);
             ps.setString(1, pd.getNom());
             ps.setDouble(2, pd.getPrecio());
             ps.setInt(3, pd.getStock());
             ps.setString(4, pd.getEstados());
             ps.setInt(5, pd.getId());
             ps.executeUpdate();
         } catch (Exception e) {
         }
         return r;
     }
     
     public void delete(int id){
         String sql = "delete from producto where IdProducto="+id;
         try {
             con=cn.Conexion();
             ps=con.prepareStatement(sql);
             ps.executeUpdate();
         } catch (Exception e) {
         }
     }

}
