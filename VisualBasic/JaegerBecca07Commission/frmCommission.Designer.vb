<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmCommission
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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.mnuFile = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuPay = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuSummary = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.mnuExit = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuEdit = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuClearPerson = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuClearAll = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuHelp = New System.Windows.Forms.ToolStripMenuItem()
        Me.mnuAbout = New System.Windows.Forms.ToolStripMenuItem()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.lblProgName = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lblDate = New System.Windows.Forms.ToolStripStatusLabel()
        Me.lblName = New System.Windows.Forms.Label()
        Me.lblSales = New System.Windows.Forms.Label()
        Me.txtSales = New System.Windows.Forms.TextBox()
        Me.txtName = New System.Windows.Forms.TextBox()
        Me.lblPay = New System.Windows.Forms.Label()
        Me.lblOutPay = New System.Windows.Forms.Label()
        Me.btnPay = New System.Windows.Forms.Button()
        Me.btnSummary = New System.Windows.Forms.Button()
        Me.btnClearPerson = New System.Windows.Forms.Button()
        Me.btnClearAll = New System.Windows.Forms.Button()
        Me.btnExit = New System.Windows.Forms.Button()
        Me.MenuStrip1.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MenuStrip1
        '
        Me.MenuStrip1.ImageScalingSize = New System.Drawing.Size(24, 24)
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuFile, Me.mnuEdit, Me.mnuHelp})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Padding = New System.Windows.Forms.Padding(4, 1, 0, 1)
        Me.MenuStrip1.Size = New System.Drawing.Size(287, 24)
        Me.MenuStrip1.TabIndex = 1
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'mnuFile
        '
        Me.mnuFile.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuPay, Me.mnuSummary, Me.ToolStripSeparator1, Me.mnuExit})
        Me.mnuFile.Name = "mnuFile"
        Me.mnuFile.Size = New System.Drawing.Size(37, 22)
        Me.mnuFile.Text = "&File"
        '
        'mnuPay
        '
        Me.mnuPay.Name = "mnuPay"
        Me.mnuPay.Size = New System.Drawing.Size(152, 22)
        Me.mnuPay.Text = "&Pay"
        '
        'mnuSummary
        '
        Me.mnuSummary.Name = "mnuSummary"
        Me.mnuSummary.Size = New System.Drawing.Size(152, 22)
        Me.mnuSummary.Text = "&Summary"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(149, 6)
        '
        'mnuExit
        '
        Me.mnuExit.Name = "mnuExit"
        Me.mnuExit.Size = New System.Drawing.Size(152, 22)
        Me.mnuExit.Text = "E&xit"
        '
        'mnuEdit
        '
        Me.mnuEdit.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuClearPerson, Me.mnuClearAll})
        Me.mnuEdit.Name = "mnuEdit"
        Me.mnuEdit.Size = New System.Drawing.Size(39, 22)
        Me.mnuEdit.Text = "&Edit"
        '
        'mnuClearPerson
        '
        Me.mnuClearPerson.Name = "mnuClearPerson"
        Me.mnuClearPerson.Size = New System.Drawing.Size(140, 22)
        Me.mnuClearPerson.Text = "C&lear Person"
        '
        'mnuClearAll
        '
        Me.mnuClearAll.Name = "mnuClearAll"
        Me.mnuClearAll.Size = New System.Drawing.Size(152, 22)
        Me.mnuClearAll.Text = "Clea&r All"
        '
        'mnuHelp
        '
        Me.mnuHelp.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.mnuAbout})
        Me.mnuHelp.Name = "mnuHelp"
        Me.mnuHelp.Size = New System.Drawing.Size(44, 22)
        Me.mnuHelp.Text = "&Help"
        '
        'mnuAbout
        '
        Me.mnuAbout.Name = "mnuAbout"
        Me.mnuAbout.Size = New System.Drawing.Size(107, 22)
        Me.mnuAbout.Text = "&About"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.ImageScalingSize = New System.Drawing.Size(24, 24)
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.lblProgName, Me.lblDate})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 203)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Padding = New System.Windows.Forms.Padding(1, 0, 9, 0)
        Me.StatusStrip1.Size = New System.Drawing.Size(287, 22)
        Me.StatusStrip1.TabIndex = 2
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'lblProgName
        '
        Me.lblProgName.Name = "lblProgName"
        Me.lblProgName.Size = New System.Drawing.Size(147, 17)
        Me.lblProgName.Text = "Programmer: Becca Jaeger"
        '
        'lblDate
        '
        Me.lblDate.Name = "lblDate"
        Me.lblDate.Size = New System.Drawing.Size(92, 17)
        Me.lblDate.Text = "Impending Date"
        '
        'lblName
        '
        Me.lblName.AutoSize = True
        Me.lblName.Location = New System.Drawing.Point(12, 35)
        Me.lblName.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.lblName.Name = "lblName"
        Me.lblName.Size = New System.Drawing.Size(35, 13)
        Me.lblName.TabIndex = 3
        Me.lblName.Text = "Name"
        '
        'lblSales
        '
        Me.lblSales.AutoSize = True
        Me.lblSales.Location = New System.Drawing.Point(13, 60)
        Me.lblSales.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.lblSales.Name = "lblSales"
        Me.lblSales.Size = New System.Drawing.Size(33, 13)
        Me.lblSales.TabIndex = 4
        Me.lblSales.Text = "Sales"
        '
        'txtSales
        '
        Me.txtSales.Location = New System.Drawing.Point(50, 56)
        Me.txtSales.Margin = New System.Windows.Forms.Padding(2)
        Me.txtSales.Name = "txtSales"
        Me.txtSales.Size = New System.Drawing.Size(68, 20)
        Me.txtSales.TabIndex = 6
        '
        'txtName
        '
        Me.txtName.Location = New System.Drawing.Point(50, 31)
        Me.txtName.Margin = New System.Windows.Forms.Padding(2)
        Me.txtName.Name = "txtName"
        Me.txtName.Size = New System.Drawing.Size(68, 20)
        Me.txtName.TabIndex = 5
        '
        'lblPay
        '
        Me.lblPay.AutoSize = True
        Me.lblPay.Location = New System.Drawing.Point(23, 83)
        Me.lblPay.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.lblPay.Name = "lblPay"
        Me.lblPay.Size = New System.Drawing.Size(25, 13)
        Me.lblPay.TabIndex = 7
        Me.lblPay.Text = "Pay"
        '
        'lblOutPay
        '
        Me.lblOutPay.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblOutPay.Location = New System.Drawing.Point(50, 81)
        Me.lblOutPay.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.lblOutPay.Name = "lblOutPay"
        Me.lblOutPay.Size = New System.Drawing.Size(67, 16)
        Me.lblOutPay.TabIndex = 8
        '
        'btnPay
        '
        Me.btnPay.Location = New System.Drawing.Point(43, 113)
        Me.btnPay.Name = "btnPay"
        Me.btnPay.Size = New System.Drawing.Size(75, 23)
        Me.btnPay.TabIndex = 9
        Me.btnPay.Text = "&Pay"
        Me.btnPay.UseVisualStyleBackColor = True
        '
        'btnSummary
        '
        Me.btnSummary.Location = New System.Drawing.Point(124, 113)
        Me.btnSummary.Name = "btnSummary"
        Me.btnSummary.Size = New System.Drawing.Size(75, 23)
        Me.btnSummary.TabIndex = 10
        Me.btnSummary.Text = "&Summary"
        Me.btnSummary.UseVisualStyleBackColor = True
        '
        'btnClearPerson
        '
        Me.btnClearPerson.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.btnClearPerson.Location = New System.Drawing.Point(43, 142)
        Me.btnClearPerson.Name = "btnClearPerson"
        Me.btnClearPerson.Size = New System.Drawing.Size(75, 23)
        Me.btnClearPerson.TabIndex = 11
        Me.btnClearPerson.Text = "C&lear Person"
        Me.btnClearPerson.UseVisualStyleBackColor = True
        '
        'btnClearAll
        '
        Me.btnClearAll.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.btnClearAll.Location = New System.Drawing.Point(124, 142)
        Me.btnClearAll.Name = "btnClearAll"
        Me.btnClearAll.Size = New System.Drawing.Size(75, 23)
        Me.btnClearAll.TabIndex = 12
        Me.btnClearAll.Text = "Clea&r All"
        Me.btnClearAll.UseVisualStyleBackColor = True
        '
        'btnExit
        '
        Me.btnExit.Location = New System.Drawing.Point(200, 171)
        Me.btnExit.Name = "btnExit"
        Me.btnExit.Size = New System.Drawing.Size(75, 23)
        Me.btnExit.TabIndex = 13
        Me.btnExit.Text = "E&xit"
        Me.btnExit.UseVisualStyleBackColor = True
        '
        'frmCommission
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.CancelButton = Me.btnClearPerson
        Me.ClientSize = New System.Drawing.Size(287, 225)
        Me.Controls.Add(Me.btnExit)
        Me.Controls.Add(Me.btnClearAll)
        Me.Controls.Add(Me.btnClearPerson)
        Me.Controls.Add(Me.btnSummary)
        Me.Controls.Add(Me.btnPay)
        Me.Controls.Add(Me.lblOutPay)
        Me.Controls.Add(Me.lblPay)
        Me.Controls.Add(Me.txtName)
        Me.Controls.Add(Me.txtSales)
        Me.Controls.Add(Me.lblSales)
        Me.Controls.Add(Me.lblName)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Margin = New System.Windows.Forms.Padding(2)
        Me.Name = "frmCommission"
        Me.Text = "Commission"
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents lblProgName As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lblDate As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents lblName As System.Windows.Forms.Label
    Friend WithEvents lblSales As System.Windows.Forms.Label
    Friend WithEvents txtSales As System.Windows.Forms.TextBox
    Friend WithEvents txtName As System.Windows.Forms.TextBox
    Friend WithEvents lblPay As System.Windows.Forms.Label
    Friend WithEvents lblOutPay As System.Windows.Forms.Label
    Friend WithEvents mnuFile As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuPay As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuSummary As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuExit As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuEdit As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuClearPerson As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuClearAll As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuHelp As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents mnuAbout As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents btnPay As System.Windows.Forms.Button
    Friend WithEvents btnSummary As System.Windows.Forms.Button
    Friend WithEvents btnClearPerson As System.Windows.Forms.Button
    Friend WithEvents btnClearAll As System.Windows.Forms.Button
    Friend WithEvents btnExit As System.Windows.Forms.Button
    Friend WithEvents ToolStripSeparator1 As System.Windows.Forms.ToolStripSeparator

End Class
