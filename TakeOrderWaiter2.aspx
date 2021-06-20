<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="TakeOrderWaiter2.aspx.vb" Inherits="TakeOrderWaiter2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <!--c3 CSS -->
    <link href="assets/plugins/c3-master/c3.min.css" rel="stylesheet">
    <!--Toaster Popup message CSS -->
    <link href="assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="assets/css/pages/dashboard1.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->

    <style>
        .modal-backdrop {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 1040;
            background-color: #000;
            filter: alpha(opacity=60) !important;
            opacity: 0.7 !important;
        }
    </style>

        <style>
.zoom {
  padding: 0px;
  background-color: dimgrey;
  transition: transform .2s; /* Animation */
  width: 200px;
  height: 200px;
  margin: 0 auto;
}

.zoom:hover {
  transform: scale(1.3); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>


    <link href="assets/css/colors/default.css" id="theme" rel="stylesheet">

   
</asp:Content>

  
                                                          

 <asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                       <ContentTemplate>  
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Take Order</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Waiter</li>
                        <li class="breadcrumb-item">Manage Order</li>
                        <li class="breadcrumb-item font-bold"> Take Order</li>
                    </ol>
                </div>
              
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
             <!-- Row -->

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <div class="row">
                                        <div class="col-6">
                                        <h3 class="m-b-0 text-white">Take Order</h3>
                                            </div>
                                        <div class="col-6">
                                        <h4  class="pull-right text-right"><button type="button" id="showorder" runat="server" class="pull-right text-right btn btn-secondary btn-circle"><i class="mdi mdi-cart-outline"></i></button></h4>
                                        </div>
                                           </div>
                                    </div>
                                    <div class="card-body" style="padding:0px">
                                        

                                
            <!-- ============================================================== -->
            <!-- Start Tab Content For Eat Here & Take Away-->
            <!-- ============================================================== -->
                                <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li class="nav-item"> <a class="nav-link font-weight-bold active" data-toggle="tab" href="#eathere" role="tab">Eat Here</a> </li>
                                    <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#takeaway" role="tab">Take Away</a> </li>
                                   
                                </ul>
                                <!-- Tab panes -->

                                <div class="tab-content tabcontent-border">

            <!-- ============================================================== -->
            <!-- Start Eat Here Tab -->
            <!-- ============================================================== -->
                                    <div class="tab-pane active" id="eathere" role="tabpanel">
                                        <div class="p-20" style="padding:0px">
                                             
                                                    <ul class="nav nav-tabs nav-justified" role="tablist">
                                                         <li class="nav-item"> <a class="nav-link font-weight-bold active" data-toggle="tab" href="#alacart4eathere" role="tab">Ala Carte</a> </li>
                                                         <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#set4eathere" role="tab">Set</a> </li>
                                                         <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#combo4eathere" role="tab">Combo</a> </li>
                                                    </ul>
                                            
                                            <div class="tab-content tabcontent-border">

                                                <!-- Start Eat Here Ala Carte -->
                                                <div class="tab-pane active" id="alacart4eathere" role="tabpanel">
                                                    <div class="p-20" style="padding:0px">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               
                                                               <br />
                                                               <!-- -->
                                                               <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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

                                                                   <ItemTemplate>
                                                                       
                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                           

                                                                           
                                           

                                                                           
                                                                           <asp:ImageButton ID="ImageButton2" runat="server" class="zoom" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />
                                                                              

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                           <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />
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
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               <!-- -->

                                                               </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <!-- End Eat Here Ala Carte -->
                                           
                                                <!-- Start Eat Here Set -->
                                                <div class="tab-pane p-20" id="set4eathere" role="tabpanel">
                                                   
                                                    <div class="row">
                                                           <div class="col-lg-12">
                                                               
                                                              <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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

                                                                   <ItemTemplate>

                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                         

                                                                           <asp:ImageButton ID="ImageButton2" class="zoom" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                           <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />

                                                                       </div>

                                                                   </ItemTemplate>

                                                                   <LayoutTemplate>

                                                                       <div class="row" runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div runat="server" id="groupPlaceholder">
                                                                           </div>
                                                                       </div>

                                                                   </LayoutTemplate>

                                                                   <SelectedItemTemplate>
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>                                                                                                              
                                                                <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               </div>
                                                            </div>


                                                </div>
                                                <!-- End Eat Here Set -->

                                                <!-- Start Eat Here Combo -->
                                                <div class="tab-pane p-20" id="combo4eathere" role="tabpanel"> 
                                                    
                                                     <div class="row">
                                                           <div class="col-lg-12">
                                                               
                                                              <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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
                                                                 
                                                                   <ItemTemplate>

                                                                       
                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                           
                                                                          

                                                                           <asp:ImageButton ID="ImageButton2" class="zoom" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                           <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />
                                                                             
                                                                       </div>
                                                                      

                                                                   </ItemTemplate>

                                                                   <LayoutTemplate>

                                                                       
                                                                       <div class="row" runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">
                                                                        
                                                                           <div runat="server" id="groupPlaceholder">
                                                                           </div>
                                                                         
                                                                       </div>
                                                                       

                                                                   </LayoutTemplate>

                                                                   <SelectedItemTemplate>
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Combo" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               </div>
                                                            </div>


                                                </div>
                                                <!-- End Eat Here Combo -->

                                            </div>

                                             
                                        </div>
                                    </div>
            <!-- ============================================================== -->
            <!-- End Eat Here Tab -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- Start Take Away Tab -->
            <!-- ============================================================== -->
                                    <div class="tab-pane p-20" id="takeaway" role="tabpanel" style="padding:0px">
                                       <div class="p-20" style="padding:0px">

                                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                                 <li class="nav-item"> <a class="nav-link font-weight-bold active" data-toggle="tab" href="#alacart4takeaway" role="tab">Ala Carte</a> </li>
                                                 <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#set4takeaway" role="tab">Set</a> </li>
                                                 <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#combo4takeaway" role="tab">Combo</a> </li>
                                            </ul>
                                            
                                            <div class="tab-content tabcontent-border">
                                                <!-- Start Eat Here Ala Carte -->
                                                <div class="tab-pane active" id="alacart4takeaway" role="tabpanel">
                                                    <div class="p-20" style="padding:0px">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               <br />
                                                               <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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

                                                                   <ItemTemplate>

                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                           

                                                                           <asp:ImageButton ID="ImageButton2" class="zoom" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                          <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />

                                                                       </div>

                                                                   </ItemTemplate>

                                                                   <LayoutTemplate>

                                                                       <div class="row" runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div runat="server" id="groupPlaceholder">
                                                                           </div>
                                                                       </div>

                                                                   </LayoutTemplate>

                                                                   <SelectedItemTemplate>
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Take Away" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <!-- End Eat Here Ala Carte -->

                                                <!-- Start Eat Here Set -->
                                                <div class="tab-pane p-20" id="set4takeaway" role="tabpanel">
                                                    
                                                    <div class="row">
                                                           <div class="col-lg-12">
                                                               
                                                               <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource5" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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

                                                                   <ItemTemplate>

                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                         

                                                                           <asp:ImageButton ID="ImageButton2" runat="server" class="zoom" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                           <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />

                                                                       </div>

                                                                   </ItemTemplate>

                                                                   <LayoutTemplate>

                                                                       <div class="row" runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div runat="server" id="groupPlaceholder">
                                                                           </div>
                                                                       </div>

                                                                   </LayoutTemplate>

                                                                   <SelectedItemTemplate>
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               </div>
                                                            </div>

                                                </div>
                                                <!-- End Eat Here Set -->

                                                <!-- Start Eat Here Combo -->
                                                <div class="tab-pane p-20" id="combo4takeaway" role="tabpanel"> 
                                                    
                                                     <div class="row">
                                                           <div class="col-lg-12">
                                                               
                                                               <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource6" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE">

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

                                                                   <ItemTemplate>

                                                                       <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                                          

                                                                           <asp:ImageButton ID="ImageButton2" runat="server" class="zoom" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />

                                                                           <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />

                                                                           <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>

                                                                          <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />

                                                                           <br />

                                                                       </div>

                                                                   </ItemTemplate>

                                                                   <LayoutTemplate>

                                                                       <div class="row" runat="server" id="groupPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div runat="server" id="groupPlaceholder">
                                                                           </div>
                                                                       </div>

                                                                   </LayoutTemplate>

                                                                   <SelectedItemTemplate>
                                                                       <td runat="server" style="">MENUNAME:
                                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                                    <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                                       </td>
                                                                   </SelectedItemTemplate>
                                                               </asp:ListView>

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                <asp:Parameter DefaultValue="Combo" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                               </div>
                                                            </div>


                                                </div>
                                                <!-- End Eat Here Combo -->
                                            </div>


                                        </div>
                                    </div>
            <!-- ============================================================== -->
            <!-- End Take Away Tab -->
            <!-- ============================================================== -->


                                    
                                </div>
            <!-- ============================================================== -->
            <!-- End Tab Content For Eat Here & Take Away-->
            <!-- ============================================================== -->
                                        </div>
                                    </div>
                                </div>
                            </div>
    
                           
  

                <!-- ============================================================== -->
                <!-- Right panel -->
                <!-- ============================================================== -->
                           
  
                <aside class="right-side-panel" id="rspshow" style="display:inline" runat="server">
                    <div class="row">
                         <div class="col-md-12 m-t-10">
                             <div class="row">
                                 <div class="col-lg-12">
                            <h3><i class="fas fa-shopping-cart"></i>  Order Cart
                             <button type="button" id="hideorder" class="pull-right text-right btn btn-secondary btn-circle" runat="server"><i class="mdi mdi-eye-outline-off"></i></button></h3> 
                                 </div></div>
                             <div class="row">
                                 <div class="col-md-12">
                                            <p class="font-weight-bold">Order Num : <asp:Label ID="lblOrderNum" runat="server" Text=""></asp:Label> </p> 
                                     
                                            </div>
                                 </div>
                             <div class="row">

                                        
                                            <div class="card" style="border-radius: 15px;">
                                                <div class="card-body">
                                            <div class="col-md-12">
                                            <label class="font-weight-bold">Table Number <span style="color: red">*</span></label>
                                            </div>
                                                

                                            <div class="col-md-12">
                                                
                                                

                                                  <asp:DropDownList ID="DropDownList1" runat="server" class="form-control custom-select"
                                                        DataSourceID="SqlDataSource7" 
                                                        DataTextField="TABLENUM" 
                                                        DataValueField="TABLENUM"
                                                        AppendDataBoundItems="True"
                                                        >
                                                       
                                                    </asp:DropDownList> 


                                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [TABLENUM] FROM [SHOPLIFYRESTAURANTTABLE] WHERE (([TABLESTATUS] = @TABLESTATUS))">

                                                    <SelectParameters>
                                                       
                                                        <asp:Parameter DefaultValue="ACTIVE" Name="TABLESTATUS" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="DropDownList1" ValidationGroup="SubmitOrder" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                  
                                            </div>
                                                    </div>
                                                </div>
                                        
                             
                             </div>

                              <div class="row">
                                
                                      <div class="col-md-12">
                                          <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource8" DataKeyNames="ORDERMENUCODE,ORDERQUANTITY,MENUPRICE">
                                              
                                              <EditItemTemplate>
                                                  <span style="">
                                                      ORDERMENUCODE:
                                                      <asp:TextBox Text='<%# Bind("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODETextBox" /><br />
                                                      ORDERNUM:
                                                      <asp:TextBox Text='<%# Bind("ORDERNUM") %>' runat="server" ID="ORDERNUMTextBox" /><br />
                                                      MENUNAME:
                                                      <asp:TextBox Text='<%# Bind("MENUNAME") %>' runat="server" ID="MENUNAMETextBox" /><br />
                                                      MENUPRICE:
                                                      <asp:TextBox Text='<%# Bind("MENUPRICE") %>' runat="server" ID="MENUPRICETextBox" /><br />
                                                      MENUTOTALPRICE:
                                                      <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="TextBox1" /><br />
                                                      MENUTYPE:
                                                      <asp:TextBox Text='<%# Bind("MENUTYPE") %>' runat="server" ID="MENUTYPETextBox" /><br />
                                                      MENUSETTYPE:
                                                      <asp:TextBox Text='<%# Bind("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPETextBox" /><br />
                                                      <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                      <br />
                                                  </span>
                                              </EditItemTemplate>
                                              <EmptyDataTemplate>
                                                  <span>No Menu Selected Yet.</span>
                                              </EmptyDataTemplate>
                                              <InsertItemTemplate>
                                                  <span style="">
                                                      ORDERMENUCODE:
                                                      <asp:TextBox Text='<%# Bind("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODETextBox" /><br />
                                                      ORDERNUM:
                                                      <asp:TextBox Text='<%# Bind("ORDERNUM") %>' runat="server" ID="ORDERNUMTextBox" /><br />
                                                      MENUNAME:
                                                      <asp:TextBox Text='<%# Bind("MENUNAME") %>' runat="server" ID="MENUNAMETextBox" /><br />
                                                      MENUPRICE:
                                                      <asp:TextBox Text='<%# Bind("MENUPRICE") %>' runat="server" ID="MENUPRICETextBox" /><br />
                                                      MENUTOTALPRICE:
                                                      <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="TextBox1" /><br />
                                                      MENUTYPE:
                                                      <asp:TextBox Text='<%# Bind("MENUTYPE") %>' runat="server" ID="MENUTYPETextBox" /><br />
                                                      MENUSETTYPE:
                                                      <asp:TextBox Text='<%# Bind("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPETextBox" /><br />
                                                      <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                      <br />
                                                  </span>
                                              </InsertItemTemplate>


                                              <ItemTemplate>
                                                  <span style="">

                                                      <div class="row">
                                                          <div class="col-md-12">
                                                          <asp:Label Text='<%# Eval("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODELabel" class="font-weight-bold" />&nbsp
                                                          <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold"/> 
                                                              <label style="color: #f57224;">(RM </label><asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="Label1" style="color: #f57224;"/><label style="color: #f57224;">)</label>
                                                          </div>
                                                          
                                                                
                                                          
                                                      </div>

                                                      <div class="row">
                                                          <div class="col-md-5 font-weight-bold" style="color: #f57224;">
                                                                RM <asp:Label Text='<%# Eval("ORDERTOTALPRICE") %>' runat="server" ID="TextBox1" /><br />
                                                          </div>
                                                          <div class="col-md-7 text-right" style="padding-left:  0px;">

                                                              <!-- Minus Order -->
                                                              <asp:Button ID="Button1" runat="server" Text="-" CommandName="MINUSORDERQUANTITY" CommandArgument='<%# Container.DataItemIndex %>' class="btn btn-info btn-sm font-weight-bold" Font-Size="Large" style="font-size:Large;padding-top: 0px;padding-bottom: 0px;"/>
                                                                
                                                              <!-- Order Quantity -->
                                                                <asp:Label Text='<%# Eval("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYLabel" class="font-weight-bold"/>  
                                                              <!-- Add Order -->
                                                              <asp:Button ID="Button2" runat="server" Text="+" CommandName="ADDORDERQUANTITY" CommandArgument='<%# Container.DataItemIndex %>' class="btn btn-info btn-sm font-weight-bold" Font-Size="Medium" style="font-size:Large;padding-top: 0px;padding-bottom: 0px;"/>
                                                                

                                                              <!-- Delete Order -->
                                                                &nbsp <asp:Button ID="Button4" runat="server" Text="D" CommandName="DELETEORDER" CommandArgument='<%# Container.DataItemIndex %>' class="btn btn-danger btn-sm font-weight-bold" Font-Size="Medium" style="font-size:Large;padding-top: 0px;padding-bottom: 0px;"/>
                                                              <!-- <button ID="Button3" runat="server" Text="" class="btn btn-outline-secondary btn-sm" ><i class="fas fa-trash-alt fa-2x" style="color:red"></i></button> -->

                                                          </div>   
                                                      </div>

                                                      

                                                      <div class="row">
                                                          <div class="col-md-6">
                                                                <asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel" />
                                                          </div>
                                                          <div class="col-md-6 ">
                                                                 <asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" />
                                                          </div>
                                                      </div>

                                                      <div class="row">
                                                          <div class="col-md-12">
                                                              <asp:textbox ID="txtOrderDesc" runat="server" class="form-control" placeholder="Remarks(If Any)"></asp:textbox>
                                                          </div>
                                                      </div>
                                                      <br />

                                                  </span>
                                              </ItemTemplate>


                                              <LayoutTemplate>
                                                  <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                                                  <div style="">
                                                  </div>
                                              </LayoutTemplate>
                                              <SelectedItemTemplate>
                                                  <span style="">
                                                      ORDERMENUCODE:
                                                      <asp:Label Text='<%# Eval("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODELabel" /><br />
                                                      ORDERNUM:
                                                      <asp:Label Text='<%# Eval("ORDERNUM") %>' runat="server" ID="ORDERNUMLabel" /><br />
                                                      MENUNAME:
                                                      <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                      MENUPRICE:
                                                      <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                      MENUTYPE:
                                                      <asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel" /><br />
                                                      MENUSETTYPE:
                                                      <asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" /><br />
                                                      <br />
                                                  </span>
                                              </SelectedItemTemplate>
                                          </asp:ListView>

                                          <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYMENUMASTER.MENUTYPE, SHOPLIFYMENUMASTER.MENUSETTYPE, SHOPLIFYORDER.ORDERNUM FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE WHERE ([ORDERNUM] = @ORDERNUM)">
                                              <SelectParameters>
                                                  <asp:SessionParameter SessionField="tmpOrderNum" Name="ORDERNUM" Type="Int32"></asp:SessionParameter>
                                              </SelectParameters>
                                          </asp:SqlDataSource>

                                          <div class="row">
                                            <div class="col-md-12">
                                                <h4 class="font-weight-bold">Total</h4>
                                            </div>
                                              </div>

                                           <div class="row">
                                             <div class="col-md-6">
                                                <h5>Quantity</h5>
                                            </div>
                                            <div class="col-md-6">
                                                <h4 id="txttotalorderquantity" runat="server" class="control-label text-right font-weight-bold"></h4>
                                            </div>
                                         </div>

                                          <div class="row">
                                              <div class="col-md-6">
                                                <h5>Price</h5>
                                            </div>
                                            <div class="col-md-6">
                                                <h3 id="txttotalorderprice" runat="server" class="control-label text-right font-weight-bold" style="color: #f57224;"></h3>
                                            </div>
                                         </div>
                            
                                     </div>
                                 
                              </div>

                             
                                

                              <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnSbmtOrder" runat="server" ValidationGroup="SubmitOrder" Text="Submit Order" class="btn btn-danger btn-lg btn-block" style="font-size: medium;"/> 
                                            
                                        </div>
                                    </div>
                                </div>

                             <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnRstOrder" runat="server" Text="Reset Order" class="btn btn-info btn-lg btn-block" style="font-size: medium;"/> 
                                            
                                        </div>
                                    </div>
                                </div>
                             
                             
                         </div>  
                    </div>
                </aside>
      
                <!-- ============================================================== -->
                <!-- End Right panel -->
                <!-- ============================================================== -->
    
    

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_resetOrderDone" runat="server" PopupControlID="pnlresetorderdone" TargetControlID="LinkButton1" CancelControlID="ButtonClose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlresetorderdone" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">

        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Reset Order</h4>
            </div>
            <div class="modal-body">
                <label>Are You Sure To Reset This Order</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="btnOKresetorder" runat="server" Text="Yes" CssClass="btn btn-success" />
            </div>
        </div>
            </div>
    </asp:Panel>


    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_submitOrderConfirm" runat="server" PopupControlID="pnlSbmtOrder" TargetControlID="LinkButton2" CancelControlID="ButtonClose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlSbmtOrder" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">

        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Submit Order</h4>
            </div>
            <div class="modal-body">
                <label>Are You Sure To Submit This Order</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose2" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="btnOKsubmitorder" runat="server" Text="Yes" CssClass="btn btn-success" />
            </div>
        </div>
            </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_submitOrderDone" runat="server" PopupControlID="pnlSbmtOrderDone" TargetControlID="LinkButton3" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlSbmtOrderDone" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">

        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Submit Order</h4>
            </div>
            <div class="modal-body">
                <h3 class="font-weight-bold">Order Have Been Submit To Kitchen!</h3>
                <h5>Please keep track this order in Order Status</h5>
            </div>
            <div class="modal-footer">
                
                <asp:Button ID="btnOKsubmitorderdone" runat="server" Text="OK" CssClass="btn btn-success" />
            </div>
        </div>
            </div>
    </asp:Panel>

   </ContentTemplate>
                 </asp:UpdatePanel> 

</asp:Content> 



<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">


    


                        
</asp:Content>

