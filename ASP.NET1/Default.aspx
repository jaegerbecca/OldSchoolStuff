<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   
    <h1>Login</h1>
    <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
   
        <fieldset>
        <div><asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></div>
        <div><asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox></div>
        </fieldset>
        <div><asp:Label ID="lblHint" runat="server" Text="" AssociatedControlID="chkHint"></asp:Label>
            <asp:CheckBox ID="chkHint" runat="server" AutoPostBack="True" /></div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
        <asp:Button ID="btnAccountCreation" runat="server" Text="Create Account" />
    
    </form>
</body>
</html>
