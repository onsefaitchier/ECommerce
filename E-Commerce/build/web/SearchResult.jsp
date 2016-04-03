<%-- 
    Document   : SearchResult
    Created on : 27 mars 2016, 19:33:23
    Author     : julien
--%>

<%@ page import="model.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<%
String base = (String) application.getAttribute("base");
%>
<HTML>
<HEAD>
<TITLE>Search Results</TITLE>
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
    String keyword = request.getParameter("keyword");
    if (keyword!=null && !keyword.trim().equals("")) {
%>
        <TABLE>
        <TR>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Name</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Description</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Price</B></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="3"><B>Details</B></FONT></TD>
        </TR>
<%
        ArrayList products = dbBean.getSearchResults(keyword);
        Iterator iterator = products.iterator();
        while (iterator.hasNext()) {
            Product product = (Product) iterator.next();
%>
        <TR>
            <TD><FONT FACE="Verdana" SIZE="2"><%=product.name%></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="2"><%=product.description%></FONT></TD>
            <TD><FONT FACE="Verdana" SIZE="2"><%=product.price%></FONT></TD>
            <TD><A HREF="<%=base%>?action=productDetails&productId=<%=product.id%>">
            <FONT FACE="Verdana" SIZE="2">Details</FONT></A></TD>
        </TR>
<%
        }
    }
    else
        out.println("Please enter a search keyword.");

%>
        </TABLE>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>