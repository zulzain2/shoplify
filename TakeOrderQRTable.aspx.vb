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
Partial Class TakeOrderQRTable
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString

    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT CURRENTTABLESTATUS FROM SHOPLIFYRESTAURANTTABLE WHERE TABLENUM = @TABLENUM"

            cmd.Parameters.AddWithValue("@TABLENUM", Request.QueryString("tablenum"))



            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            Dim currenttablestatus As String

            If lrd.HasRows = True Then

                While lrd.Read()
                    currenttablestatus = lrd.Item("CURRENTTABLESTATUS")
                End While
                Session("tablenum") = Request.QueryString("tablenum")

                If currenttablestatus = "OCCUPIED" Then
                    Response.Redirect("~/OrderStatusCustomer.aspx?tablenum=" + Request.QueryString("tablenum") + "&currenttablestatus=OCCUPIED")
                ElseIf currenttablestatus = "AVAILABLE" Then
                    Response.Redirect("~/TakeOrderCustomer.aspx?tablenum=" + Request.QueryString("tablenum"))
                End If

            End If

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

    End Sub

    Protected Sub MyMsgBox(ByVal tcMessage As String)
        Dim lcScript As String
        tcMessage = Replace(tcMessage, vbCrLf, "\n")
        tcMessage = Replace(tcMessage, """", "")
        lcScript = "<script language=""javascript"">" &
                   "alert(""" & tcMessage & """);" & vbCrLf &
                   "</script>"
        Page.ClientScript.RegisterStartupScript(GetType(String), "PopUp", lcScript)
    End Sub

End Class
