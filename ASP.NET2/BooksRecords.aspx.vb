'Becca Jaeger
Option Strict On
Option Explicit On
Partial Class ViewRecords
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblprogname.Text = CStr(Application("progname"))
    End Sub

End Class
