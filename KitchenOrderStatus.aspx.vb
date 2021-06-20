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
Partial Class KitchenOrderStatus
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

    Protected Sub OnDataBound(sender As Object, e As EventArgs)
        For i As Integer = GridView1.Rows.Count - 1 To 1 Step -1
            Dim row As GridViewRow = GridView1.Rows(i)
            Dim previousRow As GridViewRow = GridView1.Rows(i - 1)
            For j As Integer = 0 To row.Cells.Count - 1

                If j <> 1 Then
                    If j <> 2 Then
                        If j <> 3 Then
                            If j <> 4 Then
                                If j <> 5 Then
                                    If j <> 6 Then
                                        If j <> 7 Then
                                            If j <> 8 Then
                                                If j <> 11 Then
                                                    If j <> 12 Then
                                                        If j <> 13 Then
                                                            If j <> 14 Then
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
                                    End If
                                End If
                            End If
                        End If
                    End If
                    End If

            Next
        Next


    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As EventArgs) Handles GridView1.PreRender

        ' Dim DateTimeStart As String = (DateTime.Now.ToString("MM/dd/yyyy 00:00:00.000"))
        ' Dim DateTimeEnd As String = (DateTime.Now.ToString("MM/dd/yyyy 23:59:59.000"))

        Dim DateTimeStart As String = (DateTime.Now.ToString("dd/MM/yyyy 12:00:00 'AM'"))
        Dim DateTimeEnd As String = (DateTime.Now.ToString("dd/MM/yyyy 11:59:59 'PM'"))

        Session("datetimestart") = DateTimeStart
        Session("datetimeend") = DateTimeEnd


        Dim gv As GridView = CType(sender, GridView)
        Dim gvr As GridViewRow = CType(gv.BottomPagerRow, GridViewRow)
        If gvr IsNot Nothing Then
            gvr.Visible = True
        End If
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)


        GridView1.DataBind()
        Label1.Text = "<h4 class='font-weight-bold'>Panel refreshed at: " + DateTime.Now.ToLongTimeString() + " (Panel will be update every 10 seconds) <br /><br /></h4>"

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

