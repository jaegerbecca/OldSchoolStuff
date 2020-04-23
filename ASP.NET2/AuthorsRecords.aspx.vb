'Becca Jaeger
Option Strict On
Option Explicit On
Partial Class AuthorsRecords
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblprogname.Text = CStr(Application("progname"))
    End Sub

    Protected Sub dsAuthorsFV_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles dsAuthorsFV.Inserted
        gvAuthors.DataBind()
    End Sub

    Protected Sub dsAuthorsFV_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles dsAuthorsFV.Updated
        gvAuthors.DataBind()
    End Sub

    Protected Sub fvAuthors_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles fvAuthors.ItemDeleted
        gvAuthors.DataBind()
    End Sub

    Protected Sub fvAuthors_ItemDeleting(sender As Object, e As FormViewDeleteEventArgs) Handles fvAuthors.ItemDeleting
        Dim lname As String
        Dim fname As String
        Dim answer As MsgBoxResult
        lname = CStr(e.Values("Lname"))
        fname = CStr(e.Values("Fname"))
        answer = MsgBox("Are you sure you want to delete the author record for " & lname & ", " & fname & "?", MsgBoxStyle.YesNo, "Confirm Deletion")
        If answer = MsgBoxResult.No Then
            e.Cancel = True
        Else
            e.Cancel = False
        End If

    End Sub
End Class
