/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
//package com.brainysoftware.burnaby;
import java.util.Hashtable;
import java.util.ArrayList;
import java.util.Enumeration;
import java.sql.*;


/**
 *
 * @author julien
 */
public class DbBean {
    
    public String dbUrl = "";
    public String dbUserName = "";
    public String dbPassword = "";


    public void setDbUrl(String url) 
    {
        dbUrl = url;
    }

    public void setDbUserName(String userName)
    {
        dbUserName = userName;
    }

    public void setDbPassword(String password) 
    {
        dbPassword = password;
    }
    
    public Hashtable getCategories() {

        Hashtable categories = new Hashtable();
        try {
            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
            Statement s = connection.createStatement();
            String sql = "SELECT CategoryId, Category FROM Categories" + " ";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                categories.put(rs.getString(1), rs.getString(2) );
            }
            rs.close();
            s.close();
            connection.close();
        }
        catch (SQLException e) {}

    return categories;
    }
    
    public ArrayList getSearchResults(String keyword) {

        ArrayList products = new ArrayList();
        try {
            Connection connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
            Statement s = connection.createStatement();
            String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
                " WHERE Name LIKE '%" + keyword.trim() + "%'" +
                " OR Description LIKE '%" + keyword.trim() + "%'";
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getDouble(4));
                products.add(product);
            }
            rs.close();
            s.close();
            connection.close();

            }
                catch (SQLException e) {}
        
        return products;
    }
    
    public ArrayList getProductsInCategory(String categoryId) 
    {
        ArrayList products = new ArrayList();
        try {
            Connection connection = DriverManager.getConnection(dbUrl,dbUserName, dbPassword);
            Statement s = connection.createStatement();
            String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
                " WHERE CategoryId=" + categoryId;
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getDouble(4));
                products.add(product);
            }
            rs.close();
            s.close();
            connection.close();
        }
        catch (SQLException e) {}
        return products;
    }
    
    public ProductBean getProductDetails(int productId) 
    {
        ProductBean product = null;
        try {
            Connection connection = DriverManager.getConnection(dbUrl,dbUserName, dbPassword);
            Statement s = connection.createStatement();
            String sql = "SELECT ProductId, Name, Description, Price FROM Products" +
                " WHERE ProductId=" + Integer.toString(productId);
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                product = new ProductBean();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getDouble(4));
            }
            rs.close();
            s.close();
            connection.close();
        }
        catch (SQLException e) {}
        return product;
    }
    
    public boolean insertOrder(String contactName, String deliveryAddress,
        String ccName, String ccNumber, String ccExpiryDate, Hashtable shoppingCart) 
    {
        boolean returnValue = false;
        int orderId = Integer.parseInt(ccNumber);
        Connection connection = null;
        try 
        {
            connection = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
            connection.setAutoCommit(false);
            Statement s = connection.createStatement();
            String sql = "INSERT INTO Orders" + " (OrderId, ContactName, DeliveryAddress, CCName, CCNumber, CCExpiryDate)" + " VALUES" +
                " (" + orderId + ",'" + contactName + "','" + deliveryAddress +
                "'," + "'" + ccName + "','" + ccNumber + "','" + ccExpiryDate + "')";
            s.executeUpdate(sql);
            // now insert items into OrderDetails table
            Enumeration enumeration = shoppingCart.elements();
            while (enumeration.hasMoreElements()) 
            {
                ItemBean item = (ItemBean) enumeration.nextElement();
                sql = "INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)" +
                    " VALUES (" + orderId + "," + item.getId() + "," + item.getQuantity() + "," + item.getPrice() + ")";
                s.executeUpdate(sql);
            }
        s.close();
        connection.commit();
        connection.close();
        returnValue = true; 
        }
        catch (SQLException e){
            try{
                connection.rollback();
                connection.close();
            }
            catch (SQLException se){}
            
        }
        return returnValue;
    }
}
