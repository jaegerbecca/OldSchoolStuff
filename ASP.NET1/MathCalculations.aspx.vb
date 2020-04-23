'Becca Jaeger
Option Strict On
Option Explicit On
Partial Class MathCalculations
    Inherits System.Web.UI.Page

    Protected Sub btnCalculate_Click(sender As Object, e As EventArgs) Handles btnCalculate.Click
        Dim intNum1, intNum2, intFunny As Integer
        Dim decMoney As Decimal
        Try
            lblError.Text = ""
            If txtNum1.Text = "" Then
                lblError.Text = "First Number Required"
            ElseIf txtNum2.Text = "" Then
                lblError.Text = "Second Number Required"
            ElseIf Not IsNumeric(txtNum1.Text) Then
                lblError.Text = "First Number Must Be Number Only"
            ElseIf Not IsNumeric(txtNum2.Text) Then
                lblError.Text = "Second Number Must Be Number Only"
            ElseIf CDbl(txtNum1.Text) <= 0 Then
                lblError.Text = "First Number Must Be Greater Than Zero"
            ElseIf CDbl(txtNum2.Text) <= 0 Then
                lblError.Text = "Second Number Must Be Greater Than Zero"
            ElseIf Math.Floor(CDbl(txtNum1.Text)) <> Math.Ceiling(CDbl(txtNum1.Text)) Then
                lblError.Text = "First Number Must Be A Whole Number(No Decimals)"
            ElseIf Math.Floor(CDbl(txtNum2.Text)) <> Math.Ceiling(CDbl(txtNum2.Text)) Then
                lblError.Text = "Second Number Must Be A Whole Number(No Decimals)"
            Else
                'input storage
                intNum1 = CInt(txtNum1.Text)
                intNum2 = CInt(txtNum2.Text)

                If radFunny.Checked = True Then
                    'funny math
                    'processing
                    Dim intCount As Integer
                    intCount = 0
                    intFunny = 0
                    Do While intCount < intNum1
                        intFunny = intFunny + intNum2
                        intCount += 1
                    Loop

                    'output
                    lblOutput.Text = "The product of " & intNum1 & " and " & intNum2 & " is " & CStr(intFunny)
                Else
                    'money math
                    'processing
                    Dim intCount As Integer
                    intCount = 1
                    decMoney = CDec(intNum1 / 100)
                    Do While intCount < intNum2
                        decMoney += decMoney
                        intCount += 1
                    Loop
                    'output
                    lblOutput.Text = "I will recieve " & decMoney.ToString("C")
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
