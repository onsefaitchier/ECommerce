/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
//package com.brainysoftware.burnaby;

/**
 *
 * @author julien
 */
public class ItemBean 
{
    private int productId;
    private String name;
    private String description;
    private double price;
    private int quantity;
    
    
    //mutateurs
    public void setId(int pId)
    {
        this.productId = pId;
    }
    
    public void setName(String pName)
    {
        this.name = pName;
    }
    
    public void setDescription(String pDescription)
    {
        this.description = pDescription;
    }
    
    public void setPrice(double pPrice)
    {
        this.price = pPrice;
    }
    
    public void setQuantity(int pQuantity)
    {
        this.quantity = pQuantity;
    }
    
    //accesseurs
    public int getId()
    {
        return this.productId;
    }  
    
    public String getName()
    {
        return this.name;
    } 
    
    public String getDescription()
    {
        return this.description;
    } 
    
    public double getPrice()
    {
        return this.price;
    } 
    
    public int getQuantity()
    {
        return this.quantity;
    } 
    
}
