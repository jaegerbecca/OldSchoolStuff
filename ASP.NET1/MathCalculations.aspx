<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MathCalculations.aspx.vb" Inherits="MathCalculations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Advanced Math Calculations</title>
    
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <h1>Advanced Math Calculations</h1>
    <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
    <form id="form1" runat="server">
 
        <div><asp:Label ID="lblNum1" runat="server" Text="Enter First Number:" AssociatedControlID="txtNum1"></asp:Label>
        <asp:TextBox ID="txtNum1" runat="server"></asp:TextBox></div>
        <div><asp:Label ID="lblNum2" runat="server" Text="Enter Second Number:" AssociatedControlID="txtNum2"></asp:Label>
        <asp:TextBox ID="txtNum2" runat="server"></asp:TextBox></div>
        <fieldset>
        <div class="rad"><asp:RadioButton ID="radFunny" runat="server" GroupName="grpWhichMath" Text="Funny Math" Checked="True" /></div>
        </fieldset>
        <fieldset>
        <div class="rad"><asp:RadioButton ID="radMoney" runat="server" GroupName="grpWhichMath" Text="Money Math" /></div>
        </fieldset>
        <div><asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label></div>
        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" />
    
    
    </form>
    <a href="Navigation.aspx">Site Navigation</a>
    </body>
</html>
