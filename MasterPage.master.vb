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
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

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

    Protected Sub hypLogout_Click(sender As Object, e As EventArgs) Handles hypLogout.Click
        Session.Contents.Clear()
        Session.Abandon()
        Me.Response.Redirect("Default.aspx")
    End Sub

    Protected Sub hypLogout2_Click(sender As Object, e As EventArgs) Handles hypLogout2.Click
        Session.Contents.Clear()
        Session.Abandon()
        Me.Response.Redirect("Default.aspx")
    End Sub

    Protected Sub accSetting_Click(sender As Object, e As EventArgs) Handles accSetting.Click
        Me.Response.Redirect("AccountSetting.aspx")
    End Sub

    Protected Sub mymessage_Click(sender As Object, e As EventArgs) Handles mymessage.Click
        Me.Response.Redirect("Home.aspx")
    End Sub

    Private Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

        If DropDownList1.Text = "Administrator" Then
            Session("ssUserLevel") = "Administrator"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "Cashier" Then
            Session("ssUserLevel") = "Cashier"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "Waiter" Then
            Session("ssUserLevel") = "Waiter"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "Chef" Then
            Session("ssUserLevel") = "Chef"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "Manager" Then
            Session("ssUserLevel") = "Manager"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "General Manager" Then
            Session("ssUserLevel") = "General Manager"
            Response.Redirect("Home.aspx")

        ElseIf DropDownList1.Text = "Customer" Then
            Session("ssUserLevel") = "Customer"
            Response.Redirect("TakeOrderTable.aspx")
        End If

    End Sub

    Private Sub DropDownList1_PreRender(sender As Object, e As EventArgs) Handles DropDownList1.PreRender

        DropDownList1.Items.FindByText(Session("ssUserLevel").ToString()).Selected = True
    End Sub

    Private Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged

        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT BRANCHNAME FROM SHOPLIFYBRANCH"

            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then

                While lrd.Read()
                    If DropDownList2.Text = lrd.Item("BRANCHNAME") Then
                        Session("ssUserBranch") = lrd.Item("BRANCHNAME")

                    End If
                End While

            End If

            cn.Close()
        Catch ex As Exception
            MyMsgBox("First Try" + ex.GetBaseException().ToString())
        End Try

    End Sub



    'Private Sub DropDownList2_PreRender(sender As Object, e As EventArgs) Handles DropDownList2.PreRender
    '    DropDownList2.Items.FindByText(Session("ssUserBranch").ToString()).Selected = True
    'End Sub



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

