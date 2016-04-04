/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.DbBean;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;





public class ControllerServlet extends HttpServlet 
{
    /**Initialize global variables*/
    @Override
        public void init(ServletConfig config) throws ServletException 
        {
            System.out.println("initializing controller servlet.");
            ServletContext context = config.getServletContext();
            context.setAttribute("base", config.getInitParameter("base"));
            context.setAttribute("imageUrl", config.getInitParameter("imageUrl"));
            // instantiating the DbBean
            DbBean dbBean = new DbBean();
            // initialize the DbBean's fields
            dbBean.setDbUrl(config.getInitParameter("dbUrl"));
            dbBean.setDbUserName(config.getInitParameter("dbUserName"));
            dbBean.setDbPassword(config.getInitParameter("dbPassword"));
            // put the bean in the servlet context
            // the bean will be accessed from JSP pages
            context.setAttribute("dbBean", dbBean);
            try {
                // loading the database JDBC driver
                Class.forName(config.getInitParameter("jdbcDriver"));
            }
            catch (ClassNotFoundException e) {
                System.out.println(e.toString());
            }
            super.init(config);
        }
        
        /**Process the HTTP Get request*/
        public void doGet(HttpServletRequest request, HttpServletResponse  response) throws ServletException, IOException 
        {
            processRequest(request, response);
        }

        /**Process the HTTP Post request*/
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
        {
            
            processRequest(request, response);

        }
        
        public void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
        {
           
            String url ="Default.jsp";
            String action = request.getParameter("action");
               
            
            if (action!=null)
            {
                if (action.equals("search"))
                url ="SearchResults.jsp";
                else if (action.equals("browseCatalog"))
                url = "BrowseCatalog.jsp";
                else if (action.equals("productDetails"))
                url ="ProductDetails.jsp";
                else if (action.equals("addShoppingItem") || action.equals("updateShoppingItem") || action.equals("deleteShoppingItem") || action.equals("displayShoppingCart"))
                url = "ShoppingCart.jsp";
                else if (action.equals("checkOut"))
                url = "CheckOut.jsp";
                else if (action.equals("order"))
                url ="Order.jsp";
            }

            RequestDispatcher disp = request.getRequestDispatcher(url);
            //RequestDispatcher disp = getServletContext().getRequestDispatcher(url);
            disp.forward(request, response);
       /*     
            Le switch provoque une erreur pour le moment 
            
            switch(action)
            {
                case "search":
                    url ="SearchResults.jsp";
                    break;
                case "browseCatalog":
                    url = "BrowseCatalog.jsp";
                    break;
                case "productDetails":
                    url ="ProductDetails.jsp";
                    break;
                case "addShoppingItem": 
                    url = "ShoppingCart.jsp";
                    break;
                case  "updateShoppingItem":
                    url = "ShoppingCart.jsp";
                    break;
                case "deleteShoppingItem":
                    url = "ShoppingCart.jsp";
                    break;
                case "displayShoppingCart":
                    url = "ShoppingCart.jsp";
                    break;
                case "checkOut":
                    url = "CheckOut.jsp";
                    break;
                case "order":
                    url ="Order.jsp";
                    break;
                default : 
                    String url ="Default.jsp";
                    break;
            
            }
            */
        }
}
