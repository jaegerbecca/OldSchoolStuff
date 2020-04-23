'Programmer: Becca Jaeger
Option Explicit On
Option Strict On
Public Class frmCommission
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        lblDate.Text = System.DateTime.Now.ToShortDateString
    End Sub

    Private Sub mnuAbout_Click(sender As Object, e As EventArgs) Handles mnuAbout.Click
        Dim frmAbout As New AboutForm
        frmAbout.ShowDialog()

    End Sub

    Private Sub mnuExit_Click(sender As Object, e As EventArgs) Handles mnuExit.Click
        Try
            Dim drClose As DialogResult
            drClose = MessageBox.Show("Are you sure you want to exit?", "Exit program?", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If drClose = Windows.Forms.DialogResult.Yes Then
                Me.Close()
            End If
        Catch ex As Exception
            MessageBox.Show("Something unexpected happened, please try again", "Inexplicable Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End Try
    End Sub

    Private Sub mnuClearPerson_Click(sender As Object, e As EventArgs) Handles mnuClearPerson.Click
        Try
            txtName.Text = ""
            txtSales.Text = ""
            lblOutPay.Text = ""
            txtName.Focus()
        Catch ex As Exception
            MessageBox.Show("Something unexpected happened, please try again", "Inexplicable Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End Try
    End Sub

    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        mnuExit_Click(sender, e)

    End Sub

    Private Sub btnClearPerson_Click(sender As Object, e As EventArgs) Handles btnClearPerson.Click
        mnuClearPerson_Click(sender, e)

    End Sub

    Private Sub mnuPay_Click(sender As Object, e As EventArgs) Handles mnuPay.Click
        Const decBASE As Decimal = 250
        Const decQUOTA As Decimal = 1000
        Const decCOMMISSIONRATE As Decimal = CDec(0.15)
        Dim decCommission As Decimal
        Dim decSales, decPay As Decimal

        Try
            If txtName.Text = "" Then
                MessageBox.Show("Name must have a value.", "Missing Data", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                txtName.Focus()
            ElseIf txtSales.Text = "" Then
                MessageBox.Show("Sales must have a numeric value.", "Missing Data", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                txtSales.Focus()
            ElseIf Not IsNumeric(txtSales.Text) Then
                MessageBox.Show("Sales must have a numeric value.", "Missing Data", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                txtSales.Focus()
            ElseIf CDec(txtSales.Text) <= 0 Then
                MessageBox.Show("Sales must have a numeric value greater than zero.", "Missing Data", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                txtSales.Focus()
            Else
                decSales = CDec(txtSales.Text)
                decCommission = Commission(decSales, decQUOTA, decCOMMISSIONRATE)
                decPay = decCommission + decBASE
                decTotalSales = decTotalSales + decSales
                decTotalCommission += decCommission
                decTotalPay += decPay
                lblOutPay.Text = decPay.ToString("c")
            End If
        Catch ex As Exception
            MessageBox.Show("Something unexpected happened, please try again", "Inexplicable Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End Try
    End Sub
    Public Function Commission(ByVal Sales As Decimal, Quota As Decimal, CommissionRate As Decimal) As Decimal
        Try
            Dim decComm As Decimal
            If Sales < Quota Then
                Return decComm
            Else
                decComm = Sales * CommissionRate
                Return decComm
            End If
        Catch ex As Exception
            MessageBox.Show("Something unexpected happened, please try again", "Inexplicable Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End Try
    End Function
    Private Sub btnPay_Click(sender As Object, e As EventArgs) Handles btnPay.Click
        mnuPay_Click(sender, e)
    End Sub

    Private Sub btnClearAll_Click(sender As Object, e As EventArgs) Handles btnClearAll.Click
        Try
            Dim drClear As DialogResult
            drClear = MessageBox.Show("Are you sure you want to clear all?", "Clear All?", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If drClear = Windows.Forms.DialogResult.Yes Then
                mnuClearPerson_Click(sender, e)
                decTotalCommission = 0
                decTotalPay = 0
                decTotalSales = 0
            End If
        Catch ex As Exception
            MessageBox.Show("Something unexpected happened, please try again", "Inexplicable Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
        End Try
    End Sub

    Private Sub btnSummary_Click(sender As Object, e As EventArgs) Handles btnSummary.Click
        Dim frmSummary As New SummaryForm
        frmSummary.ShowDialog()
    End Sub

    Private Sub mnuSummary_Click(sender As Object, e As EventArgs) Handles mnuSummary.Click
        btnSummary_Click(sender, e)
    End Sub

    Private Sub mnuClearAll_Click(sender As Object, e As EventArgs) Handles mnuClearAll.Click
        btnClearAll_Click(sender, e)
    End Sub
End Class
