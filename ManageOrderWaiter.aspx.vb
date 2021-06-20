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
Partial Class ManageOrderWaiter
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

        ' With config
        '.AuthSecret = "qouNheeugeH8zlglwzrrBAiGUGsaoIwroLTxiwI6"
        ' .BasePath = "https://shoplifymagicx.firebaseio.com/"
        ' End With

        ' client = New FireSharp.FirebaseClient(config)


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

    Private Sub ListView1_PreRender(sender As Object, e As EventArgs) Handles ListView1.PreRender
        Try
            Dim dli As ListViewItem
            Dim previousOrderNum As String = ""
            Dim currOrderNum As String = ""
            Dim orderstatus As String = ""
            Dim orderid As Integer = 0

            For Each dli In ListView1.Items

                currOrderNum = DirectCast(dli.FindControl("orderNum"), Label).Text
                orderid = DirectCast(dli.FindControl("ORDERIDLabel"), Label).Text

                If currOrderNum = previousOrderNum Then
                    dli.FindControl("orderNum").Visible = False
                    dli.FindControl("ORDERTAKEBYLabel").Visible = False
                    dli.FindControl("ORDERTAKETIMELabel").Visible = False
                    dli.FindControl("FINALORDERSTATUSLabel").Visible = False
                    dli.FindControl("ORDERTABLELabel").Visible = False
                    dli.FindControl("TOTALMENUORDERLabel").Visible = False
                    dli.FindControl("Tablelbl").Visible = False
                    dli.FindControl("Totalqtylbl").Visible = False
                    dli.FindControl("Takebylbl").Visible = False
                    dli.FindControl("hr1").Visible = False
                    dli.FindControl("ordernumttl").Visible = False

                End If



                orderstatus = DirectCast(dli.FindControl("ORDERSTATUSLabel"), Label).Text

                If orderstatus = "PROCESSING" Then


                    dli.FindControl("btnfinishorder").Visible = False

                ElseIf orderstatus = "REJECT" Then

                    dli.FindControl("btnfinishorder").Visible = False

                ElseIf orderstatus = "DELIVERED" Then

                    dli.FindControl("btnfinishorder").Visible = False

                ElseIf orderstatus = "FINISH COOK" Then

                    dli.FindControl("btnfinishorder").Visible = True

                ElseIf orderstatus = "SUBMIT TO KITCHEN" Then

                    dli.FindControl("btnfinishorder").Visible = False


                End If


                Dim finalorderstatus As String = DirectCast(dli.FindControl("FINALORDERSTATUSLabel"), Label).Text

                If finalorderstatus = "PROCESSING" Then

                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold font-16")
                    dli.FindControl("finalstatusspinner").Visible = True

                    If currOrderNum = previousOrderNum Then
                        dli.FindControl("finalstatusspinner").Visible = False
                    End If
                Else
                    dli.FindControl("finalstatusspinner").Visible = False
                End If



                Dim orderstatuseach As String = DirectCast(dli.FindControl("ORDERSTATUSLabel"), Label).Text

                If orderstatuseach = "SUBMIT TO KITCHEN" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-warning font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                ElseIf orderstatuseach = "PROCESSING" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = True

                ElseIf orderstatuseach = "DELIVERED" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-success font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                ElseIf orderstatuseach = "FINISH COOK" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-warning font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                ElseIf orderstatuseach = "REJECT" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                Else
                    dli.FindControl("eachstatusspinner").Visible = False

                End If


                Dim countfinishcook As Integer = 0
                Dim totalmenuorder As Integer = 0


                Try
                    cmd.Parameters.Clear()
                    MyCn()
                    cn.Open()
                    cmd.Connection = cn
                    cmd.CommandText = "SELECT ORDERQUANTITY FROM SHOPLIFYORDER WHERE ORDERSTATUS = @ORDERSTATUS AND ORDERFINALNUMBER = @ORDERFINALNUMBER"

                    cmd.Parameters.AddWithValue("@ORDERSTATUS", "DELIVERED")
                    cmd.Parameters.AddWithValue("@ORDERFINALNUMBER", currOrderNum)

                    Dim lrd4 As SqlDataReader = cmd.ExecuteReader()

                    If lrd4.HasRows = True Then
                        While lrd4.Read()
                            countfinishcook = countfinishcook + lrd4.Item("ORDERQUANTITY")
                        End While
                    End If


                    cn.Close()

                Catch ex As Exception

                    MyMsgBox("11th Try" + ex.GetBaseException().ToString())
                End Try



                Try
                    cmd.Parameters.Clear()
                    MyCn()
                    cn.Open()
                    cmd.Connection = cn
                    cmd.CommandText = "SELECT TOTALMENUORDER FROM SHOPLIFYORDERTOTAL WHERE ORDERFINALNUM = @ORDERFINALNUM"

                    cmd.Parameters.AddWithValue("@ORDERFINALNUM", currOrderNum)

                    Dim lrd As SqlDataReader = cmd.ExecuteReader()

                    If lrd.HasRows = True Then
                        While lrd.Read()
                            totalmenuorder = lrd.Item("TOTALMENUORDER")
                        End While
                    End If

                    cn.Close()
                Catch ex As Exception
                    MyMsgBox("12th Try" + ex.GetBaseException().ToString())
                End Try


                If totalmenuorder = countfinishcook Then
                    Try

                        cmd.Parameters.Clear()
                        Dim xSQL As New System.Text.StringBuilder

                        xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
                        xSQL.AppendLine("SET")
                        xSQL.AppendLine("FINALORDERSTATUS = @FINALORDERSTATUS")
                        xSQL.AppendLine("WHERE ORDERFINALNUM = @ORDERFINALNUM")

                        Using cn As New SqlConnection(ConString)

                            cn.Open()

                            Dim cmd As New SqlCommand(xSQL.ToString, cn)

                            cmd.Parameters.AddWithValue("@FINALORDERSTATUS", "DELIVERED")
                            cmd.Parameters.AddWithValue("@ORDERFINALNUM", currOrderNum)


                            cmd.ExecuteNonQuery()

                            cn.Close()
                        End Using
                    Catch ex As Exception
                        MyMsgBox("13th Try" + ex.GetBaseException().ToString())
                    End Try
                End If



                previousOrderNum = currOrderNum


            Next

        Catch ex As Exception
            MyMsgBox("First Try" + ex.GetBaseException().ToString())
        End Try


    End Sub


    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)

        ListView1.DataBind()
    End Sub

    Private Sub ListView1_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView1.ItemCommand



        'Start Manage Order for Button Finish
        If e.CommandName = "FINISHORDER" Then

            'Start Manage Order for Button Revert
            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Dim OrderID As String = ListView1.DataKeys(itemIndex).Values(0).ToString()
            Dim OrderNum As String = ListView1.DataKeys(itemIndex).Values(1).ToString()

            Try

                cmd.Parameters.Clear()
                Dim xSQL As New System.Text.StringBuilder

                xSQL.AppendLine("UPDATE SHOPLIFYORDER")
                xSQL.AppendLine("SET")
                xSQL.AppendLine("ORDERSTATUS = @ORDERSTATUS")
                xSQL.AppendLine("WHERE ORDERID = @ORDERID AND ORDERFINALNUMBER = @ORDERFINALNUMBER")

                Using cn As New SqlConnection(ConString)

                    cn.Open()

                    Dim cmd As New SqlCommand(xSQL.ToString, cn)

                    cmd.Parameters.AddWithValue("@ORDERSTATUS", "DELIVERED")
                    cmd.Parameters.AddWithValue("@ORDERID", OrderID)
                    cmd.Parameters.AddWithValue("@ORDERFINALNUMBER", OrderNum)

                    cmd.ExecuteNonQuery()

                    cn.Close()
                End Using
            Catch ex As Exception
                MyMsgBox("6th Try" + ex.GetBaseException().ToString())
            End Try

            ListView1.DataBind()

        End If
        'End Manage Order for Button Finish



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