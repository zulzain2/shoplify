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
Partial Class OrderStatusCustomer
    Inherits System.Web.UI.Page
    Public cn As New SqlConnection
    Public cmd As New SqlCommand
    Public da As SqlDataAdapter
    Public dr As SqlDataReader
    Public ds As DataSet = New DataSet
    Public ConString As String = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try



            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT ORDERFINALNUM,ORDERTOTALPRICE,ORDERTAKETIME FROM SHOPLIFYORDERTOTAL WHERE TABLENUM = @TABLENUM AND CURRENTTABLESTATUS = @CURRENTTABLESTATUS"

            cmd.Parameters.AddWithValue("@TABLENUM", Request.QueryString("tablenum"))
            cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", Request.QueryString("currenttablestatus"))

            Dim lrd As SqlDataReader = cmd.ExecuteReader()
            Dim ordertotalprice As Decimal
            Dim orderdate As Date
            Dim orderfinalnum As String

            If lrd.HasRows = True Then
                While lrd.Read()
                    ordertotalprice = lrd.Item("ORDERTOTALPRICE")
                    orderdate = lrd.Item("ORDERTAKETIME")
                    orderfinalnum = lrd.Item("ORDERFINALNUM")
                End While
            End If


            receiptlbl.Text = "#" + orderfinalnum.ToString() + " "

            lblsubtotal.Text = ordertotalprice
            lbltotal.Text = ordertotalprice
            totallblforpaypal.Text = ordertotalprice


            Session("orderfinalnum2") = orderfinalnum
            Session("ordertablenum") = Request.QueryString("tablenum")
            Session("ordertablestatus") = Request.QueryString("currenttablestatus")

            Label5.Text = orderdate.ToString("dd/MM/yyyy")
            Label6.Text = orderdate.ToString("dd/MM/yyyy")
            receiptdate.Text = orderdate.ToString("dd/MM/yyyy")





            cn.Close()


        Catch ex As Exception
            noorder.Style.Value = "display:inline"
            haveorder.Style.Value = "display:none"
        End Try

    End Sub

    Public Sub MyCn()
        If cn.State = Data.ConnectionState.Open Then cn.Close()
        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("dbconn").ConnectionString
    End Sub

    Private Sub ListView1_PreRender(sender As Object, e As EventArgs) Handles ListView1.PreRender
        Try
            Dim orderstatus As String = ""

            Dim dli As ListViewItem

            For Each dli In ListView1.Items

                orderstatus = DirectCast(dli.FindControl("ORDERSTATUSLabel"), Label).Text

                If orderstatus = "SUBMIT TO KITCHEN" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-warning font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                ElseIf orderstatus = "PROCESSING" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = True

                ElseIf orderstatus = "FINISH COOK" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-success font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                ElseIf orderstatus = "DELIVERED" Then
                    Dim myLi As Label = CType(dli.FindControl("ORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-info font-weight-bold font-16")
                    dli.FindControl("eachstatusspinner").Visible = False

                End If

            Next


        Catch ex As Exception

        End Try

    End Sub

    Private Sub ListView2_PreRender(sender As Object, e As EventArgs) Handles ListView2.PreRender
        Try
            Dim orderstatus As String = ""
            Dim paymentstatus As String = ""

            Dim dli As ListViewItem

            For Each dli In ListView2.Items

                orderstatus = DirectCast(dli.FindControl("FINALORDERSTATUSLabel"), Label).Text
                paymentstatus = DirectCast(dli.FindControl("PAYMENTLabel"), Label).Text

                If orderstatus = "SUBMIT TO KITCHEN" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-warning font-weight-bold")
                    dli.FindControl("finalstatusspinner").Visible = False

                ElseIf orderstatus = "PROCESSING" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold")
                    dli.FindControl("finalstatusspinner").Visible = True

                ElseIf orderstatus = "FINISH COOK" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-success font-weight-bold")
                    dli.FindControl("finalstatusspinner").Visible = False

                ElseIf orderstatus = "DELIVERED" Then
                    Dim myLi1 As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi1.Attributes.Add("class", myLi1.Attributes("class").ToString() & "label label-info font-weight-bold")
                    dli.FindControl("finalstatusspinner").Visible = False

                End If

                If paymentstatus = "NOT PAID" Then
                    Dim myLi1 As Label = CType(dli.FindControl("PAYMENTLabel"), Label)
                    myLi1.Attributes.Add("class", myLi1.Attributes("class").ToString() & "label label-danger font-weight-bold")

                    dli.FindControl("tick").Visible = False
                    dli.FindControl("btnViewInvoice").Visible = True
                    dli.FindControl("btnMakePayment").Visible = True
                    dli.FindControl("btnViewReceipt").Visible = False

                    btnviewreceipt.Visible = False
                    receipttitle.Visible = False


                ElseIf paymentstatus = "PAID" Then
                    Dim myLi As Label = CType(dli.FindControl("PAYMENTLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-info font-weight-bold")
                    dli.FindControl("xsymbol").Visible = False
                    dli.FindControl("btnViewInvoice").Visible = False
                    dli.FindControl("btnMakePayment").Visible = False
                    dli.FindControl("btnViewReceipt").Visible = True


                    ''btnmakepayment.Visible = False
                    '' paymentbuttondiv.Visible = False
                    ''btnviewInvoice.Visible = False
                    ''invoicetitle.Visible = False

                End If

            Next


        Catch ex As Exception

        End Try

    End Sub

    Private Sub ListView3_PreRender(sender As Object, e As EventArgs) Handles ListView3.PreRender
        Try

            Dim orderstatus As String = ""

            Dim dli As ListViewItem

            For Each dli In ListView3.Items
                orderstatus = DirectCast(dli.FindControl("FINALORDERSTATUSLabel"), Label).Text

                If orderstatus = "SUBMIT TO KITCHEN" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-warning font-weight-bold")
                    dli.FindControl("orderstatusspinner").Visible = False

                ElseIf orderstatus = "PROCESSING" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-danger font-weight-bold")
                    dli.FindControl("orderstatusspinner").Visible = True

                ElseIf orderstatus = "FINISH COOK" Then
                    Dim myLi As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi.Attributes.Add("class", myLi.Attributes("class").ToString() & "label label-success font-weight-bold")
                    dli.FindControl("orderstatusspinner").Visible = False

                ElseIf orderstatus = "DELIVERED" Then
                    Dim myLi1 As Label = CType(dli.FindControl("FINALORDERSTATUSLabel"), Label)
                    myLi1.Attributes.Add("class", myLi1.Attributes("class").ToString() & "label label-info font-weight-bold")
                    dli.FindControl("orderstatusspinner").Visible = False

                End If


            Next

        Catch ex As Exception

        End Try
    End Sub


    Private Sub btnviewInvoice_Click(sender As Object, e As EventArgs) Handles btnviewInvoice.Click
        mp_viewInvoice.Show()
    End Sub

    Private Sub btnviewreceipt_Click(sender As Object, e As EventArgs) Handles btnviewreceipt.Click
        mp_viewReceipt.Show()
    End Sub

    Private Sub btnmakepayment_Click(sender As Object, e As EventArgs) Handles btnmakepayment.Click
        mp_makepayment.Show()
    End Sub

    Private Sub invmakepaymentbtn_Click(sender As Object, e As EventArgs) Handles invmakepaymentbtn.Click
        mp_makepayment.Show()
    End Sub

    Private Sub btnpayhere_Click(sender As Object, e As EventArgs) Handles btnpayhere.Click
        mp_choosepaymentgateway.Show()
    End Sub

    Private Sub btnpaycounter_Click(sender As Object, e As EventArgs) Handles btnpaycounter.Click
        mp_paycounter.Show()
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)


        ListView1.DataBind()
        ListView2.DataBind()
        GridView1.DataBind()
        ListView3.DataBind()

        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT CURRENTTABLESTATUS, TABLENUM FROM SHOPLIFYRESTAURANTTABLE WHERE TABLENUM = @TABLENUM"

            cmd.Parameters.AddWithValue("@TABLENUM", Session("ordertablenum"))

            Dim lrd4 As SqlDataReader = cmd.ExecuteReader()
            Dim currenttablestatus As String
            Dim tablenum As String

            If lrd4.HasRows = True Then
                While lrd4.Read()
                    currenttablestatus = lrd4.Item("CURRENTTABLESTATUS")
                    tablenum = lrd4.Item("TABLENUM")
                End While

                If currenttablestatus = "AVAILABLE" Then
                    Response.Redirect("~/TakeOrderCustomer.aspx?tablenum=" + tablenum)
                End If

            End If

        Catch ex As Exception
            MyMsgBox("12th Try" + ex.GetBaseException().ToString())
        End Try

    End Sub

    Private Sub btnPaypal_Click(sender As Object, e As ImageClickEventArgs) Handles btnPaypal.Click



        Dim Host As String = HttpContext.Current.Request.Url.Host

        Dim Port As String = HttpContext.Current.Request.Url.Port

        Dim Secure As String = HttpContext.Current.Request.IsSecureConnection

        Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post' name='payOrder' id='payOrder'>")
        Response.Write("<input type='hidden' name='cmd' value='_xclick'>")
        Response.Write("<input type='hidden' name='business' value='zulwaqarzain96-facilitator@gmail.com'>")
        Response.Write("<input type='hidden' name='currency_code' value='MYR'>")
        Response.Write("<input type='hidden' name='item_name' value='payment for order'>")
        Response.Write("<input type='hidden' name='item_number' value='0'>")
        Response.Write("<input type='hidden' name='amount' value='" + Session("ordertotalprice").ToString() + "'>")

        If Secure = "True" Then
            Response.Write("<input type='hidden' name='return' value='https://" + Host + "/PaymentSuccessfull.aspx?tablenum=" + Session("ordertablenum").ToString() + "&currenttablestatus=" + Session("ordertablestatus").ToString() + "&paymentstatus=" + "PAID'>")
        Else
            Response.Write("<input type='hidden' name='return' value='http://" + Host + ":" + Port + "/PaymentSuccessfull.aspx?tablenum=" + Session("ordertablenum").ToString() + "&currenttablestatus=" + Session("ordertablestatus").ToString() + "&paymentstatus=" + "PAID'>")
        End If

        Response.Write("</form>")



        Response.Write("<script type='text/javascript'>")
        Response.Write("document.getElementById('payOrder').submit();")
        Response.Write("</script>")

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

    Private Sub ListView2_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView2.ItemCommand

        If e.CommandName = "VIEWINVOICE" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim orderfinalnumber As String
            Dim eachordertotalprice As Decimal

            orderfinalnumber = ListView2.DataKeys(itemIndex).Values(0).ToString()
            eachordertotalprice = ListView2.DataKeys(itemIndex).Values(1).ToString()

            Try
                cmd.Parameters.Clear()
                MyCn()
                cn.Open()
                cmd.Connection = cn
                cmd.CommandText = "SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYORDERTOTAL.ORDERFINALNUM FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM WHERE ORDERFINALNUM = '" & orderfinalnumber & "'"

                GridView1.DataSource = cmd.ExecuteReader

                GridView1.DataBind()


            Catch ex As Exception
                MyMsgBox("4rd Try" + ex.GetBaseException().ToString())
            End Try

            invoicelbl.Text = "#" + orderfinalnumber + " "

            Label3.Text = eachordertotalprice
            Label4.Text = eachordertotalprice

            UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional
            UpdatePanel2.Update()



            mp_viewInvoice.Show()
        End If


        If e.CommandName = "MAKEPAYMENT" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim orderfinalnumber As String
            Dim ordertablenumber As String
            Dim eachordertotalprice As Decimal

            orderfinalnumber = ListView2.DataKeys(itemIndex).Values(0).ToString()
            eachordertotalprice = ListView2.DataKeys(itemIndex).Values(1).ToString()
            ordertablenumber = ListView2.DataKeys(itemIndex).Values(2).ToString()

            Session("orderfinalnum") = orderfinalnumber
            Session("ordertotalprice") = eachordertotalprice
            Session("ordertablenum") = ordertablenumber

            mp_makepayment.Show()

        End If

        If e.CommandName = "VIEWRECEIPT" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)
            Dim orderfinalnumber As String
            Dim eachordertotalprice As Decimal

            orderfinalnumber = ListView2.DataKeys(itemIndex).Values(0).ToString()
            eachordertotalprice = ListView2.DataKeys(itemIndex).Values(1).ToString()

            Try
                cmd.Parameters.Clear()
                MyCn()
                cn.Open()
                cmd.Connection = cn
                cmd.CommandText = "SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYORDERTOTAL.ORDERFINALNUM FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM WHERE ORDERFINALNUM = '" & orderfinalnumber & "'"

                GridView2.DataSource = cmd.ExecuteReader

                GridView2.DataBind()


            Catch ex As Exception
                MyMsgBox("4rd Try" + ex.GetBaseException().ToString())
            End Try

            receiptlbl.Text = "#" + orderfinalnumber + " "

            lblsubtotal.Text = eachordertotalprice
            lbltotal.Text = eachordertotalprice

            UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional
            UpdatePanel2.Update()


            mp_viewReceipt.Show()
        End If

    End Sub


End Class
