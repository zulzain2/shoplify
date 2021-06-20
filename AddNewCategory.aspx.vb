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
Partial Class AddNewCategory
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

    Private Sub btnUpdtCategory_Click(sender As Object, e As EventArgs) Handles btnUpdtCategory.Click
        CheckCategory()
    End Sub

    Private Sub CheckCategory()
        Try


            Dim querry As String = "SELECT * FROM SHOPLIFYMENUTYPE WHERE MENUCATEGORYNAME = @MENUCATEGORYNAME"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@MENUCATEGORYNAME", txtCategoryName.Text)
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    Me.lblerrorMenu.Text = "This Menu " & Me.txtCategoryName.Text & " is already register!"

                End While
            Else
                Me.lblerrorMenu.Text = ""
                AddNewMenuCategory()
            End If




        Catch ex As Exception
            cn.Close()
        End Try
    End Sub

    Private Sub AddNewMenuCategory()
        Dim CONVERTDATE As Date = Date.Now.ToString()
        Try

            Dim xSQL As New System.Text.StringBuilder
            xSQL.AppendLine("INSERT INTO SHOPLIFYMENUTYPE")
            xSQL.AppendLine("(MENUCATEGORYNAME, MENUCATEGORYADDBY, MENUCATEGORYADDDATE)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@MENUCATEGORYNAME, @MENUCATEGORYADDBY, @MENUCATEGORYADDDATE)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)



                cmd.Parameters.AddWithValue("@MENUCATEGORYNAME", Me.txtCategoryName.Text.Trim)
                cmd.Parameters.AddWithValue("@MENUCATEGORYADDBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@MENUCATEGORYADDDATE", CONVERTDATE)

                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

            mp_done_category.Show()

        Catch ex As Exception
            lbl_errorCategory.Text = ex.GetBaseException().ToString()
            mp_errorCategory.Show()

        End Try
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddNewCategory.aspx")
    End Sub

    Private Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles GridView1.RowDeleted

        If e.Exception Is Nothing Then

            If e.AffectedRows = 1 Then
                MyMsgBox("Category deleted successfully.")
            Else
                MyMsgBox("An error occurred during the delete operation.")
            End If
        Else
            MyMsgBox("Category cannot be deleted because there is item in this category. Please delete first all item in this category to continue this operation.")
            e.ExceptionHandled = True
        End If





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
