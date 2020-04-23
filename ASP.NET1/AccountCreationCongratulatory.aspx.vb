'Becca Jaeger

Option Strict On
Option Explicit On

Partial Class AccountCreationCongratulatory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblProjectname.Text = CStr(Application("projectname"))

        If Request.Cookies("userInfo") IsNot Nothing Then
            lblUID.Text = Server.HtmlEncode(Request.Cookies("UserInfo")("userID"))
            lblPASS.Text = Server.HtmlEncode(Request.Cookies("UserInfo")("password"))
        End If
    End Sub

End Class
