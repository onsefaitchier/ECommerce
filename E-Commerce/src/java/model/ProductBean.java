/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author julien
 */
//package com.brainysoftware.burnaby;

public class ProductBean 
{
    private int id;
    private String name;
    private String description;
    private double price;
    
    public void setId(int pId)
    {
        this.id = pId;
    }
    
    public void setName(String pName)
    {
        this.name = pName;
    }
     
    public void setDescription(String pDesc)
    {
        this.description = pDesc;
    }
     
    public void setPrice(double pPrice)
    {
        this.price = pPrice;
    } 
    
    public int getId()
    {
        return this.id;
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
     
}