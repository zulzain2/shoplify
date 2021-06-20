Imports System
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI
Imports System.Web.Security
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Drawing
Imports System.IO
Imports System.Text
Imports System.Security.Cryptography
Imports System.Net.Mail
Imports System.Net
Partial Class Manage_Menu
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        MyCn()
        CheckLogin()

    End Sub

    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
    End Sub

    Protected Sub CheckLogin()
        If Session("ssUserName") = "" Then
            Me.Response.Redirect("Default.aspx")
        End If
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Response.Redirect("~/ManageMenuDetails.aspx?menucategory=" + e.CommandArgument)
    End Sub

    Private Sub btnaddnewmenu_Click(sender As Object, e As EventArgs) Handles btnaddnewmenu.Click
        Response.Redirect("~/AddNewMenu.aspx")
    End Sub

    Private Sub btnadddeletecategory_Click(sender As Object, e As EventArgs) Handles btnadddeletecategory.Click
        Response.Redirect("~/AddNewCategory.aspx")
    End Sub

    Private Sub btneditmenu_Click(sender As Object, e As EventArgs) Handles btneditmenu.Click
        Response.Redirect("~/ManageMenu.aspx")
    End Sub

    Private Sub btnenabledisbalemenu_Click(sender As Object, e As EventArgs) Handles btnenabledisbalemenu.Click
        Response.Redirect("~/MenuActivation.aspx")
    End Sub
End Class
