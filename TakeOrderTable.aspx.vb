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
Partial Class TakeOrderTable
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        MyCn()


    End Sub

    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
    End Sub



    Private Sub ListView1_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView1.ItemCommand

        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT CURRENTTABLESTATUS FROM SHOPLIFYRESTAURANTTABLE WHERE TABLENUM = @TABLENUM"

            cmd.Parameters.AddWithValue("@TABLENUM", e.CommandArgument)

            Dim lrd As SqlDataReader = cmd.ExecuteReader()
            Dim currenttablestatus As String

            If lrd.HasRows = True Then
                While lrd.Read()
                    currenttablestatus = lrd.Item("CURRENTTABLESTATUS")
                End While

                Session("tablenum") = e.CommandArgument
                If currenttablestatus = "OCCUPIED" Then
                    Response.Redirect("~/OrderStatusCustomer.aspx?tablenum=" + e.CommandArgument + "&currenttablestatus=OCCUPIED")
                ElseIf currenttablestatus = "AVAILABLE" Then
                    Response.Redirect("~/CustomerHome.aspx?tablenum=" + e.CommandArgument)
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

    Private Sub ListView1_PreRender(sender As Object, e As EventArgs) Handles ListView1.PreRender
        Dim dli As ListViewItem

        Dim currenttablestatus As String = ""


        For Each dli In ListView1.Items

            currenttablestatus = DirectCast(dli.FindControl("CURRENTTABLESTATUSlbl"), Label).Text



            If currenttablestatus = "AVAILABLE" Then
                dli.FindControl("imgtableavailable").Visible = True
                dli.FindControl("imgtablenotpaid").Visible = False




            ElseIf currenttablestatus = "OCCUPIED" Then

                dli.FindControl("imgtableavailable").Visible = False
                dli.FindControl("imgtablenotpaid").Visible = True




            End If



        Next
    End Sub
End Class
