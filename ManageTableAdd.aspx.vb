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
Partial Class ManageTableAdd
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

    Private Sub btnUpdtTable_Click(sender As Object, e As EventArgs) Handles btnUpdtTable.Click
        CheckTable()
    End Sub

    Private Sub CheckTable()
        Try
            Dim querry As String = "SELECT * FROM SHOPLIFYRESTAURANTTABLE WHERE TABLENUM = @TABLENUM"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@TABLENUM", Me.txtTableNum.Text.Trim)
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    Me.lblerrorTable.Text = "This Table " & Me.txtTableNum.Text & " is already register!"
                End While
            Else
                Me.lblerrorTable.Text = ""
                AddNewTable()
            End If


        Catch ex As Exception
            cn.Close()
        End Try
    End Sub

    Private Sub AddNewTable()
        Dim CONVERTDATE As Date = Date.Now.ToString()

        Try
            Dim xSQL As New System.Text.StringBuilder
            xSQL.AppendLine("INSERT INTO SHOPLIFYRESTAURANTTABLE")
            xSQL.AppendLine("(TABLENUM ,TABLESEATNUM , TABLEADDDATE, TABLEADDBY, TABLESTATUS, CURRENTTABLESTATUS)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@TABLENUM, @TABLESEATNUM, @TABLEADDDATE, @TABLEADDDBY, @TABLESTATUS, @CURRENTTABLESTATUS)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@TABLENUM", Me.txtTableNum.Text.Trim)
                cmd.Parameters.AddWithValue("@TABLESEATNUM", Me.txtSeatNum.Text.Trim)
                cmd.Parameters.AddWithValue("@TABLEADDDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@TABLEADDDBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@TABLESTATUS", "ACTIVE")
                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "AVAILABLE")

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
            mp_done_table.Show()

        Catch ex As Exception
            lbl_errorTable.Text = ex.GetBaseException().ToString()
            mp_errorTable.Show()
        End Try
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("ManageTableAdd.aspx")
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
