Public Class SanPham
    Private _DBAccess As New DataBaseAccess

    Private _isEdit As Boolean = False
    Public Sub New(IsEdit As Boolean)

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        _isEdit = IsEdit
    End Sub
    Private Function InsertSanPham()
        Dim sqlQuery As String = "INSERT INTO SanPham(MaSP, TenSP, MaLSP, DonGia)"
        sqlQuery += String.Format("VALUE ('{0}', '{1}', '{2}', '{3}')", _
                                  txtMaSP.Text, txtTenSP.Text, txtMaLSP.Text, txtDonGia.Text)
        Return _DBAccess.ExecuteNoneQuery(sqlQuery)
    End Function

    Private Function UpdateSanPham() As Boolean
        Dim sqlQuery As String = String.Format("UpdateSanPham SanPham SET TenSP= '{0}',DonGia = '{1}' WHERE MaSP = '{2}' ", _
                                               Me.txtTenSP.Text, Me.txtDonGia.Text, Me.txtMaSP.Text)
        Return _DBAccess.ExecuteNoneQuery(sqlQuery)
    End Function

    Private Function IsEmpty() As Boolean
        Return (String.IsNullOrEmpty(txtMaSP.Text) OrElse String.IsNullOrEmpty(txtTenSP.Text) OrElse _
            String.IsNullOrEmpty(txtMaLSP.Text) OrElse String.IsNullOrEmpty(txtDonGia.Text))
    End Function
    Private Sub SanPham_load(sender As Object, e As EventArgs) Handles MyBase.Load
        If IsEmpty() Then
            MessageBox.Show("Hay Nhap Cac Gia Tri", "Error", MessageBoxButtons.OK)
        Else
            If InsertSanPham() Then
                MessageBox.Show("Them Du Lieu Thanh Cong!", "Information", MessageBoxButtons.OK)
            Else
                MessageBox.Show("Loi Xay Ra!", "Error", MessageBoxButtons.OK)
            End If
        End If
    End Sub

    Private Sub btnOk_Click(sender As Object, e As EventArgs) Handles btnOk.Click
        If IsEmpty() Then
            MessageBox.Show("Hay Nhap Cac Gia Tri", "Error", MessageBoxButtons.OK)
            If _isEdit Then
                If UpdateSanPham() Then
                    MessageBox.Show("Sua thanh cong", "Information", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.OK
                Else
                    MessageBox.Show("Xay Ra loi", "Error", MessageBoxButtons.OK)
                    Me.DialogResult = Windows.Forms.DialogResult.No
                End If
            End If
        Else
            If InsertSanPham() Then
                MessageBox.Show("Them Du Lieu Thanh Cong!", "Information", MessageBoxButtons.OK)
                Me.DialogResult = Windows.Forms.DialogResult.OK
            Else
                MessageBox.Show("Loi Xay Ra!", "Error", MessageBoxButtons.OK)
                Me.DialogResult = Windows.Forms.DialogResult.No
                Me.Close()
            End If
        End If
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

   
    
End Class