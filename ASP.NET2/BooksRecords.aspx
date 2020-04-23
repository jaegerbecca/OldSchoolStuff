<%--Becca Jaeger--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BooksRecords.aspx.vb" Inherits="ViewRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books Records</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   

    <h1>Books Records</h1>
    <h3><asp:Label ID="lblprogname" runat="server" Text=""></asp:Label></h3>
   

        <asp:Label ID="lblPublisherDDL" runat="server" Text="Select the Publisher to display books for: " AssociatedControlID="ddlPublisher"></asp:Label>
   

        <asp:DropDownList ID="ddlPublisher" runat="server" AutoPostBack="True" DataSourceID="dsPublisherDDL" DataTextField="Name" DataValueField="PubID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dsPublisherDDL" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" SelectCommand="SELECT [Name], [PubID] FROM [Publisher]"></asp:SqlDataSource>
        <br />
   

        <asp:SqlDataSource ID="dsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" SelectCommand="SELECT [Category], [Retail], [Cost], [PubID], [PubDate], [Title], [ISBN] FROM [Books] WHERE ([PubID] = @PubID) ORDER BY [Title]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPublisher" Name="PubID" PropertyName="SelectedValue" Type="Double" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gvBooks" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="dsBooks" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EmptyDataText="There are no records for the selected publisher.">
            <Columns>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Retail" HeaderText="Retail" SortExpression="Retail" DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Cost" HeaderText="Wholesale" SortExpression="Cost" DataFormatString="{0:c}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="PubID" HeaderText="PubID" SortExpression="PubID" Visible="False" >
                <HeaderStyle  />
                </asp:BoundField>
                <asp:BoundField DataField="PubDate" HeaderText="Publish Date" SortExpression="PubDate" DataFormatString="{0:d}" >
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" >
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Font-Bold="True" HorizontalAlign="Left" Wrap="False" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ISBN" DataSourceID="dsBooksDV" Height="50px" Width="125px">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" BackColor="#CCCCCC" Text='<%# Eval("ISBN") %>'></asp:Label>
                        <asp:Label ID="Label8" runat="server" AssociatedControlID="Label1" Text="You may not edit the ISBN"></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="error" Display="Dynamic" ErrorMessage="ISBN required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" CssClass="error" Display="Dynamic" ErrorMessage="ISBN must be 10 digits" SetFocusOnError="True" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" CssClass="error" Display="Dynamic" ErrorMessage="Title is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="error" Display="Dynamic" ErrorMessage="Title is required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PubDate" SortExpression="PubDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PubDate", "{0:d}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" CssClass="error" Display="Dynamic" ErrorMessage="Publish date required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox2" CssClass="error" Display="Dynamic" ErrorMessage="Must be a valid date(yyyy-mm-dd)" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" CssClass="error" Display="Dynamic" ErrorMessage="Publish date required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox3" CssClass="error" Display="Dynamic" ErrorMessage="Must be a valid date(yyyy-mm-dd)" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PubDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Publisher" SortExpression="PubID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsPublisherIDddl" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" CssClass="error" Display="Dynamic" ErrorMessage="Publisher required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsPublisherIDddl" DataTextField="Name" DataValueField="PubID" SelectedValue='<%# Bind("PubID") %>'>
                        </asp:DropDownList>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList1" CssClass="error" Display="Dynamic" ErrorMessage="Publisher required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PubID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCostEdit" runat="server" Text='<%# Bind("Cost", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCostEdit" CssClass="error" Display="Dynamic" ErrorMessage="Cost required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtCostEdit" CssClass="error" Display="Dynamic" ErrorMessage="Cost must be greater than 4.99" Operator="GreaterThan" SetFocusOnError="True" Type="Double" ValueToCompare="4.99"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCostInsert" runat="server" Text='<%# Bind("Cost", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCostInsert" CssClass="error" Display="Dynamic" ErrorMessage="Cost required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCostInsert" CssClass="error" Display="Dynamic" ErrorMessage="Cost must be greater than 4.99" Operator="GreaterThan" SetFocusOnError="True" Type="Double" ValueToCompare="4.99"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cost", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Retail" SortExpression="Retail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Retail", "{0:n}")%>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox5" CssClass="error" Display="Dynamic" ErrorMessage="Retail price required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToCompare="txtCostEdit" ControlToValidate="TextBox5" CssClass="error" Display="Dynamic" ErrorMessage="Retail price must be greater than cost" Operator="GreaterThan" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Retail", "{0:n}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox6" CssClass="error" Display="Dynamic" ErrorMessage="Retail price required" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToCompare="txtCostInsert" ControlToValidate="TextBox6" CssClass="error" Display="Dynamic" ErrorMessage="Retail price must be greater than cost" Operator="GreaterThan" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Retail", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="dsPublisherIDddl" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" SelectCommand="SELECT [Name], [PubID] FROM [Publisher]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsBooksDV" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @ISBN" InsertCommand="INSERT INTO [Books] ([ISBN], [Title], [PubDate], [PubID], [Cost], [Retail], [Category]) VALUES (@ISBN, @Title, @PubDate, @PubID, @Cost, @Retail, @Category)" SelectCommand="SELECT [ISBN], [Title], [PubDate], [PubID], [Cost], [Retail], [Category] FROM [Books]" UpdateCommand="UPDATE [Books] SET [Title] = @Title, [PubDate] = @PubDate, [PubID] = @PubID, [Cost] = @Cost, [Retail] = @Retail, [Category] = @Category WHERE [ISBN] = @ISBN">
            <DeleteParameters>
                <asp:Parameter Name="ISBN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="PubDate" Type="DateTime" />
                <asp:Parameter Name="PubID" Type="Double" />
                <asp:Parameter Name="Cost" Type="Double" />
                <asp:Parameter Name="Retail" Type="Double" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
    <footer><a class="button" href="Default.aspx">Home</a></footer>
</body>
</html>
