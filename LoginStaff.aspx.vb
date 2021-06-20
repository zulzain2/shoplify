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


Partial Class LoginStaff
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        TxtPassword.TextMode = TextBoxMode.Password
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

    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString

    End Sub

    Private Sub CheckUser()
        cn.Open()
        Dim UNAME As String = TxtUsername.Text


        Dim querry As String = "SELECT * FROM SHOPLIFYUSER WHERE USERNAME = '" + UNAME + "' "
        cmd.CommandText = querry

        cmd.Connection = cn

        Dim lrd As SqlDataReader = cmd.ExecuteReader()

        If lrd.HasRows = True Then
            While lrd.Read()
                Dim DateCurrent As Date = Date.Now.ToString()


                Session("ssUserLastLogin") = DateCurrent

                If lrd.Item("USERSTATUS") = "DISABLE" Then
                    MyMsgBox("Your account has been locked. Please contact IT PIC")

                ElseIf lrd.Item("USERSTATUS") = "ACTIVE" Then
                    If Encrypt(TxtPassword.Text) = lrd.Item("USERPASSWORD") Then
                        Session("ssUserName") = lrd.Item("USERNAME")
                        Session("ssUserPass") = lrd.Item("USERPASSWORD")
                        Session("ssEmployeeId") = lrd.Item("USEREMPLOYEEID")
                        Session("ssUserEmail") = lrd.Item("USEREMAIL")
                        Session("ssUserStatus") = lrd.Item("USERSTATUS")
                        Session("ssUserFullName") = lrd.Item("USERFULLNAME")

                        Session("ssUserBranch") = lrd.Item("USERBRANCH")
                        Session("ssUserSection") = lrd.Item("USERSECTION")
                        Session("ssUserLevel") = lrd.Item("USERLEVEL")
                        Session("ssUserCreateDate") = lrd.Item("USERCREATEDATE")
                        Session("ssUserDPLink") = lrd.Item("USERPICTURE")
                        Session("tmpOrderNum") = ""

                        If Session("ssUserLevel") = "Administrator" Then
                            Session("ssSuperUser") = "Superadmin"
                        End If

                        Dim ts As TimeSpan = DateCurrent.Subtract(Session("ssUserLastLogin"))
                        If Convert.ToInt32(ts.Days) >= 90 Then
                            ChangeAccStatus()
                            MyMsgBox("You have not logged in for more than 90 days. Login has been disabled")
                        Else
                            UpdateLastLogin()
                            Me.Response.Redirect("Home.aspx")
                        End If
                    ElseIf TxtPassword.Text IsNot lrd.Item("USERPASSWORD") Then
                        MyMsgBox("Wrong password")
                        TxtPassword.Focus()
                    Else
                        MyMsgBox("Error on login. Please enter correct username and password")
                    End If


                End If

            End While

        Else
            MyMsgBox("Account Not Exist")

        End If

    End Sub

    Protected Sub UpdateLastLogin()
        Dim xSQL As New System.Text.StringBuilder
        Dim CONVERTDATE As Date = Date.Now.ToString()
        Session("ssUserLastLogin") = CONVERTDATE

        xSQL.AppendLine("UPDATE SHOPLIFYUSER")
        xSQL.AppendLine("SET")
        xSQL.AppendLine("USERLASTLOGIN = @USERLASTLOGIN ")
        xSQL.AppendLine("WHERE USERNAME = @USERNAME")

        Using cn As New SqlConnection(ConString)
            cn.Open()
            Dim cmd As New SqlCommand(xSQL.ToString, cn)

            cmd.Parameters.AddWithValue("@USERLASTLOGIN", CONVERTDATE)
            cmd.Parameters.AddWithValue("@USERNAME", Session("ssUserName"))

            cmd.ExecuteNonQuery()

            cn.Close()
        End Using

    End Sub

    Protected Sub ChangeAccStatus()
        Dim xSQL As New System.Text.StringBuilder
        Dim USTATUS As String = "DISABLE"
        Dim UNAME As String = TxtUsername.Text

        xSQL.AppendLine("UPDATE SHOPLIFYUSER")
        xSQL.AppendLine("SET")
        xSQL.AppendLine("USERSTATUS = '" + USTATUS + "' ")
        xSQL.AppendLine("WHERE USERNAME = '" + UNAME + "' ")

        Using cn As New SqlConnection(ConString)
            cn.Open()
            Dim cmd As New SqlCommand(xSQL.ToString, cn)

            cmd.ExecuteNonQuery()

            cn.Close()
        End Using

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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        MyCn()
        CheckUser()
    End Sub

End Class
