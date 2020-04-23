<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountCreation.aspx.vb" Inherits="AccountCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Creation</title>
    <link href="mainCSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     
    <h1>User Account Creation</h1>
    <h3><asp:Label ID="lblProjectname" runat="server" Text=""></asp:Label></h3>
     
        <div><asp:Label ID="lblFname" runat="server" Text="First Name" AssociatedControlID="txtFname"></asp:Label>
        <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is Required" ControlToValidate="txtFname" Display="None" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <div><asp:Label ID="lblLname" runat="server" Text="Last Name" AssociatedControlID="txtLname"></asp:Label>
        <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is Required" ControlToValidate="txtLname" CssClass="error" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>

        <div><asp:Label ID="lblDOB" runat="server" Text="Date of Birth" AssociatedControlID="txtDOB"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Date of Birth is Required" Display="None" ControlToValidate="txtDOB" CssClass="error" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Birth Date Must be Between 01/01/1955 and 12/31/1995" ControlToValidate="txtDOB" CssClass="error" Display="None" SetFocusOnError="True" Type="Date" MinimumValue="01/01/1955" MaximumValue="12/31/1995"></asp:RangeValidator>
        </div>

        <div><asp:Label ID="lblUserID" runat="server" Text="User ID" AssociatedControlID="txtUserID"></asp:Label>
        <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="User ID is Required" ControlToValidate="txtUserID" Display="None" CssClass="error" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="User ID Must be at Least Five Characters" Display="None" CssClass="error" ControlToValidate="txtUserID" SetFocusOnError="True"></asp:CustomValidator>
        </div>

        <div><asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
        <asp:TextBox ID="txtPassword" textmode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is Required" SetFocusOnError="True" Display="None" CssClass="error" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password Must Be Two Uppercase Letters Followed By -,*, or = Followed by Four Numbers" Display="None" CssClass="error" ControlToValidate="txtPassword" SetFocusOnError="True" ValidationExpression="[A-Z]{2}[-*=]\d{4}"></asp:RegularExpressionValidator>
        </div>

        <div><asp:Label ID="lblVerify" runat="server" Text="Verify Password" AssociatedControlID="txtVerify"></asp:Label>
        <asp:TextBox ID="txtVerify" textmode="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Verification is Required" Display="None" CssClass="error" ControlToValidate="txtVerify" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Must Be Exact Match to Original Password Entry" Display="None" CssClass="error" ControlToValidate="txtVerify" ControlToCompare="txtPassword" SetFocusOnError="True"></asp:CompareValidator>
        </div>

        <div><asp:Label ID="lblHint" runat="server" Text="Password Hint" AssociatedControlID="txtHint"></asp:Label>
        <asp:TextBox ID="txtHint" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="btnCreate" runat="server" Text="Create Account" />
        <div><asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="False" /></div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
       
     
    </form>
    <a href="Default.aspx">Back to Login</a>
    </body>
</html>
