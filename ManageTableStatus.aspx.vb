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
Partial Class ManageTableStatus
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

    Private Sub gvtablelist_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvtablelist.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim TABLESTATUS As String = DataBinder.Eval(e.Row.DataItem, "TABLESTATUS").ToString()




            If TABLESTATUS = "DISABLE" Then
                Dim lb As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb.Visible = True
                lb.CssClass = "btn btn-success btn-block"
                lb.Text = "ENABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim group As String = gvtablelist.DataKeys(e.Row.RowIndex).Values(0).ToString()
                End If

            ElseIf TABLESTATUS = "ACTIVE" Then
                Dim lb2 As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb2.Visible = True
                lb2.CssClass = "btn btn-warning btn-block"
                lb2.Text = "DISABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then

                    Dim group As String = gvtablelist.DataKeys(e.Row.RowIndex).Values(0).ToString()


                End If

            End If

        End If

    End Sub


    Protected Sub gvtablelist_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvtablelist.RowCommand
        If e.CommandName = "AVAILABILITY" Then
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)


            Session("ttTABLESTATUS") = gvtablelist.DataKeys(rowIndex).Values(1).ToString()


            If Session("ttTABLESTATUS") = "ACTIVE" Then

                Session("ttTABLEID") = gvtablelist.DataKeys(rowIndex).Values(0).ToString()
                Session("ttTABLESTATUS") = "DISABLE"

                mp_confirm_disable.Show()

            Else
                Session("ttTABLEID") = gvtablelist.DataKeys(rowIndex).Values(0).ToString()
                Session("ttTABLESTATUS") = "ACTIVE"

                mp_confirmenable.Show()

            End If
        End If

    End Sub

    Protected Sub btnconfirmdisable_Click(sender As Object, e As EventArgs)
        updateTableStatus()
    End Sub

    Protected Sub btnconfirm_enable_Click(sender As Object, e As EventArgs)
        updateTableStatus()
    End Sub

    Protected Sub updateTableStatus()
        Try
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATE As Date = DateTime.Now.ToString()

            xSQL.AppendLine("UPDATE SHOPLIFYRESTAURANTTABLE")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("TABLESTATUS = @TABLESTATUS, TABLECHANGEBY = @TABLECHANGEBY, TABLECHANGEDATE = @TABLECHANGEDATE")
            xSQL.AppendLine("WHERE TABLEID = @TABLEID")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@TABLESTATUS", Session("ttTABLESTATUS"))
                cmd.Parameters.AddWithValue("@TABLECHANGEBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@TABLECHANGEDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@TABLEID", Session("ttTABLEID"))

                cmd.ExecuteNonQuery()

                cn.Close()


            End Using

            If Session("ttTABLESTATUS") = "DISABLE" Then
                mp_disable_done.Show()
            Else
                mp_enable_done.Show()
            End If

        Catch ex As Exception
            If Session("ttTABLESTATUS") = "DISABLE" Then
                mp_disable_failed.Show()
            Else
                mp_enablefailed.Show()
            End If
        End Try


    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("ManageTableStatus.aspx")
    End Sub

    Private Sub btnaddnewtable_Click(sender As Object, e As EventArgs) Handles btnaddnewtable.Click
        Response.Redirect("ManageTableAdd.aspx")
    End Sub

    Private Sub btnedittable_Click(sender As Object, e As EventArgs) Handles btnedittable.Click
        Response.Redirect("ManageTableEdit.aspx")
    End Sub

    Private Sub btnenabledisbaletable_Click(sender As Object, e As EventArgs) Handles btnenabledisbaletable.Click
        Response.Redirect("ManageTableStatus.aspx")
    End Sub
End Class
