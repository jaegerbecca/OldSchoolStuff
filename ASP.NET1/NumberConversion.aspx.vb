'Becca Jaeger

Option Strict On
Option Explicit On

Partial Class NumberConversion
    Inherits System.Web.UI.Page

    Protected Sub btnConvert_Click(sender As Object, e As EventArgs) Handles btnConvert.Click
        Try
            lblError.Text = ""
            If txtDecNum.Text = "" Then
                lblError.Text = "Number Required"
            ElseIf Not IsNumeric(txtDecNum.Text) Then
                lblError.Text = "Must Be Number Only"
            ElseIf CDbl(txtDecNum.Text) < 0 Or CDbl(txtDecNum.Text) > 255 Then
                lblError.Text = "Number Must Be Between 0 And 255"
            ElseIf Math.Floor(CDbl(txtDecNum.Text)) <> Math.Ceiling(CDbl(txtDecNum.Text)) Then
                lblError.Text = "Number Must Be A Whole Number(No Decimals)"
            Else
                'input storage
                Dim intDec As Integer
                intDec = CInt(txtDecNum.Text)

                'processing
                Dim strBinary As String

                If intDec = 0 Then
                    strBinary = CStr(0)

                    'output
                    If chkIP.Checked = True Then
                        'pad with zeros
                        While strBinary.Length < 8
                            strBinary = CStr(0) & strBinary
                            lblConvertedOut.Text = strBinary
                        End While
                    Else
                        lblConvertedOut.Text = strBinary
                    End If
                Else
                    strBinary = ""
                    Do While intDec > 0
                        strBinary = intDec Mod 2 & strBinary
                        intDec = intDec \ 2
                    Loop

                    'output
                    If chkIP.Checked = True Then
                        'pad with zeros
                        While strBinary.Length < 8
                            strBinary = CStr(0) & strBinary
                            lblConvertedOut.Text = strBinary
                        End While
                    Else
                        lblConvertedOut.Text = strBinary
                    End If
                End If
            End If
        Catch ex As Exception
            lblError.Text = "Something strange happened, please try again."
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblProjectname.Text = CStr(Application("projectname"))
    End Sub

End Class
