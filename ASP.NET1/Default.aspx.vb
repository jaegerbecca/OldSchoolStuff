'Becca Jaeger
Option Strict On
Option Explicit On
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim user, pass As String
        user = txtUsername.Text
        pass = txtPassword.Text

        If user = Server.HtmlEncode(Request.Cookies("UserInfo")("userID")) And pass = Server.HtmlEncode(Request.Cookies("UserInfo")("password")) Then
            Response.Redirect("Navigation.aspx")
        Else
            Response.Redirect("Err.aspx")
        End If

    End Sub

    Protected Sub btnAccountCreation_Click(sender As Object, e As EventArgs) Handles btnAccountCreation.Click
        Response.Redirect("AccountCreation.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblProjectname.Text = CStr(Application("projectname"))

        If Request.Cookies("userInfo") Is Nothing Then
            lblHint.Text = ""
            txtUsername.Text = ""
            btnAccountCreation.Enabled = True
            btnSubmit.Enabled = False
        Else
            txtUsername.Text = Server.HtmlEncode(Request.Cookies("UserInfo")("userID"))
            btnAccountCreation.Enabled = False
            btnSubmit.Enabled = True
            If Session("hint") Is Nothing Then
                chkHint.Enabled = False
                lblHint.Text = "No password hint was created."
            Else
                lblHint.Text = "Show/Hide password hint."
            End If
        End If

    End Sub

    Protected Sub chkHint_CheckedChanged(sender As Object, e As EventArgs) Handles chkHint.CheckedChanged

        If chkHint.Checked = True Then
            lblHint.Text = CStr(Session("hint"))
        Else
            lblHint.Text = "Show/Hide password hint."
        End If

    End Sub
End Class
