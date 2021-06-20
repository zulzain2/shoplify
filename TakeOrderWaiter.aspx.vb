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
Partial Class TakeOrderWaiter

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

        txttotalorderprice.InnerText = "RM " & Session("totalOrderPrice")
        txttotalorderquantity.InnerText = "x " & Session("totalOrderQuantity")

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


    ''Private Sub ListView9_PreRender(sender As Object, e As ListViewItemEventArgs) Handles ListView9.PreRender
    ''Dim dli As ListViewItem

    ''For Each dli In ListView9.Items

    ''Dim innerlistview As ListView = CType(e.Item.FindControl("ListView1"), ListView)

    ''Next

    '' End Sub



    Public Sub LV1Inner_ItemCommand(sender As Object, e As ListViewCommandEventArgs)

        Dim innerlistview As Label = CType(e.Item.FindControl("MENUCODELabel"), Label)
        Dim innerlistviewtext As String = innerlistview.Text

        If e.CommandName = "ADDTOCART" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = innerlistviewtext

            InitializeMainFunction()

            rightsidebar.Attributes.Add("class", "right-sidebar ps ps--theme_default")
        End If

    End Sub



    Private Sub ListView2_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView2.ItemCommand

        If e.CommandName = "ADDTOCART" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView2.DataKeys(itemIndex).Values(1).ToString()

            InitializeMainFunction()

        End If
    End Sub

    Private Sub ListView3_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView3.ItemCommand

        If e.CommandName = "ADDTOCART" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView3.DataKeys(itemIndex).Values(1).ToString()

            InitializeMainFunction()

        End If
    End Sub

    Private Sub ListView6_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView6.ItemCommand

        If e.CommandName = "ADDTOCART" Then

            Dim itemIndex As Integer = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView6.DataKeys(itemIndex).Values(1).ToString()

            InitializeMainFunction()


        End If
    End Sub

    ''START INIATIALIZE MAIN FUNCTION
    Private Sub InitializeMainFunction()
        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn

            If lblOrderNum.Text = "" Then
                cmd.CommandText = "SELECT SHOPLIFYORDERTOTAL.ORDERNUM, SHOPLIFYORDERTOTAL.TABLENUM, SHOPLIFYORDER.ORDERSTATUS FROM SHOPLIFYORDERTOTAL INNER JOIN SHOPLIFYORDER ON SHOPLIFYORDERTOTAL.ORDERNUM = SHOPLIFYORDER.ORDERNUM"

            Else
                cmd.CommandText = "SELECT SHOPLIFYORDERTOTAL.ORDERNUM, SHOPLIFYORDERTOTAL.TABLENUM, SHOPLIFYORDER.ORDERSTATUS FROM SHOPLIFYORDERTOTAL INNER JOIN SHOPLIFYORDER ON SHOPLIFYORDERTOTAL.ORDERNUM = SHOPLIFYORDER.ORDERNUM WHERE ORDERNUM = @ORDERNUM"
                cmd.Parameters.AddWithValue("@ORDERNUM", lblOrderNum.Text)
            End If



            Dim lrd As SqlDataReader = cmd.ExecuteReader

            Dim OrderRunNum As String = "0"
            Dim OrderStatus As String = ""
            Dim OrderTable As String = ""

            If lrd.HasRows = True Then

                While lrd.Read
                    OrderRunNum = lrd.Item("ORDERNUM")
                    OrderStatus = lrd.Item("ORDERSTATUS")
                    OrderTable = lrd.Item("TABLENUM")
                End While

                'orderTableNum = Request.QueryString("tablenum")
                If OrderStatus = "DRAFT" And (OrderTable = DropDownList1.SelectedValue Or OrderTable <> "") Then
                    Session("tmpOrderNum") = OrderRunNum

                ElseIf Session("BtnSubmitOrder") <> "Tekan" Then

                    If OrderRunNum >= 9 And OrderRunNum <= 98 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "00" & OrderRunNum

                    ElseIf OrderRunNum < 9 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "000" & OrderRunNum

                    ElseIf OrderRunNum >= 99 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "0" & OrderRunNum

                    ElseIf OrderRunNum >= 999 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = OrderRunNum
                    End If

                    Session("tmpOrderNum") = OrderRunNum
                End If

                If Session("BtnSubmitOrder") = "Tekan" Then
                    If OrderRunNum >= 9 And OrderRunNum <= 98 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "00" & OrderRunNum

                    ElseIf OrderRunNum < 9 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "000" & OrderRunNum

                    ElseIf OrderRunNum >= 99 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = "0" & OrderRunNum

                    ElseIf OrderRunNum >= 999 Then
                        OrderRunNum = OrderRunNum + 1
                        OrderRunNum = OrderRunNum
                    End If

                    Session("BtnSubmitOrder") = "Belum Tekan"

                    Session("tmpOrderNum") = OrderRunNum
                End If


                lblOrderNum.Text = Session("tmpOrderNum").ToString()

            Else
                'This is for Order Num 0000
                OrderRunNum = 0
                OrderRunNum = OrderRunNum + 1
                OrderRunNum = "000" & OrderRunNum
                Session("tmpOrderNum") = OrderRunNum
                lblOrderNum.Text = Session("tmpOrderNum").ToString()
            End If

            cn.Close()

        Catch ex As Exception


        End Try

        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT ORDERNUM FROM SHOPLIFYORDERTOTAL WHERE ORDERNUM = @ORDERNUM"

            cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum").ToString())

            Dim lrd3 As SqlDataReader = cmd.ExecuteReader()

            If lrd3.HasRows = True Then
                UpdateOrderTotal()
                CalculateTotalOrder()
            Else
                InsertNewOrderTotal()
                UpdateOrderTotal()
                CalculateTotalOrder()
            End If

            cn.Close()
        Catch ex As Exception
            MyMsgBox("Sixth Try" + ex.GetBaseException().ToString())
        End Try
    End Sub
    ''END INIATIALIZE MAIN FUNCTION



    ''START INSERT ORDERNUM TO SHOPLIFYORDERTOTAL PK
    Private Sub InsertNewOrderTotal()

        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATETIME As Date = DateTime.Now.ToString()

            xSQL.AppendLine("INSERT INTO SHOPLIFYORDERTOTAL")
            xSQL.AppendLine("(ORDERNUM,ORDERFINALNUM, FINALORDERSTATUS, TABLENUM)")
            xSQL.AppendLine("VALUES")
            xSQL.AppendLine("(@ORDERNUM,@ORDERFINALNUM, @FINALORDERSTATUS, @TABLENUM)")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)


                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@ORDERFINALNUM", "NOT SUBMIT")
                cmd.Parameters.AddWithValue("@FINALORDERSTATUS", "DRAFT")
                cmd.Parameters.AddWithValue("@TABLENUM", DropDownList1.SelectedValue)

                cmd.ExecuteNonQuery()

                cn.Close()

            End Using

        Catch ex As Exception
            MyMsgBox("Second Try" + ex.GetBaseException().ToString())
        End Try
    End Sub
    ''END INSERT ORDERNUM TO SHOPLIFYORDERTOTAL PK

    Private Sub UpdateOrderTotal()
        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT MENUPRICE FROM SHOPLIFYMENUMASTER WHERE MENUCODE = @MENUCODE"

            cmd.Parameters.AddWithValue("@MENUCODE", Session("tmpMENUCODE"))

            Dim lrd4 As SqlDataReader = cmd.ExecuteReader()

            If lrd4.HasRows = True Then
                While lrd4.Read()
                    Session("SingleOrderTotalPrice") = lrd4.Item("MENUPRICE")
                End While

            Else
                Session("SingleOrderTotalPrice") = "0.00"
            End If

        Catch ex As Exception
            MyMsgBox("12th Try" + ex.GetBaseException().ToString())
        End Try

        'START INSERT ORDERNUM TO SHOPLIFYORDER FK
        Try

            Dim havesamemenu As String = ""
            Dim samemenuquantity As Integer = 0
            Dim samemenupricetotal As Decimal = 0
            Dim samemenupricesingle As Decimal = 0
            Try
                cmd.Parameters.Clear()
                MyCn()
                cn.Open()
                cmd.Connection = cn
                cmd.CommandText = "SELECT ORDERMENUCODE,ORDERQUANTITY,ORDERTOTALPRICE FROM SHOPLIFYORDER WHERE ORDERNUM = @ORDERNUM"

                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))

                Dim lrd As SqlDataReader = cmd.ExecuteReader()

                If lrd.HasRows = True Then
                    While lrd.Read()
                        If Session("tmpMENUCODE") = lrd.Item("ORDERMENUCODE") Then
                            havesamemenu = "yes"
                            samemenuquantity = lrd.Item("ORDERQUANTITY")
                            samemenupricetotal = lrd.Item("ORDERTOTALPRICE")
                            Exit While
                        End If
                    End While
                End If

            Catch ex As Exception
                MyMsgBox("100" + ex.GetBaseException().ToString())
            End Try

            If havesamemenu = "yes" Then
                samemenupricesingle = samemenupricetotal / samemenuquantity
                samemenuquantity = samemenuquantity + 1
                samemenupricetotal = samemenupricesingle * samemenuquantity
                Try
                    cmd.Parameters.Clear()
                    Dim xSQL As New System.Text.StringBuilder

                    xSQL.AppendLine("UPDATE SHOPLIFYORDER")
                    xSQL.AppendLine("SET")
                    xSQL.AppendLine("ORDERQUANTITY = @ORDERQUANTITY, ORDERTOTALPRICE = @ORDERTOTALPRICE")
                    xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM AND ORDERMENUCODE = @ORDERMENUCODE")

                    Using cn As New SqlConnection(ConString)

                        cn.Open()

                        Dim cmd As New SqlCommand(xSQL.ToString, cn)

                        cmd.Parameters.AddWithValue("@ORDERQUANTITY", samemenuquantity)
                        cmd.Parameters.AddWithValue("@ORDERTOTALPRICE", samemenupricetotal)
                        cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                        cmd.Parameters.AddWithValue("@ORDERMENUCODE", Session("tmpMENUCODE"))


                        cmd.ExecuteNonQuery()

                        cn.Close()
                    End Using
                Catch ex As Exception
                    MyMsgBox("101" + ex.GetBaseException().ToString())
                End Try


            Else
                Try
                    cmd.Parameters.Clear()
                    Dim xSQL As New System.Text.StringBuilder
                    Dim CONVERTDATETIME As Date = DateTime.Now.ToString()

                    xSQL.AppendLine("INSERT INTO SHOPLIFYORDER")
                    xSQL.AppendLine("(ORDERMENUCODE ,ORDERNUM, ORDERQUANTITY , ORDERTAKEBY, ORDERTAKETIME, ORDERSTATUS, ORDERTOTALPRICE, ORDERTABLE)")
                    xSQL.AppendLine("VALUES")
                    xSQL.AppendLine("(@ORDERMENUCODE, @ORDERNUM, @ORDERQUANTITY , @ORDERTAKEBY, @ORDERTAKETIME, @ORDERSTATUS, @ORDERTOTALPRICE, @ORDERTABLE)")

                    Using cn As New SqlConnection(ConString)

                        cn.Open()

                        Dim cmd As New SqlCommand(xSQL.ToString, cn)

                        cmd.Parameters.AddWithValue("@ORDERMENUCODE", Session("tmpMENUCODE"))
                        cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                        cmd.Parameters.AddWithValue("@ORDERQUANTITY", 1)
                        cmd.Parameters.AddWithValue("@ORDERTAKEBY", Session("ssUserFullName"))
                        cmd.Parameters.AddWithValue("@ORDERTAKETIME", CONVERTDATETIME)
                        cmd.Parameters.AddWithValue("@ORDERSTATUS", "DRAFT")
                        cmd.Parameters.AddWithValue("@ORDERTOTALPRICE", Session("SingleOrderTotalPrice"))
                        cmd.Parameters.AddWithValue("@ORDERTABLE", DropDownList1.SelectedValue)

                        cmd.ExecuteNonQuery()

                        cn.Close()

                    End Using

                Catch ex As Exception
                    MyMsgBox("Third Try" + ex.GetBaseException().ToString())

                End Try
            End If


        Catch ex As Exception

        End Try

        'END INSERT ORDERNUM TO SHOPLIFYORDER FK

    End Sub

    Private Sub CalculateTotalOrder()

        'START CALCULATE TOTAL ORDER PRICE and QUANTITY
        Try
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYORDER.ORDERQUANTITY FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE WHERE ([ORDERNUM] = @ORDERNUM)"

            cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))

            Dim lrd2 As SqlDataReader = cmd.ExecuteReader()
            Dim totalOrderPrice As Decimal = 0
            Dim totalOrderQuantity As Int32 = 0.00

            If lrd2.HasRows = True Then


                While lrd2.Read()

                    Dim ItemPriceCurr As Decimal = Convert.ToDecimal(lrd2.Item("ORDERTOTALPRICE"))
                    totalOrderPrice = totalOrderPrice + ItemPriceCurr

                    Dim ItemQunatityCurr As Int32 = lrd2.Item("ORDERQUANTITY")
                    totalOrderQuantity = totalOrderQuantity + ItemQunatityCurr

                End While

                Session("totalOrderPrice") = totalOrderPrice
                Session("totalOrderQuantity") = totalOrderQuantity

                txttotalorderprice.InnerText = "RM " & Session("totalOrderPrice")
                txttotalorderquantity.InnerText = "x " & Session("totalOrderQuantity")
                lblordertotal.Text = Session("totalOrderQuantity").ToString()

            Else
                Session("totalOrderPrice") = totalOrderPrice
                Session("totalOrderQuantity") = totalOrderQuantity

                txttotalorderprice.InnerText = "RM " & Session("totalOrderPrice")
                txttotalorderquantity.InnerText = "x " & Session("totalOrderQuantity")
                lblordertotal.Text = Session("totalOrderQuantity").ToString()
            End If


            cn.Close()

        Catch ex As Exception

            MyMsgBox("Fourth Try" + ex.GetBaseException().ToString())
        End Try
        'END CALCULATE TOTAL ORDER PRICE and QUANTITY

        'START INSERT ORDER PRICE
        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("ORDERTOTALPRICE = @ORDERTOTALPRICE, TOTALMENUORDER = @TOTALMENUORDER")
            xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@ORDERTOTALPRICE", Session("totalOrderPrice"))
                cmd.Parameters.AddWithValue("@TOTALMENUORDER", Session("totalOrderQuantity"))
                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))


                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        Catch ex As Exception
            MyMsgBox("Fifth Try" + ex.GetBaseException().ToString())
        End Try
        'END INSERT ORDER PRICE

        ListView7.DataBind()
    End Sub




    Private Sub ListView7_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles ListView7.ItemCommand
        If e.CommandName = "MINUSORDERQUANTITY" Then

            Dim itemIndex As Int16 = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView7.DataKeys(itemIndex).Values(0).ToString()


            Dim SingleOrderQuantityStr As String = ListView7.DataKeys(itemIndex).Values(1).ToString()

            Dim SingleOrderQuantityInt As Integer = Convert.ToInt16(SingleOrderQuantityStr)

            Dim SingleTotalOrderQuantity As Int16 = 0

            If SingleOrderQuantityInt = 1 Then

                SingleTotalOrderQuantity = 1

            ElseIf SingleOrderQuantityInt > 1 Then

                SingleTotalOrderQuantity = SingleOrderQuantityInt - 1

            End If

            Dim SingleOrderPriceStr As String = ListView7.DataKeys(itemIndex).Values(2).ToString()

            Dim SingleOrderPriceDec As Decimal = Convert.ToDecimal(SingleOrderPriceStr)

            Dim SingleTotalOrderPrice As Decimal = 0.00

            SingleTotalOrderPrice = SingleOrderPriceDec * SingleTotalOrderQuantity

            Try
                cmd.Parameters.Clear()
                Dim xSQL As New System.Text.StringBuilder

                xSQL.AppendLine("UPDATE SHOPLIFYORDER")
                xSQL.AppendLine("SET")
                xSQL.AppendLine("ORDERQUANTITY = @ORDERQUANTITY, ORDERTOTALPRICE = @ORDERTOTALPRICE")
                xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM AND ORDERMENUCODE = @ORDERMENUCODE")

                Using cn As New SqlConnection(ConString)

                    cn.Open()

                    Dim cmd As New SqlCommand(xSQL.ToString, cn)

                    cmd.Parameters.AddWithValue("@ORDERQUANTITY", SingleTotalOrderQuantity)
                    cmd.Parameters.AddWithValue("@ORDERTOTALPRICE", SingleTotalOrderPrice)
                    cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                    cmd.Parameters.AddWithValue("@ORDERMENUCODE", Session("tmpMENUCODE"))

                    cmd.ExecuteNonQuery()

                    cn.Close()

                End Using

                CalculateTotalOrder()
                rightsidebar.Attributes.Add("class", "right-sidebar ps ps--theme_default shw-rside ps--active-y")
            Catch ex As Exception
                MyMsgBox("Tenth Try" + ex.GetBaseException().ToString())
            End Try


        ElseIf e.CommandName = "ADDORDERQUANTITY" Then


            Dim itemIndex As Int16 = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView7.DataKeys(itemIndex).Values(0).ToString()

            Dim SingleOrderQuantityStr As String = ListView7.DataKeys(itemIndex).Values(1).ToString()

            Dim SingleOrderQuantityInt As Integer = Convert.ToInt16(SingleOrderQuantityStr)

            Dim SingleTotalOrderQuantity As Int16 = 0

            SingleTotalOrderQuantity = SingleOrderQuantityInt + 1


            Dim SingleOrderPriceStr As String = ListView7.DataKeys(itemIndex).Values(2).ToString()

            Dim SingleOrderPriceDec As Decimal = Convert.ToDecimal(SingleOrderPriceStr)

            Dim SingleTotalOrderPrice As Decimal = 0.00

            SingleTotalOrderPrice = SingleOrderPriceDec * SingleTotalOrderQuantity

            Try
                cmd.Parameters.Clear()
                Dim xSQL As New System.Text.StringBuilder

                xSQL.AppendLine("UPDATE SHOPLIFYORDER")
                xSQL.AppendLine("SET")
                xSQL.AppendLine("ORDERQUANTITY = @ORDERQUANTITY, ORDERTOTALPRICE = @ORDERTOTALPRICE")
                xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM AND ORDERMENUCODE = @ORDERMENUCODE")

                Using cn As New SqlConnection(ConString)

                    cn.Open()

                    Dim cmd As New SqlCommand(xSQL.ToString, cn)

                    cmd.Parameters.AddWithValue("@ORDERQUANTITY", SingleTotalOrderQuantity)
                    cmd.Parameters.AddWithValue("@ORDERTOTALPRICE", SingleTotalOrderPrice)
                    cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                    cmd.Parameters.AddWithValue("@ORDERMENUCODE", Session("tmpMENUCODE"))

                    cmd.ExecuteNonQuery()

                    cn.Close()

                End Using

                CalculateTotalOrder()
                rightsidebar.Attributes.Add("class", "right-sidebar ps ps--theme_default shw-rside ps--active-y")
            Catch ex As Exception
                MyMsgBox("11th Try" + ex.GetBaseException().ToString())
            End Try

        ElseIf e.CommandName = "DELETEORDER" Then

            Dim itemIndex As Int16 = Convert.ToInt32(e.CommandArgument)

            Session("tmpMENUCODE") = ListView7.DataKeys(itemIndex).Values(0).ToString()

            Try
                cmd.Parameters.Clear()
                Dim querry As String = "DELETE FROM SHOPLIFYORDER WHERE ORDERNUM = @ORDERNUM AND ORDERMENUCODE=@ORDERMENUCODE"
                cmd.CommandText = querry
                cmd.Connection = cn

                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@ORDERMENUCODE", Session("tmpMENUCODE"))

                cn.Open()
                Dim lrd As SqlDataReader = cmd.ExecuteReader()

                cn.Close()

                CalculateTotalOrder()


                rightsidebar.Attributes.Add("class", "right-sidebar ps ps--theme_default shw-rside ps--active-y")
            Catch ex As Exception
                MyMsgBox("Error while deleting record on table..." & ex.Message & "Delete Records")
            End Try

        End If

    End Sub



    'Start Button Submit Order
    Private Sub btnSbmtOrder_Click(sender As Object, e As EventArgs) Handles btnSbmtOrder.Click

        If txttotalorderprice.InnerText = "RM 0.00" Or txttotalorderquantity.InnerText = "x 0" Or txttotalorderprice.InnerText = "RM 0" Or lblOrderNum.Text = "" Then

            mp_submitOrderWarning.Show()
        Else

            mp_submitOrderConfirm.Show()

        End If




    End Sub

    Private Sub btnOKsubmitorder_Click(sender As Object, e As EventArgs) Handles btnOKsubmitorder.Click

        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYORDER")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("ORDERSTATUS = @ORDERSTATUS, ORDERTABLE = @ORDERTABLE, ORDERFINALNUMBER = @ORDERFINALNUMBER")
            xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@ORDERSTATUS", "SUBMIT TO KITCHEN")
                cmd.Parameters.AddWithValue("@ORDERTABLE", DropDownList1.SelectedValue)
                cmd.Parameters.AddWithValue("@ORDERFINALNUMBER", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        Catch ex As Exception
            MyMsgBox("Seventh Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim dli As ListViewItem

            For Each dli In ListView7.Items
                cmd.Parameters.Clear()
                Dim xSQL As New System.Text.StringBuilder

                xSQL.AppendLine("UPDATE SHOPLIFYORDER")
                xSQL.AppendLine("SET")
                xSQL.AppendLine("ORDERDESCRIPTION = @ORDERDESCRIPTION")
                xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM AND ORDERMENUCODE = @ORDERMENUCODE")

                Using cn As New SqlConnection(ConString)

                    cn.Open()

                    Dim cmd As New SqlCommand(xSQL.ToString, cn)

                    Dim OrderDescription As String = DirectCast(dli.FindControl("txtOrderDesc"), TextBox).Text

                    Dim OrderMenuCode As String = DirectCast(dli.FindControl("ORDERMENUCODELabel"), Label).Text

                    cmd.Parameters.AddWithValue("@ORDERDESCRIPTION", OrderDescription)
                    cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                    cmd.Parameters.AddWithValue("@ORDERMENUCODE", OrderMenuCode)

                    cmd.ExecuteNonQuery()
                    cn.Close()
                End Using
            Next

        Catch ex As Exception
            MyMsgBox("Eight Try" + ex.GetBaseException().ToString())
        End Try


        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder
            Dim CONVERTDATETIME As Date = DateTime.Now.ToString()

            xSQL.AppendLine("UPDATE SHOPLIFYORDERTOTAL")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("ORDERTAKEBY = @ORDERTAKEBY, ORDERTAKETIME = @ORDERTAKETIME, ORDERFINALNUM = @ORDERFINALNUM, FINALORDERSTATUS = @FINALORDERSTATUS, TOTALMENUREJECT = @TOTALMENUREJECT, TABLENUM = @TABLENUM, PAYMENT = @PAYMENT, CURRENTTABLESTATUS = @CURRENTTABLESTATUS")
            xSQL.AppendLine("WHERE ORDERNUM = @ORDERNUM")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@ORDERTAKEBY", "Customer")
                cmd.Parameters.AddWithValue("@ORDERTAKETIME", CONVERTDATETIME)
                cmd.Parameters.AddWithValue("@ORDERFINALNUM", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@FINALORDERSTATUS", "SUBMIT TO KITCHEN")
                cmd.Parameters.AddWithValue("@TOTALMENUREJECT", 0)
                cmd.Parameters.AddWithValue("@TABLENUM", DropDownList1.SelectedValue)
                cmd.Parameters.AddWithValue("@PAYMENT", "NOT PAID")
                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        Catch ex As Exception
            MyMsgBox("Ninth Try" + ex.GetBaseException().ToString())
        End Try

        Try
            cmd.Parameters.Clear()
            Dim xSQL As New System.Text.StringBuilder

            xSQL.AppendLine("UPDATE SHOPLIFYRESTAURANTTABLE")
            xSQL.AppendLine("SET")
            xSQL.AppendLine("CURRENTTABLESTATUS = @CURRENTTABLESTATUS, CURRENTMENUORDER = @CURRENTMENUORDER, CURRENTPAYMENTSTATUS = @CURRENTPAYMENTSTATUS")
            xSQL.AppendLine("WHERE TABLENUM = @TABLENUM")

            Using cn As New SqlConnection(ConString)

                cn.Open()

                Dim cmd As New SqlCommand(xSQL.ToString, cn)

                cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")
                cmd.Parameters.AddWithValue("@CURRENTMENUORDER", Session("tmpOrderNum"))
                cmd.Parameters.AddWithValue("@CURRENTPAYMENTSTATUS", "NOT PAID")
                cmd.Parameters.AddWithValue("@TABLENUM", DropDownList1.SelectedValue)

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using

        Catch ex As Exception
            MyMsgBox("Tenth Try" + ex.GetBaseException().ToString())
        End Try

        Session("BtnSubmitOrder") = "Tekan"
        Session("totalOrderPrice") = "0.00"
        Session("totalOrderQuantity") = "0"



        mp_submitOrderDone.Show()

    End Sub

    Private Sub btnOKsubmitorderdone_Click(sender As Object, e As EventArgs) Handles btnOKsubmitorderdone.Click

        Dim ordernumstatus As String = Session("tmpOrderNum")
        Session("tmpOrderNum") = ""

        Session("tablenum") = DropDownList1.SelectedValue

        Response.Redirect("TakeOrderWaiter.aspx")

    End Sub
    'End Button Submit Order



    'Start Button Reset Order
    Private Sub btnRstOrder_Click(sender As Object, e As EventArgs) Handles btnRstOrder.Click

        mp_resetOrderDone.Show()

    End Sub

    Private Sub btnOKresetorder_Click(sender As Object, e As EventArgs) Handles btnOKresetorder.Click

        Try
            cmd.Parameters.Clear()
            Dim querry As String = "DELETE FROM SHOPLIFYORDER WHERE ORDERNUM = @ORDERNUM"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            cn.Close()

        Catch ex As Exception
            MyMsgBox("Error while deleting record on table..." & ex.Message & "Delete Records")
        End Try

        Try
            cmd.Parameters.Clear()
            Dim querry As String = "DELETE FROM SHOPLIFYORDERTOTAL WHERE ORDERNUM = @ORDERNUM"
            cmd.CommandText = querry
            cmd.Connection = cn
            cmd.Parameters.AddWithValue("@ORDERNUM", Session("tmpOrderNum"))
            cn.Open()
            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            cn.Close()

        Catch ex As Exception
            MyMsgBox("Error while deleting record on table..." & ex.Message & "Delete Records")
        End Try

        Session("BtnSubmitOrder") = "Tekan"
        Session("totalOrderPrice") = "0.00"
        Session("totalOrderQuantity") = "0"
        txttotalorderprice.InnerText = "RM " & Session("totalOrderPrice")
        txttotalorderquantity.InnerText = "x " & Session("totalOrderQuantity")

        ListView7.DataBind()

        lblordertotal.Text = Session("totalOrderQuantity").ToString()
    End Sub
    'End Button Reset Order




    Protected Sub MyMsgBox(ByVal tcMessage As String)
        Dim lcScript As String
        tcMessage = Replace(tcMessage, vbCrLf, "\n")
        tcMessage = Replace(tcMessage, """", "")
        lcScript = "<script language=""javascript"">" &
                   "alert(""" & tcMessage & """);" & vbCrLf &
                   "</script>"
        Page.ClientScript.RegisterStartupScript(GetType(String), "PopUp", lcScript)
    End Sub

    Private Sub ListView100_PreRender(sender As Object, e As EventArgs) Handles ListView100.PreRender
        Try
            Dim dli As ListViewItem
            Dim previousCategoryName As String = ""
            Dim currCategoryName As String = ""

            For Each dli In ListView100.Items

                currCategoryName = DirectCast(dli.FindControl("MENUCATEGORYLabel"), Label).Text

                If currCategoryName = previousCategoryName Then
                    dli.FindControl("categoryname").Visible = False
                End If

                previousCategoryName = currCategoryName
            Next

        Catch ex As Exception

        End Try
    End Sub

    Private Sub ListView11_PreRender(sender As Object, e As EventArgs) Handles ListView11.PreRender
        Try
            Dim dli As ListViewItem
            Dim previousCategoryName As String = ""
            Dim currCategoryName As String = ""

            For Each dli In ListView11.Items

                currCategoryName = DirectCast(dli.FindControl("MENUCATEGORYLabel"), Label).Text

                If currCategoryName = previousCategoryName Then
                    dli.FindControl("categoryname5").Visible = False
                End If

                previousCategoryName = currCategoryName
            Next

        Catch ex As Exception

        End Try
    End Sub
End Class


