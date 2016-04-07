<%-- 
    Document   : CheckOut
    Created on : 27 mars 2016, 19:53:08
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String base = (String) application.getAttribute("base");
%>
<HTML>
<HEAD>
<TITLE>Payment</TITLE>
</HEAD>
<BODY>
<TABLE>
<TR>
    <TD COLSPAN=2><jsp:include page="Header.jsp" flush="true"/></TD>
</TR>
<TR>
    <TD><jsp:include page="Menu.jsp" flush="true"/></TD>
    <TD VALIGN="TOP">
    <FORM>
    <INPUT TYPE="HIDDEN" NAME="action" VALUE="order">
    <TABLE>
    <TR>
        <TD COLSPAN="2"><I><B>Détails</B></I></TD>
    </TR>
    <TR>
        <TD>Nom du contact:</TD>
        <TD><INPUT TYPE="TEXT" NAME="contactName"></TD>
    </TR>
    <TR>
        <TD>Adresse de livraison:</TD>
        <TD><INPUT TYPE="TEXT" NAME="deliveryAddress"></TD>
    </TR>
    <TR>
        <TD COLSPAN="2"><I><B>informations banquaires</B></I></TD>
    </TR>   
    <TR>
        <TD>Titulaire de la carte:</TD>
        <TD><INPUT TYPE="TEXT" NAME="ccName"></TD>
    </TR>
    <TR>
        <TD>Numéro de carte banquaire:</TD>
        <TD><INPUT TYPE="TEXT" NAME="ccNumber"></TD>
    </TR>
    <TR>
        <TD>Date d'expiration de carte:</TD>
        <TD> <INPUT TYPE="TEXT" NAME="ccExpiryDate"></TD>
    </TR>
    <TR>
        <TD>&nbsp;</TD>
        <TD><INPUT TYPE="SUBMIT" VALUE="Check Out"></TD>
    </TR>
    </TABLE>
    </FORM>
    </TD>
</TR>
</TABLE>
</BODY>
</HTML>
