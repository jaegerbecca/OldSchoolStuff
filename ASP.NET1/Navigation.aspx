<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Navigation.aspx.vb" Inherits="Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <h1>Welcome to Site Navigation, <asp:Label ID="lblname" runat="server" Text=""></asp:Label>!</h1>
     <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
    <nav>
        <ul>
            <li><a href="Default.aspx">Logout</a></li>
            <li><a href="MathCalculations.aspx">Math</a></li>
            <li><a href="NumberConversion.aspx">Number Conversion</a></li>
        </ul>
    </nav>
    
    
    </form>
</body>
</html>
