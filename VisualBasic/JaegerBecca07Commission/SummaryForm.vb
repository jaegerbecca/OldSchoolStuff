Public Class SummaryForm

    Private Sub btnExit_Click(sender As Object, e As EventArgs) Handles btnExit.Click
        Me.Close()

    End Sub

    Private Sub SummaryForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        lblOutTtlComm.Text = decTotalCommission.ToString("c")
        lblOutTtlPay.Text = decTotalPay.ToString("c")
        lblOutTtlSales.Text = decTotalSales.ToString("c")
    End Sub
End Class