
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("LoginStaff.aspx")
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session("ssUserFullName") = "Customer"
        Session("ssUserLevel") = "Customer"
        Response.Redirect("CustomerClickScan.aspx")
    End Sub


End Class
