<%--Becca Jaeger--%>

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PublisherRecords.aspx.vb" Inherits="EditRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Publisher Records</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1>Publisher Records</h1>
    <h3><asp:Label ID="lblprogname" runat="server" Text=""></asp:Label></h3>

    <form id="form1" runat="server">
            <asp:SqlDataSource ID="dsPublisherDV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conBooks %>" DeleteCommand="DELETE FROM [Publisher] WHERE [PubID] = @original_PubID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))" InsertCommand="INSERT INTO [Publisher] ([PubID], [Name], [Contact], [Phone]) VALUES (@PubID, @Name, @Contact, @Phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PubID], [Name], [Contact], [Phone] FROM [Publisher] ORDER BY [PubID]" UpdateCommand="UPDATE [Publisher] SET [Name] = @Name, [Contact] = @Contact, [Phone] = @Phone WHERE [PubID] = @original_PubID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_PubID" Type="Double" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Contact" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="original_PubID" Type="Double" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Contact" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="dvPublisher" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PubID" DataSourceID="dsPublisherDV">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="PubID" HeaderText="PubID" ReadOnly="True" SortExpression="PubID">
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact">
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone">
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True">
                <ItemStyle Wrap="False" />
                </asp:CommandField>
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:DetailsView>



    </form>
    <footer><a class="button" href="Default.aspx">Home</a></footer>
</body>
</html>
