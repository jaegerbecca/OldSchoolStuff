'Becca Jaeger

Option Strict On
Option Explicit On

Partial Class AccountCreation
    Inherits System.Web.UI.Page


    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        If Page.IsValid Then
            If txtHint.Text <> "" Then
                Session("hint") = txtHint.Text
            End If

            Dim userCookie As HttpCookie
            If userCookie Is Nothing Then
                userCookie = New HttpCookie("UserInfo")
                userCookie("userID") = txtUserID.Text
                userCookie("password") = txtPassword.Text
                userCookie("firstname") = txtFname.Text
                userCookie.Expires = Now.AddMinutes(3D)
                Response.Cookies.Add(userCookie)
            End If
            Response.Redirect("AccountCreationCongratulatory.aspx")
        End If
    End Sub

    Protected Sub CustomValidator1_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
        If (txtUserID.Text).Length >= 5 Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblProjectname.Text = CStr(Application("projectname"))
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtFname.Text = ""
        txtLname.Text = ""
        txtDOB.Text = ""
        txtUserID.Text = ""
        txtPassword.Text = ""
        txtVerify.Text = ""
    End Sub
End Class
