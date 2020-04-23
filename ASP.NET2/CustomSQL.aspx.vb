'Becca Jaeger
Option Strict On
Option Explicit On
Partial Class CustomSQL
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblprogname.Text = CStr(Application("progname"))
    End Sub

End Class
