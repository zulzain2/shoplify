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
Partial Class PaymentSuccessfull
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim tablenum As String = Request.QueryString("tablenum").ToString()
        Dim currtablestatus As String = Request.QueryString("currenttablestatus").ToString()
        Dim paymentstatus As String = Request.QueryString("paymentstatus").ToString()


        If tablenum = Session("ordertablenum") And currtablestatus = Session("ordertablestatus") And paymentstatus = "PAID" Then

            Try
                cmd.Parameters.Clear()
                Dim xSQL As New System.Text.StringBuilder

                xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
                xSQL.AppendLine("SET")
                xSQL.AppendLine("PAYMENT = @PAYMENT, PAYMENTTYPE = @PAYMENTTYPE, PAYMENTMADEUSING = @PAYMENTMADEUSING")
                xSQL.AppendLine("WHERE ORDERFINALNUM = @ORDERFINALNUM")

                Using cn As New SqlConnection(ConString)

                    cn.Open()

                    Dim cmd As New SqlCommand(xSQL.ToString, cn)

                    cmd.Parameters.AddWithValue("@PAYMENT", "PAID")
                    cmd.Parameters.AddWithValue("@PAYMENTTYPE", "ONLINE")
                    cmd.Parameters.AddWithValue("@PAYMENTMADEUSING", "PayPal")
                    cmd.Parameters.AddWithValue("@ORDERFINALNUM", Session("orderfinalnum"))


                    cmd.ExecuteNonQuery()

                    cn.Close()
                End Using
            Catch ex As Exception
                MyMsgBox("2nd Try" + ex.GetBaseException().ToString())
            End Try



            Try
                cmd.Parameters.Clear()
                MyCn()
                cn.Open()
                cmd.Connection = cn
                cmd.CommandText = "SELECT PAYMENT FROM SHOPLIFYORDERTOTAL WHERE TABLENUM = @TABLENUM AND CURRENTTABLESTATUS = @CURRENTTABLESTATUS"

                cmd.Parameters.AddWithValue("@TABLENUM", Session("ordertablenum"))
                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")

                Dim lrd As SqlDataReader = cmd.ExecuteReader()
                Dim tablestatus As String = "PAID"
                Dim tablepaymentstatus As String
                Dim paymentvalue(10) As String


                If lrd.HasRows = True Then
                    Dim i As Integer = 0
                    While lrd.Read()
                        paymentvalue(i) = lrd.Item("PAYMENT")

                        i = i + 1

                    End While

                    For x As Integer = 1 To paymentvalue.Length - 1
                        If paymentvalue(x) = "NOT PAID" Then
                            tablepaymentstatus = "CANCEL"
                            Exit For
                        ElseIf paymentvalue(x) = "PAID" Then
                            tablepaymentstatus = "UPDATE"

                        End If
                    Next

                    'If tablepaymentstatus = "UPDATE" Then

                    Try
                            cmd.Parameters.Clear()
                            Dim xSQL As New System.Text.StringBuilder

                            xSQL.AppendLine("UPDATE SHOPLIFYRESTAURANTTABLE")
                            xSQL.AppendLine("SET")
                            xSQL.AppendLine("CURRENTPAYMENTSTATUS = @CURRENTPAYMENTSTATUS")
                            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM")

                            Using cn As New SqlConnection(ConString)

                                cn.Open()

                                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                                cmd.Parameters.AddWithValue("@CURRENTPAYMENTSTATUS", "PAID")
                                cmd.Parameters.AddWithValue("@TABLENUM", Session("ordertablenum"))


                                cmd.ExecuteNonQuery()

                                cn.Close()
                            End Using
                        Catch ex As Exception
                            MyMsgBox("3rd Try" + ex.GetBaseException().ToString())
                        End Try

                    ' End If


                End If

            Catch ex As Exception
                MyMsgBox("rrr Try" + ex.GetBaseException().ToString())
            End Try

            Session("paypalstatus") = "SUCCESS"
        Else

            Session("paypalstatus") = "FAIL"
        End If
    End Sub



    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
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

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Response.Redirect("~/OrderStatusCustomer.aspx?tablenum=" + Request.QueryString("tablenum").ToString() + "&currenttablestatus=" + Request.QueryString("currenttablestatus").ToString())
    End Sub

End Class
