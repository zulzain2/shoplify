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
Partial Class WaiterOrderHistoryDetails
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


        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT TABLENUM,ORDERTAKEBY,ORDERTAKETIME,TOTALMENUORDER,ORDERTOTALPRICE,FINALORDERSTATUS FROM SHOPLIFYORDERTOTAL WHERE ORDERFINALNUM = @ORDERFINALNUM"

            cmd.Parameters.AddWithValue("@ORDERFINALNUM", Request.QueryString("orderfinalnum"))

            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    lblstatus.Text = lrd.Item("FINALORDERSTATUS")
                    lbltablenum.Text = lrd.Item("TABLENUM")
                    lbltakeby.Text = lrd.Item("ORDERTAKEBY")
                    lbltaketime.Text = lrd.Item("ORDERTAKETIME")
                    lbltotalmenu.Text = lrd.Item("TOTALMENUORDER")
                    lbltotalprice.Text = lrd.Item("ORDERTOTALPRICE")
                End While
            End If

            cn.Close()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


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

    Private Sub Label11_PreRender(sender As Object, e As EventArgs) Handles Label11.PreRender
        Label11.Text = Request.QueryString("orderfinalnum")
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
