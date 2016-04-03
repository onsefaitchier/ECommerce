<%-- 
    Document   : Menu
    Created on : 27 mars 2016, 19:29:39
    Author     : julien
--%>

<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application" class="model.DbBean"/>
<%
    String base = (String) application.getAttribute("base");
%>
<TABLE CELLSPACING="0" CELLPADDING="5" WIDTH="150" BORDER="0">
<TR>
    <TD BGCOLOR="F6F0FF">
        <FONT FACE="Verdana">Recherche</FONT>
        <FORM>
        <INPUT TYPE="HIDDEN" NAME="action" VALUE="search">
        <INPUT TYPE="TEXT" NAME="keyword" SIZE="10">
        <INPUT type="SUBMIT" VALUE="Go">
        </FORM>
    </TD>
</TR>
<TR>
    <TD BGCOLOR="F6F6F6"><FONT FACE="Verdana">Categories:</FONT></TD>
</TR>
<TR VALIGN="TOP">
    <TD BGCOLOR="F6F6F6">
<%
    Hashtable categories = dbBean.getCategories();
    Enumeration categoryIds = categories.keys();
    while (categoryIds.hasMoreElements()) {
        Object categoryId = categoryIds.nextElement();
        out.println("<A HREF=" + base + "?action=browseCatalog&categoryId=" +
            categoryId.toString() + ">" +
            categories.get(categoryId) +
            "</A><BR>");
    }
%>
    </TD>
</TR>
</TABLE>
