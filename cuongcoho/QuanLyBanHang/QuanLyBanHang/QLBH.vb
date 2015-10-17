Public Class QLBH
    'Khai bao bien de truy xuat giu lieu tu lop DataBaseAccess
    Private _DBAccess As New DataBaseAccess

    'Khai bao bien kiem tra du lieu dang load
    Private _isLoading As Boolean = False

    'Dinh nghia thu tuc load tu bang LoaiSP vao Combobox
    Private Sub LoadDataOnComBobox()
        Dim sqlQuery As String = "SELECT MaLSP, TenLSP FROM dbo.LoaiSanPham"
        Dim dTable As DataTable = _DBAccess.GetDataTable(sqlQuery)
        Me.cmbClass.DataSource = dTable
        Me.cmbClass.ValueMember = "MaLSP"
        Me.cmbClass.DisplayMember = "TenLSP"

    End Sub
    Private Sub LoadDataOnGridView(MaLSP As String)
        Dim sqlQuery As String = _
            String.Format("SELECT MaSP, TenSP, MaLSP, DonGia FROM dbo.SanPham WHERE MaLSP = '{0}'", MaLSP)
        Dim dTable As DataTable = _DBAccess.GetDataTable(sqlQuery)
        Me.dgvSanPham.DataSource = dTable
        With Me.dgvSanPham
            .Columns(0).HeaderText = "MaSP"
            .Columns(1).HeaderText = "TenSP"
            .Columns(2).HeaderText = "MaLSP"
            .Columns(3).HeaderText = "DonGia"
            .Columns(3).Width = 200
        End With
    End Sub
    Private Sub cmbClass_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbClass.SelectedIndexChanged
        If Not _isLoading Then
            LoadDataOnGridView(Me.cmbClass.SelectedValue)
        End If
    End Sub
    Private Sub QLBH_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        _isLoading = True
        LoadDataOnComBobox()
        LoadDataOnGridView(Me.cmbClass.SelectedValue)
        _isLoading = False
    End Sub
    Private Sub SearchSP(MaLSP As String, value As String)
        Dim sqlQuery As String = _
            String.Format("SELECT MaSP, TenSP, DonGia FROM dbo.SanPham WHERE MaLSP = '{0}'", MaLSP)
        If Me.cmbSearch.SelectedIndex = 0 Then
            sqlQuery += String.Format("AND MaSP LIKE '{0}%'", value)
        ElseIf Me.cmbSearch.SelectedIndex = 1 Then
            sqlQuery += String.Format("AND TenSP LIKE '{0}%'", value)
        End If
        Dim dTable As DataTable = _DBAccess.GetDataTable(sqlQuery)
        Me.dgvSanPham.DataSource = dTable
        With Me.dgvSanPham
            .Columns(0).HeaderText = "MaSP"
            .Columns(1).HeaderText = "TenSP"
            .Columns(2).HeaderText = "DonGia"
            .Columns(2).Width = 200
        End With
    End Sub
    Private Sub txtSearch_TextChanged(sender As Object, e As EventArgs) Handles txtSearch.TextChanged
        SearchSP(Me.cmbClass.SelectedValue, Me.txtSearch.Text)
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim frm As New SanPham(False)
        frm.txtMaLSP.Text = Me.cmbClass.SelectedValue
        frm.ShowDialog()
        If frm.DialogResult = Windows.Forms.DialogResult.OK Then
            LoadDataOnGridView(Me.cmbClass.SelectedValue)
        End If
    End Sub

    Private Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        Dim frm As New SanPham(True)
        frm.txtMaLSP.Text = Me.cmbClass.SelectedValue
        With Me.dgvSanPham
            frm.txtMaSP.Text = .Rows(.CurrentCell.RowIndex).Cells("MaSP").Value
            frm.txtTenSP.Text = .Rows(.CurrentCell.RowIndex).Cells("TenSP").Value
            frm.txtDonGia.Text = .Rows(.CurrentCell.RowIndex).Cells("DonGia").Value
        End With
        frm.ShowDialog()
        If frm.DialogResult = Windows.Forms.DialogResult.OK Then
            LoadDataOnGridView(Me.cmbClass.SelectedValue)
        End If
    End Sub

End Class
