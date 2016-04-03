<%-- 
    Document   : Order
    Created on : 27 mars 2016, 19:57:56
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<HTML>
<HEAD>
<TITLE>Order</TITLE>
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
    if (dbBean.insertOrder(request.getParameter("contactName"),
        request.getParameter("deliveryAddress"),
        request.getParameter("ccName"),
        request.getParameter("ccNumber"),
        request.getParameter("ccExpiryDate"),
        (Hashtable) session.getAttribute("shoppingCart"))) {
        session.invalidate();
        out.println("Thank you for your purchase");
        }
    else
        out.println("Error");
%>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>
