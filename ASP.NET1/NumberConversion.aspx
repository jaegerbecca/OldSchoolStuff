<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NumberConversion.aspx.vb" Inherits="NumberConversion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Decimal to Binary Number Conversion</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
     <h1>Decimal to Binary Number Converter</h1>
    <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
    <form id="form1" runat="server">
        <fieldset>
            <div>
            <asp:Label ID="lblDecNum" runat="server" Text="Input a decimal number between 0-255:" AssociatedControlID="txtDecNum"></asp:Label>
            <asp:TextBox ID="txtDecNum" runat="server"></asp:TextBox>
            </div>
            <div class="chk">
            <asp:CheckBox ID="chkIP" runat="server" Text="Express result as 8 digit IP conversion?" />
            </div>
        </fieldset>
        <fieldset> 
            <div>
            <asp:Label ID="lblConverted" runat="server" Text="Your number in binary is:" AssociatedControlID="lblConvertedOut"></asp:Label>
            <asp:Label ID="lblConvertedOut" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
            </div>
        </fieldset>
        <asp:Button ID="btnConvert" runat="server" Text="Convert" />

    </form>
    <a href="Navigation.aspx">Site Navigation</a>
</body>
</html>
