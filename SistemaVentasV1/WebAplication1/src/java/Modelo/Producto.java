/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Sunjay
 */
public class Producto {
    int id;
    String nom;
    Double precio;
    int stock;
    String estados;

    public Producto() {
    }

    public Producto(int id, String nom, Double precio, int stock, String estados) {
        this.id = id;
        this.nom = nom;
        this.precio = precio;
        this.stock = stock;
        this.estados = estados;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getEstados() {
        return estados;
    }

    public void setEstados(String estados) {
        this.estados = estados;
    }
    
    
}
