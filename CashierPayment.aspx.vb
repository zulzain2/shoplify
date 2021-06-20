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
Partial Class CashierPayment
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

    Private Sub ListView1_PreRender(sender As Object, e As EventArgs) Handles ListView1.PreRender
        Dim dli As ListViewItem

        Dim currenttablestatus As String = ""
        Dim currentpaymentstatus As String = ""

        For Each dli In ListView1.Items

            currenttablestatus = DirectCast(dli.FindControl("CURRENTTABLESTATUSlbl"), Label).Text

            currentpaymentstatus = DirectCast(dli.FindControl("CURRENTPAYMENTSTATUSlbl"), Label).Text

            If currenttablestatus = "AVAILABLE" Then
                dli.FindControl("imgtableavailable").Visible = True
                dli.FindControl("imgtablenotpaid").Visible = False
                dli.FindControl("imgtabledonepaid").Visible = False

                Dim myLi As Button = CType(dli.FindControl("Button1"), Button)
                myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "btn btn-block btn-lg btn-secondary font-weight-bold")

            ElseIf currenttablestatus = "OCCUPIED" And currentpaymentstatus = "NOT PAID" Then

                dli.FindControl("imgtableavailable").Visible = False
                dli.FindControl("imgtablenotpaid").Visible = True
                dli.FindControl("imgtabledonepaid").Visible = False

                Dim myLi As Button = CType(dli.FindControl("Button1"), Button)
                myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "btn btn-block btn-lg btn-danger font-weight-bold")


            ElseIf currenttablestatus = "OCCUPIED" And currentpaymentstatus = "PAID" Then

                dli.FindControl("imgtableavailable").Visible = False
                    dli.FindControl("imgtablenotpaid").Visible = False
                    dli.FindControl("imgtabledonepaid").Visible = True

                    Dim myLi As Button = CType(dli.FindControl("Button1"), Button)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "btn btn-block btn-lg btn-success font-weight-bold")

            End If



        Next
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

    Private Sub ListView1_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView1.ItemCommand

        If e.CommandName = "VIEWORDER" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim ordernumber As String
            Dim tablenumber As String
            Dim paymentstatus As String


            ordernumber = ListView1.DataKeys(itemIndex).Values(0).ToString()
            tablenumber = ListView1.DataKeys(itemIndex).Values(1).ToString()
            paymentstatus = ListView1.DataKeys(itemIndex).Values(2).ToString()



            Try
                cmd.Parameters.Clear()
                MyCn()
                cn.Open()
                cmd.Connection = cn
                cmd.CommandText = "SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERDESCRIPTION, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYORDERTOTAL.TOTALMENUORDER, SHOPLIFYORDERTOTAL.ORDERTOTALPRICE AS Expr1, SHOPLIFYORDERTOTAL.ORDERFINALNUM, SHOPLIFYORDERTOTAL.TABLENUM, SHOPLIFYORDERTOTAL.PAYMENT FROM SHOPLIFYORDER INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE WHERE SHOPLIFYORDERTOTAL.TABLENUM = '" & tablenumber & "' AND SHOPLIFYORDERTOTAL.CURRENTTABLESTATUS = 'OCCUPIED' "

                GridView1.DataSource = cmd.ExecuteReader




                Session("cashierOrderNum") = ordernumber
                Session("cashiertablenum") = tablenumber


                If paymentstatus = "NOT PAID" Then
                    btnavailabletable.Visible = False
                    btnconfirmpay.Visible = True
                ElseIf paymentstatus = "PAID" Then
                    btnconfirmpay.Visible = False
                    btnavailabletable.Visible = True
                Else
                    btnconfirmpay.Visible = False
                    btnavailabletable.Visible = False
                End If

                GridView1.DataBind()



                For i As Integer = GridView1.Rows.Count - 1 To 1 Step -1
                    Dim row As GridViewRow = GridView1.Rows(i)
                    Dim previousRow As GridViewRow = GridView1.Rows(i - 1)
                    For j As Integer = 0 To row.Cells.Count - 1



                        If j <> 2 Then
                                If j <> 3 Then
                                    If j <> 4 Then
                                    If j <> 5 Then
                                        If j <> 7 Then
                                            If j <> 10 Then


                                                If row.Cells(j).Text = previousRow.Cells(j).Text Then
                                                    If previousRow.Cells(j).RowSpan = 0 Then
                                                        If row.Cells(j).RowSpan = 0 Then
                                                            previousRow.Cells(j).RowSpan += 2
                                                        Else
                                                            previousRow.Cells(j).RowSpan = row.Cells(j).RowSpan + 1
                                                        End If
                                                        row.Cells(j).Visible = False
                                                    End If
                                                End If
                                            End If
                                        End If
                                    End If

                                    End If
                            End If
                        End If

                    Next
                Next


                UpdatePanel1.Update()


                cn.Close()
            Catch ex As Exception
                MyMsgBox("First Try" + ex.GetBaseException().ToString())
            End Try


            UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional
            UpdatePanel2.Update()
            mp_viewInvoice.Show()

        End If

    End Sub

    Private Sub btnconfirmpay_Click(sender As Object, e As EventArgs) Handles btnconfirmpay.Click


        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("PAYMENT = @PAYMENT,PAYMENTTYPE = @PAYMENTTYPE, PAYMENTMADEUSING = @PAYMENTMADEUSING")
            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM AND CURRENTTABLESTATUS = @CURRENTTABLESTATUS")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@PAYMENT", "PAID")
                cmd.Parameters.AddWithValue("@PAYMENTTYPE", "ONSITE")
                cmd.Parameters.AddWithValue("@PAYMENTMADEUSING", "Cash")

                cmd.Parameters.AddWithValue("@TABLENUM", Session("cashiertablenum"))

                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")




                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

        Catch ex As Exception
            MyMsgBox("2nd Try" + ex.GetBaseException().ToString())
        End Try

        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYRESTAURANTTABLE")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("CURRENTTABLESTATUS = @CURRENTTABLESTATUS, CURRENTPAYMENTSTATUS = @CURRENTPAYMENTSTATUS")
            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM")


            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")
                cmd.Parameters.AddWithValue("@CURRENTPAYMENTSTATUS", "PAID")

                cmd.Parameters.AddWithValue("@TABLENUM", Session("cashiertablenum"))


                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

        Catch ex As Exception
            MyMsgBox("3rd Try" + ex.GetBaseException().ToString())
        End Try

        ListView1.DataBind()
        GridView1.DataBind()

    End Sub

    Private Sub btnavailabletable_Click(sender As Object, e As EventArgs) Handles btnavailabletable.Click
        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("CURRENTTABLESTATUS = @CURRENTTABLESTATUS")
            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM AND PAYMENT = @PAYMENT")


            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "AVAILABLE")

                cmd.Parameters.AddWithValue("@PAYMENT", "PAID")

                cmd.Parameters.AddWithValue("@TABLENUM", Session("cashiertablenum"))


                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        Catch ex As Exception
            MyMsgBox("4rd Try" + ex.GetBaseException().ToString())
        End Try

        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYRESTAURANTTABLE")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("CURRENTTABLESTATUS = @CURRENTTABLESTATUS,CURRENTMENUORDER = @CURRENTMENUORDER,CURRENTPAYMENTSTATUS = @CURRENTPAYMENTSTATUS")
            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "AVAILABLE")
                cmd.Parameters.AddWithValue("@CURRENTMENUORDER", DBNull.Value)
                cmd.Parameters.AddWithValue("@CURRENTPAYMENTSTATUS", DBNull.Value)

                cmd.Parameters.AddWithValue("@TABLENUM", Session("cashiertablenum"))


                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        Catch ex As Exception
            MyMsgBox("5th Try" + ex.GetBaseException().ToString())
        End Try

        ListView1.DataBind()
        GridView1.DataBind()
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        ListView1.DataBind()

    End Sub


End Class
