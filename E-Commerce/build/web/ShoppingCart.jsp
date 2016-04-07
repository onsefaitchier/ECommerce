<%-- 
    Document   : ShoppingCart
    Created on : 27 mars 2016, 19:43:42
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.ProductBean" %>
<%@ page import="model.ItemBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<%
    String base = (String) application.getAttribute("base");
    Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
    if (shoppingCart==null)
        shoppingCart = new Hashtable(10);
    String action = request.getParameter("action");
    if (action!=null && action.equals("addItemBean")) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            ProductBean product = dbBean.getProductDetails(productId);
            if (product!=null) {
                ItemBean item = new ItemBean();
                item.setId(productId);
                item.setQuantity(1);
                item.setPrice(product.getPrice());
                item.setName(product.getName());
                item.setDescription(product.getDescription());
                
                shoppingCart.remove(Integer.toString(productId));
                shoppingCart.put(Integer.toString(productId), item);
                session.setAttribute("shoppingCart", shoppingCart);
                }
            }
            catch (Exception e) {
                out.println("Error adding the selected product to the shopping cart");
                }
    }
    
    if (action!=null && action.equals("updateItemBean")) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            ItemBean item = (ItemBean)shoppingCart.get(Integer.toString(productId));
            if (item!=null) {
                item.setQuantity(quantity);
            }
        }
        catch (Exception e) {
            out.println("Error updating shopping cart");
        } 
    }
    
    if (action!=null && action.equals("deleteItemBean")) {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            shoppingCart.remove(Integer.toString(productId));
        }
        catch (Exception e) {
            out.println("Error deleting the selected item from the shopping cart");
        }
    }
%>
<HTML>
<HEAD>
<TITLE>Panier d'achats</TITLE>
</HEAD>
<BODY>
<TABLE>
<TR>
    <TD COLSPAN=2><jsp:include page="Header.jsp" flush="true"/></TD>
</TR>
<TR>
    <TD><jsp:include page="Menu.jsp" flush="true"/></TD>
    <TD VALIGN="TOP">
<%
%>
        <TABLE>
        <TR>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Nom</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Description</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Prix</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Quantité</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Sous-total</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Metrre à jour</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Supprimer</B></FONT></TD>
        </TR>
<%
        Enumeration enumerate = shoppingCart.elements();
        while (enumerate.hasMoreElements()) {
            ItemBean item = (ItemBean) enumerate.nextElement();
%>
        <TR>
        <TD><FONT FACE="Verdana" SIZE="2"><%=item.getName()%></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="2"><%=item.getDescription()%></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="2"><%=item.getPrice()%></FONT></TD>
        
        <FORM>
            <INPUT TYPE="HIDDEN" NAME="action" VALUE="updateItemBean">
            <INPUT TYPE="HIDDEN" NAME="productId" VALUE="<%=item.getId()%>">
            <TD><INPUT TYPE="TEXT" Size="2" NAME="quantity" VALUE="<%=item.getQuantity()%>"></TD>
            <TD><FONT FACE="Verdana" SIZE="2"><%=item.getQuantity()*item.getPrice()%></FONT></TD>
            <TD><INPUT TYPE="SUBMIT" VALUE="Update"></TD>
        </FORM>
        <FORM>  
            <INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteItemBean">
            <INPUT TYPE="HIDDEN" NAME="productId" VALUE="<%=item.getId()%>">
            <TD><INPUT TYPE="SUBMIT" VALUE="Delete"></TD>
        </FORM>
        </TR>
<%
        }
%>
        <TR>
            <TD COLSPAN="7"><A HREF="<%=base%>?action=checkOut">Acces Payment</A></TD>
        </TR>
        </TABLE>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>
