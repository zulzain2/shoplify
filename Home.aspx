<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
    <link href="assets/plugins/css-chart/css-chart.css" rel="stylesheet">
    <!--c3 CSS -->
    <link href="assets/plugins/c3-master/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="assets/css/pages/dashboard3.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="assets/css/colors/default.css" id="theme" rel="stylesheet">
    <!--This page css - Morris CSS -->
    <link href="assets/plugins/morrisjs/morris.css" rel="stylesheet">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-home"></i> &nbsp Home</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        
                    </ol>
                </div>
              
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

                 <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->


                <!-- ============================================================== -->
                <!-- Stats box -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card bg-success">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div class="m-r-20 align-self-center"><img src="assets/images/icon/income-w.png" alt="Income" /></div>
                                    <div class="align-self-center">
                                        <h4 class="text-white m-t-10 m-b-0" style="padding-bottom:5px;">Total Registered Menu</h4>
                                        <h6 class="m-t-0 text-white">Eat Here - <asp:label ID="counteathere" runat="server" text=""></asp:label></h6>
                                        <h6 class="m-t-0 text-white">Take Away - <asp:label ID="counttakeaway" runat="server" text=""></asp:label></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                      
                    <div class="col-lg-3">
                        <div class="card bg-info">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div class="m-r-20 align-self-center"><img src="assets/images/icon/expense-w.png" alt="Income" /></div>
                                    <div class="align-self-center">

                                        <div class="row">
                                        <div class="col-lg-12">
                                        <h6 class="text-white m-t-10 m-b-0">Total Active Order<span class="spinner-grow text-success" style="width:1rem;height:1rem;" role="status"></span></h6>
                                        </div>
                                          
                                            </div>
                                         <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                       <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick"></asp:Timer> 
                                        <h2 class="m-t-0 text-white"><asp:label ID="countactiveorder" runat="server" text=""></asp:label></h2>
                          </ContentTemplate>
                                             </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                     
                    <div class="col-lg-3">
                        <div class="card bg-primary">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div class="m-r-20 align-self-center"><img src="assets/images/icon/assets-w.png" alt="Income" /></div>
                                    <div class="align-self-center">
                                        <h4 class="text-white m-t-10 m-b-0" style="padding-bottom:5px;">Total Table - <asp:Label ID="counttable" runat="server" Text=""></asp:Label></h4>
                                        <h6 class="m-t-0 text-white">Active - <asp:label ID="countactivetable" runat="server" text=""></asp:label></h6>
                                        <h6 class="m-t-0 text-white">Disable - <asp:label ID="countdisabletable" runat="server" text=""></asp:label></h6>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card bg-danger">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div class="m-r-20 align-self-center"><img src="assets/images/icon/staff-w.png" alt="Income" /></div>
                                    <div class="align-self-center">
                                        <h4 class="text-white m-t-10 m-b-0"  style="padding-bottom:5px;">Total Staff Using System - <asp:Label ID="counttotalstaff" runat="server" Text=""></asp:Label></h4>
                                        <h6 class="m-t-0 text-white">Active - <asp:label ID="countactivestaff" runat="server" text=""></asp:label></h6>
                                        <h6 class="m-t-0 text-white">Disable - <asp:label ID="countdisablestaff" runat="server" text=""></asp:label></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ============================================================== -->
                <!-- Sales overview chart -->
                <!-- ============================================================== -->
    
                <div class="row">
                  
                    <div class="col-lg-9 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div>
                                        <h3 class="card-title m-b-5"><span class="lstick"></span>Sales Overview </h3>
                                    </div>
                                    <div class="ml-auto">
                                       
                                         <select id="drpdwnsalesrange" class="custom-select b-0">
                                            <option value="0">Year</option>
                                            <option value="1">Month</option>
                                            <option value="2">Week</option>
                                           
                                        </select>

                                    </div>
                                </div>
                            </div>
                            <div class="bg-theme stats-bar">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-12 text-center">
                                        <div class="p-20 active">
                                            <h6 class="text-white">Total Annual Sales</h6>
                                           <asp:Label ID="lblannualsales" runat="server" Text="0.00" class="text-white m-b-0 h3"></asp:Label>
                                            
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-6 text-center">
                                        <div class="p-20">
                                            <h6 class="text-white">This Month</h6>
                                            <asp:Label ID="lblmonthsales" runat="server" Text="RM0.00" class="text-white m-b-0 h3"></asp:Label>
                                           
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-6 text-center">
                                        <div class="p-20">
                                            <h6 class="text-white">This Week</h6>
                                            <asp:Label ID="lblweeksales" runat="server" Text="RM0.00" class="text-white m-b-0 h3"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card-body">
                                <div id="sales-overview2" class="p-relative" style="height:330px;" ></div>
                                <div id="sales-overviewmonth" class="p-relative" style="height:330px;display:none" ></div>
                                <div id="sales-overviewweek" class="p-relative" style="height:330px;display:none" ></div>
                            </div>
                            
                        </div>
                    </div>
                   
                      <!-- ============================================================== -->
                    <!-- visit charts-->
                    <!-- ============================================================== -->
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"><span class="lstick"></span>Top Menu Order</h4>
                                
                            </div>
                        </div>
                    </div>

                    
                </div>

                <!-- ============================================================== -->
                <!-- Table Status -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="row">
                                <div class="col-lg-7 col-md-7">
                                    <div class="card-body">
                                        <h3>Table Status <span class="spinner-grow text-success" style="width:1rem;height:1rem;margin-bottom:7px" role="status"></span></h3>
                                        <h6 class="card-subtitle">Table activation can be manage by admin</h6>

                                        <div class="col-lg-12">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server"> 
                       <ContentTemplate>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                           
                                            <EditItemTemplate>
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    TABLESTATUS:
                                                    <asp:TextBox Text='<%# Bind("CURRENTTABLESTATUS") %>' runat="server" ID="TABLESTATUSTextBox" /><br />

                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><br />
                                                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                </td>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <table runat="server" style="">
                                                    <tr>
                                                        <td>No data was returned.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <EmptyItemTemplate>
                                                <td runat="server" />
                                            </EmptyItemTemplate>
                                            <GroupTemplate>
                                                <tr runat="server" id="itemPlaceholderContainer">
                                                    <td runat="server" id="itemPlaceholder"></td>
                                                </tr>
                                            </GroupTemplate>
                                            <InsertItemTemplate>
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    TABLESTATUS:
                                                    <asp:TextBox Text='<%# Bind("CURRENTTABLESTATUS") %>' runat="server" ID="TABLESTATUSTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><br />
                                                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                </td>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                    <span id="spntablestatusactive" runat="server" class="label btn-block label-info" style="padding-top:10px;padding-bottom:5px">
                                                   
                                                    <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="TABLENUMLabel" style="font-size:24px"/><br />
                                                    
                                                    <asp:Label Text='<%# Eval("CURRENTTABLESTATUS") %>' runat="server" ID="TABLESTATUSLabel" /><br />
                                                        
                                                    </span>

                                                    <span id="spntablestatusdisable" runat="server" class="label btn-block label-danger" style="padding-top:10px;padding-bottom:5px">
                                                   
                                                    <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="Label1" style="font-size:24px"/><br />
                                                    
                                                    <asp:Label Text='<%# Eval("CURRENTTABLESTATUS") %>' runat="server" ID="Label2" /><br />
                                                        
                                                    </span>
                                                    <br /><br />
                                               </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                               
                                                                       <div runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">

                                                                           <div class="row">

                                                                           <div runat="server" id="groupPlaceholder">

                                                                           </div>

                                                                           </div>
                                                                       </div>
                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="TABLENUMLabel" /><br />
                                                    TABLESTATUS:
                                                    <asp:Label Text='<%# Eval("CURRENTTABLESTATUS") %>' runat="server" ID="TABLESTATUSLabel" /><br />
                                                </td>
                                            </SelectedItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [TABLENUM], [CURRENTTABLESTATUS] FROM [SHOPLIFYRESTAURANTTABLE]"></asp:SqlDataSource>
                                   </div>
                                            </ContentTemplate>
                                                </asp:UpdatePanel>
                                        </div>
                                </div>
                                <div class="col-lg-5 col-md-5 border-left p-l-0">
                                    <center class="m-t-30 m-b-40 p-t-20 p-b-20">
                                        <font class="display-3"><asp:label ID="countactivestaff2" runat="server" text=""></asp:label></font>
                                        <h6 class="text-muted">Active Users</h6>
                                        <a href="UserList.aspx"><button type="button" class="btn btn-success">View Details</button></a>
                                    </center>
                                    <hr>
                                    <div class="card-body">
                                        <div class="row">
                                            <!-- Column -->
                                            <div class="col-lg-6 col-6 text-center">
                                                <h1 class="font-light">
                                                    <asp:Label ID="countgeneralmanager" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">General Manager</h6>
                                            </div>
                                           
                                            <div class="col-lg-6 col-6 text-center border-left p-l-0">
                                                <h1 class="font-light"> <asp:Label ID="countmanager" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">Manager</h6>
                                            </div>
                                           
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="card-body">
                                        <div class="row">
                                            <!-- Column -->
                                            <div class="col-lg-6 col-6 text-center">
                                                <h1 class="font-light"> <asp:Label ID="countchef" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">Chef</h6>
                                            </div>
                                            
                                            <div class="col-lg-6 col-6 text-center border-left p-l-0">
                                                <h1 class="font-light"> <asp:Label ID="countwaiter" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">Waiter</h6>
                                            </div>
                                            
                                        </div>
                                    </div>
                                     <hr>
                                    <div class="card-body">
                                        <div class="row">
                                            <!-- Column -->
                                            <div class="col-lg-6 col-6 text-center">
                                                <h1 class="font-light"> <asp:Label ID="countcashier" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">Cashier</h6>
                                            </div>
                                            <div class="col-lg-6 col-6 text-center border-left p-l-0">
                                                <h1 class="font-light"> <asp:Label ID="countadministrator" runat="server" Text=""></asp:Label></h1>
                                                <h6 class="text-muted">Administrator</h6>
                                            </div>
                                           
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


               
                    
                
   
                
                
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
               



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

     <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!--sparkline JavaScript -->
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--morris JavaScript -->
    <script src="assets/plugins/chartist-js/dist/chartist.min.js"></script>
    <script src="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 JavaScript -->
    <script src="assets/plugins/d3/d3.min.js"></script>
    <script src="assets/plugins/c3-master/c3.min.js"></script>
    <!-- Chart JS -->
    <script src="assets/js/dashboard3.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

    <!-- Chart JS -->
    <script src="assets/plugins/echarts/echarts-all.js"></script>

    <!-- Flot Charts JavaScript -->
    <script src="assets/plugins/flot/excanvas.js"></script>
    <script src="assets/plugins/flot/jquery.flot.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.js"></script>
    <script src="assets/plugins/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="assets/js/widget-charts.js"></script>

     <script type="text/javascript">
        

         $('select#drpdwnsalesrange').change(function () {
        if ($(this).val() == "0") {

            $("#sales-overview2").show();
            $("#sales-overviewmonth").hide();
            $("#sales-overviewweek").hide();
        }
        if ($(this).val() == "1") {

            $("#sales-overview2").hide();
            $("#sales-overviewmonth").show();
            $("#sales-overviewweek").hide();
        }
        if ($(this).val() == "2") {
            $("#sales-overview2").hide();
            $("#sales-overviewmonth").hide();
            $("#sales-overviewweek").show();
        }
         });
         </script>






     <script type="text/javascript">

        Sys.Application.add_init(appl_init);

        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_endRequest(EndHandler);
        }

         function EndHandler() {
             // This will be called whenever your updatepanel update 
             // It will be trigger after the update updatepanel
             //add your javascript here

             $.getScript('assets/js/dashboard3.js', function () {
                 // script is now loaded and executed.
                 // put your dependent JS here.
             });

         }                                             
    </script>  



</asp:Content>

