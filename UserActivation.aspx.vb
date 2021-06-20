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
Partial Class UserActivation
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

    Private Sub btnaddnewuser_Click(sender As Object, e As EventArgs) Handles btnaddnewuser.Click
        Response.Redirect("AddNewUser.aspx")
    End Sub

    Private Sub btnedituser_Click(sender As Object, e As EventArgs) Handles btnedituser.Click
        Response.Redirect("ManageUser.aspx")
    End Sub

    Private Sub btnenabledisbaleuser_Click(sender As Object, e As EventArgs) Handles btnenabledisbaleuser.Click
        Response.Redirect("UserActivation.aspx")
    End Sub



    Protected Sub manageuserlist_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles manageuserlist.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then



            If e.Row.Cells(5).Text = "DISABLE" Then

                e.Row.Cells(5).Text = "<span class='label label-rounded label-danger'>" & e.Row.Cells(5).Text & "</span>"


            ElseIf e.Row.Cells(5).Text = "ACTIVE" Then

                e.Row.Cells(5).Text = "<span class='label label-rounded label-success'>" & e.Row.Cells(5).Text & "</span>"


            End If

            Dim USERSTATUS As String = DataBinder.Eval(e.Row.DataItem, "USERSTATUS").ToString()

            If USERSTATUS = "DISABLE" Then
                Dim lb As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb.Visible = True
                lb.CssClass = "btn btn-success btn-block"
                lb.Text = "ENABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then
                    Dim group As String = manageuserlist.DataKeys(e.Row.RowIndex).Values(0).ToString()
                End If


            ElseIf USERSTATUS = "ACTIVE" Then
                Dim lb2 As Button = DirectCast(e.Row.Cells(0).Controls(0), Button)
                lb2.Visible = True
                lb2.CssClass = "btn btn-warning btn-block"
                lb2.Text = "DISABLE"

                If e.Row.RowType = DataControlRowType.DataRow Then

                    Dim group As String = manageuserlist.DataKeys(e.Row.RowIndex).Values(0).ToString()


                End If

            End If

        End If
    End Sub

    Protected Sub manageuserlist_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles manageuserlist.RowCommand
        If e.CommandName = "AVAILABILITY" Then
            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Session("ttUSERSTATUS") = manageuserlist.DataKeys(rowIndex).Values(1).ToString()


            If Session("ttUSERSTATUS") = "ACTIVE" Then

                Session("ttUSEREMPLOYEEID") = manageuserlist.DataKeys(rowIndex).Values(0).ToString()
                Session("ttUSERSTATUS") = "DISABLE"
                Session("ttUSERPASS") = Encrypt(Session("ttUSEREMPLOYEEID") + "123")
                mp_confirm_disable.Show()

            Else
                Session("ttUSEREMPLOYEEID") = manageuserlist.DataKeys(rowIndex).Values(0).ToString()
                Session("ttUSERSTATUS") = "ACTIVE"
                Session("ttUSERPASS") = Encrypt(Session("ttUSEREMPLOYEEID") + "123")
                mp_confirmenable.Show()

            End If
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

    Protected Sub updateUserStatus()
        Try
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATE As Date = DateTime.Now.ToString()

            xSQL.AppendLine("UPDATE SHOPLIFYUSER")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("USERSTATUS = @USERSTATUS, USERCHANGEBY = @USERCHANGEBY, USERCHANGEDATE = @USERCHANGEDATE, USERPASSWORD = @USERPASSWORD")
            xSQL.AppendLine("WHERE USEREMPLOYEEID = @USEREMPLOYEEID")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@USERSTATUS", Session("ttUSERSTATUS"))
                cmd.Parameters.AddWithValue("@USERCHANGEBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@USERCHANGEDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@USERPASSWORD", Session("ttUSERPASS"))
                cmd.Parameters.AddWithValue("@USEREMPLOYEEID", Session("ttUSEREMPLOYEEID"))

                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

            If Session("ttUSERSTATUS") = "DISABLE" Then
                mp_disable_done.Show()
            Else
                mp_enable_done.Show()
            End If


        Catch ex As Exception
            If Session("ttUSERSTATUS") = "DISABLE" Then
                mp_disable_failed.Show()
            Else
                mp_enablefailed.Show()
            End If
        End Try


    End Sub

    Private Function Encrypt(clearText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim clearBytes As Byte() = Encoding.Unicode.GetBytes(clearText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
             &H65, &H64, &H76, &H65, &H64, &H65,
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)
                    cs.Write(clearBytes, 0, clearBytes.Length)
                    cs.Close()
                End Using
                clearText = Convert.ToBase64String(ms.ToArray())
            End Using
        End Using
        Return clearText
    End Function

    Protected Sub btnconfirmdisable_Click(sender As Object, e As EventArgs)
        updateUserStatus()
    End Sub

    Protected Sub btnconfirm_enable_Click(sender As Object, e As EventArgs)
        updateUserStatus()
    End Sub

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("UserActivation.aspx")
    End Sub

End Class

