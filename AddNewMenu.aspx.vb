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
Partial Class AddNewMenu
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

    Protected Sub btnUpdtMenu_Click(sender As Object, e As EventArgs) Handles btnUpdtMenu.Click
        CheckMenu()
    End Sub

    Private Sub CheckMenu()
        Try
            Dim querry As String = "SELECT * FROM SHOPLIFYMENUMASTER WHERE MENUCODE = @MENUCODE"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@MENUCODE", txtMenuCode.Text)
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    Me.lblerrorMenu.Text = "This Menu " & Me.txtMenuCode.Text & " is already register!"

                End While
            Else
                Me.lblerrorMenu.Text = ""
                AddNewMenu1()
            End If

        Catch ex As Exception
            cn.Close()
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

    Private Sub AddNewMenu1()
        Dim CONVERTDATE As Date = Date.Now.ToString()
        Dim datenow As String = Date.Now.ToString("ddMMyyyy")

        Try
            Dim xSQL As New System.Text.StringBuilder
            xSQL.AppendLine("INSERT INTO SHOPLIFYMENUMASTER")
            xSQL.AppendLine("(MENUNAME ,MENUPRICE, MENUCATEGORY , MENUADDDATE, MENUPICTURE, MENUCODE, MENUDETAIL, MENUSTATUS, MENUTYPE, MENUSETTYPE)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@MENUNAME, @MENUPRICE, @MENUCATEGORY , @MENUADDDATE, @MENUPICTURE, @MENUCODE, @MENUDETAIL, @MENUSTATUS, @MENUTYPE, @MENUSETTYPE)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@MENUNAME", Me.txtMenuName.Text.Trim)
                cmd.Parameters.AddWithValue("@MENUPRICE", Me.txtMenuPrice.Text.Trim)
                cmd.Parameters.AddWithValue("@MENUCATEGORY", Me.DropDownList1.SelectedValue)
                cmd.Parameters.AddWithValue("@MENUADDDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@MENUCODE", Me.txtMenuCode.Text.Trim)
                cmd.Parameters.AddWithValue("@MENUDETAIL", Me.txtMenuDetails.Text.Trim)
                cmd.Parameters.AddWithValue("@MENUSTATUS", "ACTIVE")

                cmd.Parameters.AddWithValue("@MENUTYPE", Me.DropDownList3.SelectedValue)
                cmd.Parameters.AddWithValue("@MENUSETTYPE", Me.DropDownList4.SelectedValue)

                Dim ext As String = System.IO.Path.GetExtension(fileMenu.PostedFile.FileName)
                Dim pathme As String = "assets\images\menu\" & txtMenuCode.Text.Trim & "-" & datenow & ext

                Dim path As String = Server.MapPath(".")

                If fileMenu.HasFile Then
                    fileMenu.SaveAs(path & "\assets\images\menu\" & txtMenuCode.Text.Trim & "-" & datenow & ext)
                End If

                cmd.Parameters.AddWithValue("@MENUPICTURE", pathme)

                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

            mp_done_menu.Show()

        Catch ex As Exception
            lbl_errorUname.Text = ex.GetBaseException().ToString()
            mp_errorUname.Show()
        End Try
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddNewMenu.aspx")
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
