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


Partial Class AddNewUser
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        CheckUser()
    End Sub

    Private Sub CheckUser()
        Try
            Dim querry As String = "SELECT * FROM SHOPLIFYUSER WHERE USEREMPLOYEEID = @USEREMPLOYEEID"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@USEREMPLOYEEID", txtEmpId.Text)
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    Me.lblerrorID.Text = "This Employee with ID " & Me.txtEmpId.Text & " is already register!"

                End While
            Else
                Me.lblerrorID.Text = ""
                AddNewUser()
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

    Private Sub AddNewUser()
        Dim CONVERTDATE As Date = Date.Now.ToString()

        Try

            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("INSERT INTO SHOPLIFYUSER")
            xSQL.AppendLine("(USERNAME ,USERPASSWORD, USEREMAIL , USERSTATUS, USERFULLNAME, USERLASTLOGIN, USERLEVEL,  USERSECTION,   USERCREATEBY,   USERCREATEDATE,  USERBRANCH,  USEREMPLOYEEID,  USERGENDER, USERPICTURE)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@USERNAME, @USERPASSWORD, @USEREMAIL , @USERSTATUS, @USERFULLNAME, @USERLASTLOGIN, @USERLEVEL, @USERSECTION,  @USERCREATEBY , @USERCREATEDATE, @USERBRANCH, @USEREMPLOYEEID, @USERGENDER, @USERPICTURE)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@USERNAME", Me.txtEmpId.Text.Trim)
                cmd.Parameters.AddWithValue("@USERPASSWORD", Encrypt(Me.txtEmpId.Text.Trim & "123"))
                cmd.Parameters.AddWithValue("@USEREMAIL", Me.txtEmail.Text.Trim)
                cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")
                cmd.Parameters.AddWithValue("@USERFULLNAME", Me.txtFullName.Text.Trim)
                cmd.Parameters.AddWithValue("@USERLASTLOGIN", CONVERTDATE)
                cmd.Parameters.AddWithValue("@USERLEVEL", Me.DropDownList3.SelectedValue)
                cmd.Parameters.AddWithValue("@USERSECTION", Me.DropDownList2.SelectedValue)
                cmd.Parameters.AddWithValue("@USERCREATEBY", Session("ssUserFullName"))
                cmd.Parameters.AddWithValue("@USERCREATEDATE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@USERBRANCH", Me.DropDownList1.SelectedValue)
                cmd.Parameters.AddWithValue("@USEREMPLOYEEID", Me.txtEmpId.Text.Trim)
                cmd.Parameters.AddWithValue("@USERGENDER", Me.DropDownList4.SelectedValue)

                If Me.DropDownList4.SelectedValue = "Male" Then
                    cmd.Parameters.AddWithValue("@USERPICTURE", "assets\images\users\defaultman.png")
                ElseIf Me.DropDownList4.SelectedValue = "Female" Then
                    cmd.Parameters.AddWithValue("@USERPICTURE", "assets\images\users\defaultwoman.png")
                End If

                cmd.ExecuteNonQuery()
                cn.Close()
            End Using
            sendEmail()
            mp_adduserdone.Show()
        Catch ex As Exception
            MyMsgBox("User not added")
        End Try
    End Sub

    Private Sub sendEmail()

        Try
            Dim MailServerIP As String = "smtp.gmail.com"
            Dim MailServerPort As String = "587"
            Dim UserEmail As String = Me.txtEmail.Text.Trim
            Dim UserFullName As String = Me.txtFullName.Text.Trim

            Dim mmMessage As New MailMessage()
            Dim ncSMTPDetails As New System.Net.NetworkCredential()
            Dim SMTP As New SmtpClient()
            Dim strSenderEmail As String = "zulwaqarzain96@gmail.com"
            Dim strSender As String = "Shoplify Administrator"
            Dim strSenderPassword As String = "zain262112"
            Dim strRecipientEmail As String = UserEmail
            Dim strRecipient As String = UserFullName

            Dim strSMTPHost As String = MailServerIP
            Dim strSMTPPort As String = MailServerPort

            Dim body As String = Me.PopulateBody("" & txtFullName.Text.Trim & "",
                                    "" & DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") & "",
                                        "http://10.118.4.111/CCS2",
                                "" & txtEmpId.Text.Trim & "",
                                "" & txtEmpId.Text.Trim & "123" & "")

            '-- Build Message
            mmMessage.From = New MailAddress(strSenderEmail, strSender)
            mmMessage.To.Add(New MailAddress(strRecipientEmail, strRecipient))
            mmMessage.IsBodyHtml = True
            mmMessage.Priority = MailPriority.Normal
            mmMessage.Subject = "Calibration Control System: Login Access"
            mmMessage.Body = body
            '-- Define Authenticated User
            ncSMTPDetails.UserName = strSenderEmail
            ncSMTPDetails.Password = strSenderPassword
            '-- Send Message
            SMTP.UseDefaultCredentials = False
            SMTP.Credentials = ncSMTPDetails
            SMTP.Host = strSMTPHost
            SMTP.Port = strSMTPPort
            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network
            SMTP.EnableSsl = True
            SMTP.Send(mmMessage)




        Catch ex As Exception

        End Try


    End Sub

    Private Function PopulateBody(ByVal UserName As String, ByVal title As String, ByVal url As String, ByVal user_id As String, ByVal emp_pass As String) As String
        Dim body As String = String.Empty
        Dim reader As StreamReader = New StreamReader(Server.MapPath("EmailTemplates/EmailTemplate.html"))
        body = reader.ReadToEnd
        body = body.Replace("{UserName}", UserName)
        body = body.Replace("{Title}", title)
        body = body.Replace("{Url1}", url)
        body = body.Replace("{EMP_NO}", user_id)
        body = body.Replace("{EMP_PASS}", emp_pass)
        Return body
    End Function

    Protected Sub btnOK_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddNewUser.aspx")
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

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.Cells(3).Text = "DISABLE" Then

            e.Row.Cells(3).Text = "<span class='label label-rounded label-danger'>" & e.Row.Cells(3).Text & "</span>"


        ElseIf e.Row.Cells(3).Text = "ACTIVE" Then

            e.Row.Cells(3).Text = "<span class='label label-rounded label-success'>" & e.Row.Cells(3).Text & "</span>"


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
End Class
