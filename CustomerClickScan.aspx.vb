
Partial Class CustomerClickScan
    Inherits System.Web.UI.Page

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Response.Redirect("qrscanner/CustomerScanQR3.html")
    End Sub

    Private Sub btnselecttable_Click(sender As Object, e As ImageClickEventArgs) Handles btnselecttable.Click
        Response.Redirect("TakeOrderTable.aspx")
    End Sub
End Class
