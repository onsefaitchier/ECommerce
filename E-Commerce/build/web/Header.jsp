<%-- 
    Document   : Header
    Created on : 27 mars 2016, 19:25:27
    Author     : julien
--%>

<%
String base = (String) application.getAttribute("base");
//String imageUrl = (String) application.getAttribute("imageUrl");
%>
    <TABLE WIDTH="1500" CELLPADDING="0" HEIGHT="100" CELLSPACING="0" BORDER="0">
    <TR>
        <TD ALIGN="center" BGCOLOR="F6F6F6">
            <FONT FACE="Verdana" SIZE="8">Jacky Store</FONT>
        </TD>
        <TD ALIGN="RIGHT" BGCOLOR="F6F6F6">
            <A HREF="<%=base%>?action=displayShoppingCart"><IMG BORDER="0" SRC="<%=("Images/michel.jpg")%>"></A>
            &nbsp;&nbsp;&nbsp;
        </TD>
    </TR>
    </TABLE>
