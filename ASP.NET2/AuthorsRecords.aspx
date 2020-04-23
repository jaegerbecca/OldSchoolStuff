<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AuthorsRecords.aspx.vb" Inherits="AuthorsRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authors Records</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h1>Authors Records</h1>
    <h3><asp:Label ID="lblprogname" runat="server" Text=""></asp:Label></h3>
    <form id="formFVGV" runat="server">
    
        <asp:GridView ID="gvAuthors" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AuthorID" DataSourceID="dsAuthorsGV" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="AuthorID" SortExpression="AuthorID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("AuthorID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AuthorID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lname" SortExpression="Lname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Lname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Lname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fname" SortExpression="Fname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsAuthorsGV" runat="server" ConnectionString="<%$ ConnectionStrings:conBooks %>" SelectCommand="SELECT [AuthorID], [Lname], [Fname] FROM [Author] ORDER BY [AuthorID]"></asp:SqlDataSource>
        <br />
        <asp:FormView ID="fvAuthors" runat="server" CellPadding="4" DataKeyNames="AuthorID" DataSourceID="dsAuthorsFV" ForeColor="#333333" style="margin-left: 11px">
            <EditItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel1" runat="server" Text='<%# Eval("AuthorID") %>' BackColor="#CCFFFF" />
                <asp:Label ID="Label4" runat="server" AssociatedControlID="AuthorIDLabel1" CssClass="error" Text="You cannot change the AuthorID."></asp:Label>
                <br />
                Lname:
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LnameTextBox" CssClass="error" Display="Dynamic" ErrorMessage="Last name required." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                Fname:
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FnameTextBox" CssClass="error" Display="Dynamic" ErrorMessage="First name required." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                AuthorID:
                <asp:TextBox ID="AuthorIDTextBox" runat="server" Text='<%# Bind("AuthorID") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AuthorIDTextBox" CssClass="error" Display="Dynamic" ErrorMessage="AuthorID is required." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AuthorIDTextBox" CssClass="error" Display="Dynamic" ErrorMessage="AuthorID must be one uppercase letter followed by three numbers." SetFocusOnError="True" ValidationExpression="[A-Z]\d{3}"></asp:RegularExpressionValidator>
                <br />
                Lname:
                <asp:TextBox ID="LnameTextBox" runat="server" Text='<%# Bind("Lname") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="LnameTextBox" CssClass="error" Display="Dynamic" ErrorMessage="Last name is required." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                Fname:
                <asp:TextBox ID="FnameTextBox" runat="server" Text='<%# Bind("Fname") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FnameTextBox" CssClass="error" Display="Dynamic" ErrorMessage="First name is required." SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                AuthorID:
                <asp:Label ID="AuthorIDLabel" runat="server" Text='<%# Eval("AuthorID") %>' />
                <br />
                Lname:
                <asp:Label ID="LnameLabel" runat="server" Text='<%# Bind("Lname") %>' />
                <br />
                Fname:
                <asp:Label ID="FnameLabel" runat="server" Text='<%# Bind("Fname") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
 
        <asp:SqlDataSource ID="dsAuthorsFV" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:conBooks %>" DeleteCommand="DELETE FROM [Author] WHERE [AuthorID] = @original_AuthorID AND (([Lname] = @original_Lname) OR ([Lname] IS NULL AND @original_Lname IS NULL)) AND (([Fname] = @original_Fname) OR ([Fname] IS NULL AND @original_Fname IS NULL))" InsertCommand="INSERT INTO [Author] ([AuthorID], [Lname], [Fname]) VALUES (@AuthorID, @Lname, @Fname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [AuthorID], [Lname], [Fname] FROM [Author] WHERE ([AuthorID] = @AuthorID)" UpdateCommand="UPDATE [Author] SET [Lname] = @Lname, [Fname] = @Fname WHERE [AuthorID] = @original_AuthorID AND (([Lname] = @original_Lname) OR ([Lname] IS NULL AND @original_Lname IS NULL)) AND (([Fname] = @original_Fname) OR ([Fname] IS NULL AND @original_Fname IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_AuthorID" Type="String" />
                <asp:Parameter Name="original_Lname" Type="String" />
                <asp:Parameter Name="original_Fname" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AuthorID" Type="String" />
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvAuthors" Name="AuthorID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Lname" Type="String" />
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="original_AuthorID" Type="String" />
                <asp:Parameter Name="original_Lname" Type="String" />
                <asp:Parameter Name="original_Fname" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </form>
    <footer><a class="button" href="Default.aspx">Home</a></footer>
</body>
</html>
