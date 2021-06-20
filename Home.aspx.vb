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

Partial Class Home
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

        Try
            Dim eatherecount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(MENUID) FROM SHOPLIFYMENUMASTER WHERE MENUTYPE = @MENUTYPE"

            cmd.Parameters.AddWithValue("@MENUTYPE", "Eat Here")

            eatherecount = Convert.ToInt32(cmd.ExecuteScalar())

            counteathere.Text = eatherecount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try

            Dim takeawaycount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(MENUID) FROM SHOPLIFYMENUMASTER WHERE MENUTYPE = @MENUTYPE"

            cmd.Parameters.AddWithValue("@MENUTYPE", "Take Away")

            takeawaycount = Convert.ToInt32(cmd.ExecuteScalar())


            counttakeaway.Text = takeawaycount.ToString()

        Catch ex As Exception
            MyMsgBox("2nd Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim tablecount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(TABLEID) FROM SHOPLIFYRESTAURANTTABLE"

            tablecount = Convert.ToInt32(cmd.ExecuteScalar())


            counttable.Text = tablecount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim activetablecount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(TABLEID) FROM SHOPLIFYRESTAURANTTABLE WHERE TABLESTATUS = @TABLESTATUS"

            cmd.Parameters.AddWithValue("@TABLESTATUS", "ACTIVE")

            activetablecount = Convert.ToInt32(cmd.ExecuteScalar())


            countactivetable.Text = activetablecount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim disabletablecount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(TABLEID) FROM SHOPLIFYRESTAURANTTABLE WHERE TABLESTATUS = @TABLESTATUS"

            cmd.Parameters.AddWithValue("@TABLESTATUS", "DISABLE")

            disabletablecount = Convert.ToInt32(cmd.ExecuteScalar())


            countdisabletable.Text = disabletablecount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim totalstaffcount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER"



            totalstaffcount = Convert.ToInt32(cmd.ExecuteScalar())


            counttotalstaff.Text = totalstaffcount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim activestaffcount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERSTATUS = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            activestaffcount = Convert.ToInt32(cmd.ExecuteScalar())


            countactivestaff.Text = activestaffcount.ToString()
            countactivestaff2.Text = activestaffcount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim disablestaffcount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERSTATUS = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERSTATUS", "DISABLE")

            disablestaffcount = Convert.ToInt32(cmd.ExecuteScalar())


            countdisablestaff.Text = disablestaffcount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim activeordercount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(ORDERTOTALID) FROM SHOPLIFYORDERTOTAL WHERE CURRENTTABLESTATUS = @CURRENTTABLESTATUS"

            cmd.Parameters.AddWithValue("@CURRENTTABLESTATUS", "OCCUPIED")


            activeordercount = Convert.ToInt32(cmd.ExecuteScalar())


            countactiveorder.Text = activeordercount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim administratorcount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "Administrator")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            administratorcount = Convert.ToInt32(cmd.ExecuteScalar())


            countadministrator.Text = administratorcount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim generalmanagercount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "General Manager")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            generalmanagercount = Convert.ToInt32(cmd.ExecuteScalar())


            countgeneralmanager.Text = generalmanagercount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim managercount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "Manager")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            managercount = Convert.ToInt32(cmd.ExecuteScalar())


            countmanager.Text = managercount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim chefcount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "Chef")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            chefcount = Convert.ToInt32(cmd.ExecuteScalar())


            countchef.Text = chefcount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim waitercount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "Waiter")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            waitercount = Convert.ToInt32(cmd.ExecuteScalar())


            countwaiter.Text = waitercount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try


        Try
            Dim cashiercount As Integer = 0

            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "SELECT COUNT(USERID) FROM SHOPLIFYUSER WHERE USERLEVEL = @USERLEVEL AND USERSTATUS  = @USERSTATUS"

            cmd.Parameters.AddWithValue("@USERLEVEL", "Waiter")
            cmd.Parameters.AddWithValue("@USERSTATUS", "ACTIVE")

            cashiercount = Convert.ToInt32(cmd.ExecuteScalar())


            countcashier.Text = cashiercount.ToString()

        Catch ex As Exception
            MyMsgBox("1st Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim totalannualsales As Decimal = 0
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "Select ORDERTOTALPRICE From SHOPLIFYORDERTOTAL Where DatePart(Year, ORDERTAKETIME) = DatePart(Year, GETDATE())"

            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    totalannualsales = totalannualsales + lrd.Item("ORDERTOTALPRICE")
                End While
                lblannualsales.Text = "RM" + totalannualsales.ToString()
            Else

            End If

        Catch ex As Exception
            MyMsgBox("12th Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim totalmonthsales As Decimal = 0
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "Select ORDERTOTALPRICE From SHOPLIFYORDERTOTAL Where (DatePart(Month, ORDERTAKETIME) = DatePart(Month, GETDATE()) AND DatePart(Year, ORDERTAKETIME) = DatePart(Year, GETDATE()))"

            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    totalmonthsales = totalmonthsales + lrd.Item("ORDERTOTALPRICE")
                End While
                lblmonthsales.Text = "RM" + totalmonthsales.ToString()
            Else

            End If

        Catch ex As Exception
            MyMsgBox("12th Try" + ex.GetBaseException().ToString())
        End Try

        Try
            Dim totalweeksales As Decimal = 0
            cmd.Parameters.Clear()
            MyCn()
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "Select ORDERTOTALPRICE From SHOPLIFYORDERTOTAL Where (DatePart(Week, ORDERTAKETIME) = DatePart(Week, GETDATE()) AND DatePart(Year, ORDERTAKETIME) = DatePart(Year, GETDATE()))"

            Dim lrd As SqlDataReader = cmd.ExecuteReader()

            If lrd.HasRows = True Then
                While lrd.Read()
                    totalweeksales = totalweeksales + lrd.Item("ORDERTOTALPRICE")
                End While
                lblweeksales.Text = "RM" + totalweeksales.ToString()
            Else

            End If

        Catch ex As Exception
            MyMsgBox("12th Try" + ex.GetBaseException().ToString())
        End Try


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

        Dim tablestatus As String = ""

        For Each dli In ListView1.Items

            tablestatus = DirectCast(dli.FindControl("TABLESTATUSLabel"), Label).Text

            If tablestatus = "AVAILABLE" Then
                dli.FindControl("spntablestatusactive").Visible = True
                dli.FindControl("spntablestatusdisable").Visible = False

            ElseIf tablestatus = "OCCUPIED" Then
                dli.FindControl("spntablestatusactive").Visible = False
                dli.FindControl("spntablestatusdisable").Visible = True

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

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        countactiveorder.DataBind()
        ListView1.DataBind()
    End Sub


End Class
