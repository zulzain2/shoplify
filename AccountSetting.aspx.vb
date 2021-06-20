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

Partial Class AccountSetting
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
    Public datenow As String = Date.Now.ToString("ddMMyyyy")
    Dim picloc As String = ""

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        MyCn()
        CheckLogin()
        GetProfilePictureInfo()


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



    Protected Sub updatepassconfirm_Click(sender As Object, e As EventArgs) Handles updatepassconfirm.Click

        If Session("ssUserPass") <> Encrypt(currentpass.Text.Trim) Then
            lbl_errorpass.Text = "Current password entered didn't match."
            mp_errorpass.Show()

        ElseIf Session("ssUserPass") = Encrypt(currentpass.Text.Trim) Then
            If Session("ssUserPass") = Encrypt(newpass1.Text.Trim) Then
                lbl_errorpass.Text = "The new password entered is the same as old password. Please enter a different password"
                mp_errorpass.Show()
            ElseIf Session("ssUserPass") <> Encrypt(newpass1.Text.Trim) Then
                If Encrypt(newpass1.Text) <> Encrypt(newpass2.Text.Trim) Then
                    lbl_errorpass.Text = "New password entered didn't match. Please retype the new password correctly"
                    mp_errorpass.Show()
                ElseIf Encrypt(newpass1.Text) = Encrypt(newpass2.Text.Trim) Then
                    'start password auditing
                    If System.Text.RegularExpressions.Regex.IsMatch(newpass1.Text, "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{10,}$") Then
                        MyCn()
                        UpdatePassword()
                    Else
                        lbl_errorpass.Text = "New Password must have at least 10 characters, one lowercase, one uppercase and one number."
                        mp_errorpass.Show()
                    End If

                End If
            End If
        End If

    End Sub

    Private Sub UpdatePassword()
        Dim CONVERTDATE As Date = Date.Now.ToString()

        Try
            Dim xsql As New System.Text.StringBuilder
            xsql.AppendLine("UPDATE SHOPLIFYUSER")
            xsql.AppendLine("SET USERPASSWORD = @USERPASSWORD, USERLASTPASSWORDCHANGE = @USERLASTPASSWORDCHANGE")
            xsql.AppendLine("WHERE USEREMPLOYEEID = @USEREMPLOYEEID")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xsql.ToString, cn)
                cmd.Connection = cn
                cmd.Parameters.AddWithValue("@USERPASSWORD", Encrypt(Me.newpass1.Text.Trim))
                cmd.Parameters.AddWithValue("@USERLASTPASSWORDCHANGE", CONVERTDATE)
                cmd.Parameters.AddWithValue("@USEREMPLOYEEID", Session("ssEmployeeId"))
                cmd.ExecuteNonQuery()

                Session("ssUserPass") = Encrypt(Me.newpass1.Text.Trim)
                cn.Close()
                mp_donepass.Show()

            End Using
        Catch ex As Exception
            mp_failedpass.Show()
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

    Private Function Decrypt(cipherText As String) As String
        Dim EncryptionKey As String = "MAKV2SPBNI99212"
        Dim cipherBytes As Byte() = Convert.FromBase64String(cipherText)
        Using encryptor As Aes = Aes.Create()
            Dim pdb As New Rfc2898DeriveBytes(EncryptionKey, New Byte() {&H49, &H76, &H61, &H6E, &H20, &H4D,
             &H65, &H64, &H76, &H65, &H64, &H65,
             &H76})
            encryptor.Key = pdb.GetBytes(32)
            encryptor.IV = pdb.GetBytes(16)
            Using ms As New MemoryStream()
                Using cs As New CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write)
                    cs.Write(cipherBytes, 0, cipherBytes.Length)
                    cs.Close()
                End Using
                cipherText = Encoding.Unicode.GetString(ms.ToArray())
            End Using
        End Using
        Return cipherText
    End Function

    Protected Sub MyMsgBox(ByVal tcMessage As String)
        Dim lcScript As String
        tcMessage = Replace(tcMessage, vbCrLf, "\n")
        tcMessage = Replace(tcMessage, """", "")
        lcScript = "<script language=""javascript"">" &
                   "alert(""" & tcMessage & """);" & vbCrLf &
                   "</script>"
        Page.ClientScript.RegisterStartupScript(GetType(String), "PopUp", lcScript)
    End Sub



    Protected Sub updateUname_Click(sender As Object, e As EventArgs)

        If Session("ssUserName") = txtNewUsername.Text.Trim Then
            lbl_errorUname.Text = "New Username is same as old username. Please enter different username."
            mp_errorUname.Show()

        Else
            CheckUser()
        End If
    End Sub

    Private Sub CheckUser()

        Try
            Dim querry As String = "SELECT USERNAME FROM SHOPLIFYUSER"
            cmd.CommandText = querry
            cmd.Connection = cn
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    If txtNewUsername.Text = lrd.Item("USERNAME") Then
                        lbl_errorUname.Text = "The username " & txtNewUsername.Text & " is already used by other user!"
                        mp_errorUname.Show()
                        Exit Sub
                    End If
                End While


                ChangeUsername()
            End If

        Catch ex As Exception
            cn.Close()
        End Try
    End Sub

    Private Sub ChangeUsername()
        Try
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATE As Date = DateTime.Now.ToString()
            xSQL.AppendLine("UPDATE SHOPLIFYUSER")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("USERNAME = @USERNAME")
            xSQL.AppendLine("WHERE USEREMPLOYEEID = @USEREMPLOYEEID")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@USERNAME", txtNewUsername.Text)
                cmd.Parameters.AddWithValue("@USEREMPLOYEEID", Session("ssEmployeeId"))

                cmd.ExecuteNonQuery()
                cn.Close()

            End Using

            Session("ssUserName") = txtNewUsername.Text

            mp_done_Uname.Show()



        Catch ex As Exception

        End Try


    End Sub
    Protected Sub btnUpdateUName_Click1(sender As Object, e As EventArgs) Handles btnUpdateUName.Click
        mp_confirm.Show()
    End Sub

    Protected Sub btnUpdatePass_Click1(sender As Object, e As EventArgs) Handles btnUpdatePass.Click
        pass_confirm.Show()
    End Sub



    Protected Sub BtnDP_Click1(sender As Object, e As EventArgs) Handles btnDP.Click
        Try
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATE As Date = DateTime.Now.ToString()
            xSQL.AppendLine("UPDATE SHOPLIFYUSER")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("USERPICTURE = @USERPICTURE")
            xSQL.AppendLine("WHERE USERNAME = @USERNAME")

            Using cn As New SqlConnection(ConString)
                cn.Open()
                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                Dim ext As String = System.IO.Path.GetExtension(fileDP.PostedFile.FileName)
                Dim pathme As String = "assets\images\users\" & Session("ssUserName") & "-" & datenow & ext

                Dim path As String = Server.MapPath(".")

                If fileDP.HasFile Then
                    fileDP.SaveAs(path & "\assets\images\users\" & Session("ssUserName") & "-" & datenow & ext)
                End If

                cmd.Parameters.AddWithValue("@USERNAME", Session("ssUserName"))
                cmd.Parameters.AddWithValue("@USERPICTURE", pathme)

                cmd.ExecuteNonQuery()
                cn.Close()

            End Using

            mp_done_dp.Show()
        Catch ex As Exception
            MyMsgBox("Profile Picture failed to be updated.")
        End Try
    End Sub


    Public Sub GetProfilePictureInfo()
        Using cn As New SqlConnection(ConString)
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT USERPICTURE FROM SHOPLIFYUSER WHERE USERNAME = @USERNAME"
            cmd.Parameters.AddWithValue("@USERNAME", Session("ssUserName"))
            Dim lrd As SqlDataReader = cmd.ExecuteReader()
            If lrd.HasRows = True Then
                While lrd.Read()
                    Session("ssUserDPLink") = lrd.Item("USERPICTURE")
                    img_file.ImageUrl = lrd.Item("USERPICTURE")
                    img_file2.ImageUrl = lrd.Item("USERPICTURE")

                End While
            End If
            cn.Close()

        End Using
    End Sub





End Class
