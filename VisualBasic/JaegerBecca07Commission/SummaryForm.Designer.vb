<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class SummaryForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.lblTtlSales = New System.Windows.Forms.Label()
        Me.lblTtlComm = New System.Windows.Forms.Label()
        Me.lblTtlPay = New System.Windows.Forms.Label()
        Me.lblOutTtlSales = New System.Windows.Forms.Label()
        Me.lblOutTtlComm = New System.Windows.Forms.Label()
        Me.lblOutTtlPay = New System.Windows.Forms.Label()
        Me.btnExit = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblTtlSales
        '
        Me.lblTtlSales.AutoSize = True
        Me.lblTtlSales.Location = New System.Drawing.Point(23, 19)
        Me.lblTtlSales.Name = "lblTtlSales"
        Me.lblTtlSales.Size = New System.Drawing.Size(60, 13)
        Me.lblTtlSales.TabIndex = 0
        Me.lblTtlSales.Text = "Total Sales"
        '
        'lblTtlComm
        '
        Me.lblTtlComm.AutoSize = True
        Me.lblTtlComm.Location = New System.Drawing.Point(-1, 53)
        Me.lblTtlComm.Name = "lblTtlComm"
        Me.lblTtlComm.Size = New System.Drawing.Size(89, 13)
        Me.lblTtlComm.TabIndex = 1
        Me.lblTtlComm.Text = "Total Commission"
        '
        'lblTtlPay
        '
        Me.lblTtlPay.AutoSize = True
        Me.lblTtlPay.Location = New System.Drawing.Point(31, 87)
        Me.lblTtlPay.Name = "lblTtlPay"
        Me.lblTtlPay.Size = New System.Drawing.Size(52, 13)
        Me.lblTtlPay.TabIndex = 2
        Me.lblTtlPay.Text = "Total Pay"
        '
        'lblOutTtlSales
        '
        Me.lblOutTtlSales.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblOutTtlSales.Location = New System.Drawing.Point(94, 9)
        Me.lblOutTtlSales.Name = "lblOutTtlSales"
        Me.lblOutTtlSales.Size = New System.Drawing.Size(100, 23)
        Me.lblOutTtlSales.TabIndex = 3
        '
        'lblOutTtlComm
        '
        Me.lblOutTtlComm.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblOutTtlComm.Location = New System.Drawing.Point(94, 43)
        Me.lblOutTtlComm.Name = "lblOutTtlComm"
        Me.lblOutTtlComm.Size = New System.Drawing.Size(100, 23)
        Me.lblOutTtlComm.TabIndex = 4
        '
        'lblOutTtlPay
        '
        Me.lblOutTtlPay.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblOutTtlPay.Location = New System.Drawing.Point(94, 77)
        Me.lblOutTtlPay.Name = "lblOutTtlPay"
        Me.lblOutTtlPay.Size = New System.Drawing.Size(100, 23)
        Me.lblOutTtlPay.TabIndex = 5
        '
        'btnExit
        '
        Me.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.btnExit.Location = New System.Drawing.Point(192, 129)
        Me.btnExit.Name = "btnExit"
        Me.btnExit.Size = New System.Drawing.Size(75, 23)
        Me.btnExit.TabIndex = 6
        Me.btnExit.Text = "E&xit"
        Me.btnExit.UseVisualStyleBackColor = True
        '
        'SummaryForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.CancelButton = Me.btnExit
        Me.ClientSize = New System.Drawing.Size(279, 164)
        Me.Controls.Add(Me.btnExit)
        Me.Controls.Add(Me.lblOutTtlPay)
        Me.Controls.Add(Me.lblOutTtlComm)
        Me.Controls.Add(Me.lblOutTtlSales)
        Me.Controls.Add(Me.lblTtlPay)
        Me.Controls.Add(Me.lblTtlComm)
        Me.Controls.Add(Me.lblTtlSales)
        Me.Name = "SummaryForm"
        Me.Text = "Summary for All Salespeople"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblTtlSales As System.Windows.Forms.Label
    Friend WithEvents lblTtlComm As System.Windows.Forms.Label
    Friend WithEvents lblTtlPay As System.Windows.Forms.Label
    Friend WithEvents lblOutTtlSales As System.Windows.Forms.Label
    Friend WithEvents lblOutTtlComm As System.Windows.Forms.Label
    Friend WithEvents lblOutTtlPay As System.Windows.Forms.Label
    Friend WithEvents btnExit As System.Windows.Forms.Button
End Class
