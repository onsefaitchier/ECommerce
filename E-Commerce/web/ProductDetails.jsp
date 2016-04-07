<%-- 
    Document   : ProductDetails
    Created on : 27 mars 2016, 19:40:11
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.ProductBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<%
    String base = (String) application.getAttribute("base");
    String imageUrl = (String) application.getAttribute("imageUrl");
%>
<HTML>
<HEAD>
<TITLE>Product Details</TITLE>
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
    try {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductBean product = dbBean.getProductDetails(productId);
        if (product!=null) {
%>
<TABLE>
<TR>
    <TD><IMG BORDER="0" WIDTH="100" SRC="<%=(imageUrl + product.getId())%>.jpg"></TD>
    <TD><B><%=product.getName()%></B><BR>
        <%=product.getDescription()%><BR>
        Prix : $<%=product.getPrice()%></TD>
</TR>
<TR>
    <TD COLSPAN="2" ALIGN="RIGHT">
        <A HREF="<%=base%>?action=addItemBean&productId=<%=product.getId()%>">
        Ajouter au panier</A>
    </TD>
</TR>
</TABLE>
<%
        }
    }
    catch (Exception e) {
out.println("Error: Invalid product identifier.");
    }
%>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>
