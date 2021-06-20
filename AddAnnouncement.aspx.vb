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
Partial Class AddAnnouncement
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

    Private Sub btnAddAnnouncement_Click(sender As Object, e As EventArgs) Handles btnAddAnnouncement.Click
        AddAnnouncements()
    End Sub

    Private Sub AddAnnouncements()

        Dim CONVERTDATETIME As Date = DateTime.Now.ToString()
        Dim datenow As String = Date.Now.ToString("ddMMyyyy")

        Try
            Dim xSQL As New System.Text.StringBuilder
            xSQL.AppendLine("INSERT INTO SHOPLIFYANNOUNCEMENT")
            xSQL.AppendLine("(ANNOUNCEMENTTITLE ,ANNOUNCEMENTDETAILS, ANNOUNCEMENTIMAGE, ANNOUNCEMENTADDBY, ANNOUNCEMENTADDTIME)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@ANNOUNCEMENTTITLE, @ANNOUNCEMENTDETAILS, @ANNOUNCEMENTIMAGE, @ANNOUNCEMENTADDBY, @ANNOUNCEMENTADDTIME)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@ANNOUNCEMENTTITLE", Me.txtannouncementtitle.Text.Trim)
                cmd.Parameters.AddWithValue("@ANNOUNCEMENTDETAILS", Me.txtannouncementdetail.Text.Trim)
                cmd.Parameters.AddWithValue("@ANNOUNCEMENTADDBY", Session("ssUserFullName").ToString())
                cmd.Parameters.AddWithValue("@ANNOUNCEMENTADDTIME", CONVERTDATETIME)

                Dim ext As String = System.IO.Path.GetExtension(fileAnnouncement.PostedFile.FileName)
                Dim pathme As String = "assets\images\announcement\" & txtannouncementtitle.Text.Trim & "-" & datenow & ext

                Dim path As String = Server.MapPath(".")

                If fileAnnouncement.HasFile Then
                    fileAnnouncement.SaveAs(path & "\assets\images\announcement\" & txtannouncementtitle.Text.Trim & "-" & datenow & ext)
                End If

                cmd.Parameters.AddWithValue("@ANNOUNCEMENTIMAGE", pathme)

                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

            mp_done_announcement.Show()

        Catch ex As Exception
            MyMsgBox("First Try" + ex.GetBaseException().ToString())
        End Try
    End Sub

    Public Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Response.Redirect("AddAnnouncement.aspx")
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
