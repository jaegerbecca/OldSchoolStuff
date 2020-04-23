<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Err.aspx.vb" Inherits="Err" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Error Message</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Login Error</h1>
<h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
    <p class="error">Oops! The username or password was incorrect! Please try again.</p>
    <p class="error">*Remember: username and password are case-sensitive.</p>
    <p><a href="Default.aspx">Back to Login</a></p>

</body>
</html>
