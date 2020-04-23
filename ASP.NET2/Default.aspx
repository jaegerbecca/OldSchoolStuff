<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <h1>Navigation</h1>
        <h3><asp:Label ID="lblprogname" runat="server" Text=""></asp:Label></h3>
    <nav>
        <ul>
            <li><a class="button" href="BooksRecords.aspx">Books Records</a></li>
            <li><a class="button" href="PublisherRecords.aspx">Publisher Records</a></li>
            <li><a class="button" href="AuthorsRecords.aspx">Author Records</a></li>
            <li><a class="button" href="CustomSQL.aspx">Custom SQL</a></li>
        </ul>
    </nav>
    </form>
</body>
</html>
