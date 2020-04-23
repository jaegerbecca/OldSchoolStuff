<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountCreationCongratulatory.aspx.vb" Inherits="AccountCreationCongratulatory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Congratulations on New Account</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1>Congratulations on Creating Your New User Account!</h1>
    <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
    
    <p>Congratulations! You have successfully entered all required information and created a new user account! Please return to the login page now to get started.</p>
    <p>Your user ID is: <asp:Label ID="lblUID" runat="server" Text=""></asp:Label> 
        and your password is: <asp:Label ID="lblPASS" runat="server" Text=""></asp:Label></p>

    <a href="Default.aspx">Back to Login</a>
</body>
</html>
