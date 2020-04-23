<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomSQL.aspx.vb" Inherits="CustomSQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom SQL</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1>Custom SQL</h1>
    <h3><asp:Label ID="lblprogname" runat="server" Text=""></asp:Label></h3>
    <form id="form1" runat="server">
   
        <asp:GridView ID="gvCustom" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="dsCustomGV" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Order Date" HeaderText="Order Date" ReadOnly="True" SortExpression="Order Date" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Retail" HeaderText="Retail" ReadOnly="True" SortExpression="Retail" />
                <asp:BoundField DataField="Extended Price" HeaderText="Extended Price" ReadOnly="True" SortExpression="Extended Price" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsCustomGV" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" SelectCommand="SELECT Customers.LastName AS [Last Name], Customers.FirstName AS [First Name], Books.Title, FORMAT(Orders.OrderDate, 'MM-dd-yyyy') AS [Order Date], OrderItems.Quantity, FORMAT(Books.Retail, 'C') AS [Retail], FORMAT(Books.Retail * OrderItems.Quantity, 'C') AS 'Extended Price' FROM Customers INNER JOIN Orders ON Customers.Customernum = Orders.Customernum INNER JOIN OrderItems ON Orders.Ordernum = OrderItems.Ordernum INNER JOIN Books ON OrderItems.ISBN = Books.ISBN ORDER BY [Last Name]"></asp:SqlDataSource>
   
    </form>
    <footer><a class="button" href="Default.aspx">Home</a></footer>
</body>
</html>
