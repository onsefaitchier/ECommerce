<%-- 
    Document   : BrowseCatalog
    Created on : 27 mars 2016, 19:37:06
    Author     : julien
--%>

<%@ page import="model.ProductBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<%
    String base = (String) application.getAttribute("base");
%>
<HTML>
<HEAD>
<TITLE>Catalogue</TITLE>
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
    String categoryId = request.getParameter("categoryId");
    if (categoryId!=null && !categoryId.trim().equals("")) {
%>
    <TABLE>
    <TR>
        <TD><FONT FACE="Verdana" SIZE="3"><B>Name</B></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="3"><B>Description</B></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="3"><B>Price</B></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="3"><B>Details</B></FONT></TD>
    </TR>
<%
    ArrayList products = dbBean.getProductsInCategory(categoryId);
    Iterator iterator = products.iterator();
    while (iterator.hasNext()) {
        ProductBean product = (ProductBean) iterator.next();
%>
    <TR>
        <TD><FONT FACE="Verdana" SIZE="2"><%=product.getName()%></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="2"><%=product.getDescription()%></FONT></TD>
        <TD><FONT FACE="Verdana" SIZE="2"><%=product.getPrice()%></FONT></TD>
        <TD><A HREF="<%=base%>?action=productDetails&productId=<%=product.getId()%>">
            <FONT FACE="Verdana" SIZE="2">Details</FONT></A></TD>
    </TR>
<%
        }
    }
    else
        out.println("Categorie non valide");
%>  
    </TABLE>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>
