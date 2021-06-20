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
Partial Class MenuActivationDetail
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


    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then



            If e.Row.Cells(6).Text = "DISABLE" Then

                e.Row.Cells(6).Text = "<span class='label label-rounded label-danger'>" & e.Row.Cells(6).Text & "</span>"


            ElseIf e.Row.Cells(6).Text = "ACTIVE" Then

                e.Row.Cells(6).Text = "<span class='label label-rounded label-success'>" & e.Row.Cells(6).Text & "</span>"


            End If


            Dim MENUSTATUS As String = DataBinder.Eval(e.Row.DataItem, "MENUSTATUS").ToString()

            If MENUSTATUS = "DISABLE" Then
                Dim lb As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb.Visible = True
                lb.CssClass = "btn btn-success btn-block"
                lb.Text = "ENABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim group As String = GridView1.DataKeys(e.Row.RowIndex).Values(0).ToString()
                End If

            ElseIf MENUSTATUS = "ACTIVE" Then
                Dim lb2 As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb2.Visible = True
                lb2.CssClass = "btn btn-warning btn-block"
                lb2.Text = "DISABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then

                    Dim group As String = GridView1.DataKeys(e.Row.RowIndex).Values(0).ToString()

                End If
            End If
        End If
    End Sub

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "AVAILABILITY" Then
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)


            Session("ttMENUSTATUS") = GridView1.DataKeys(rowIndex).Values(1).ToString()


            If Session("ttMENUSTATUS") = "ACTIVE" Then

                Session("ttMENUNAME") = GridView1.DataKeys(rowIndex).Values(0).ToString()
                Session("ttMENUSTATUS") = "DISABLE"

                mp_confirm_disable.Show()

            Else
                Session("ttMENUNAME") = GridView1.DataKeys(rowIndex).Values(0).ToString()
                Session("ttMENUSTATUS") = "ACTIVE"
                mp_confirmenable.Show()

            End If
        End If

    End Sub

    Protected Sub btnconfirm_enable_Click(sender As Object, e As EventArgs)
        updateMenuStatus()
    End Sub

    Protected Sub btnconfirmdisable_Click(sender As Object, e As EventArgs)
        updateMenuStatus()
    End Sub

    Protected Sub updateMenuStatus()
        Try
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATE As Date = DateTime.Now.ToString()

            xSQL.AppendLine("UPDATE SHOPLIFYMENUMASTER")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("MENUSTATUS = @MENUSTATUS, MENUCHANGEBY = @MENUCHANGEBY, MENUCHANGEDATE = @MENUCHANGEDATE")
            xSQL.AppendLine("WHERE MENUNAME = @MENUNAME")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@MENUSTATUS", Session("ttMENUSTATUS"))
                cmd.Parameters.AddWithValue("@MENUCHANGEBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@MENUCHANGEDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@MENUNAME", Session("ttMENUNAME"))

                cmd.ExecuteNonQuery()

                cn.Close()


            End Using

            If Session("ttMENUSTATUS") = "DISABLE" Then
                mp_disable_done.Show()
            Else
                mp_enable_done.Show()
            End If


        Catch ex As Exception
            If Session("ttMENUSTATUS") = "DISABLE" Then
                mp_disable_failed.Show()
            Else
                mp_enablefailed.Show()
            End If
        End Try
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect(Request.RawUrl)
    End Sub

End Class
