
Partial Class Navigation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblProjectname.Text = CStr(Application("projectname"))

        If Request.Cookies("userInfo") IsNot Nothing Then
            lblname.Text = Server.HtmlEncode(Request.Cookies("UserInfo")("firstname"))
        End If

    End Sub

End Class
