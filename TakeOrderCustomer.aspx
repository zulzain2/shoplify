<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="TakeOrderCustomer.aspx.vb" Inherits="TakeOrderCustomer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
    <link href="assets/css/pages/chat-app-page.css" rel="stylesheet">
    <!--c3 CSS -->
    <link href="assets/plugins/c3-master/c3.min.css" rel="stylesheet">
    <!--Toaster Popup message CSS -->
    <link href="assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="assets/css/pages/dashboard1.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <!-- page css -->
    <link href="assets/css/pages/tab-page.css" rel="stylesheet">

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
                        <li class="breadcrumb-item">Customer</li>
                        
                        <li class="breadcrumb-item font-bold">Make Order</li>
                    </ol>
                </div>
               <div>
                    <button id="cartbtn" type="button" class="right-side-toggle waves-effect waves-light btn-info btn btn-circle btn-sm pull-right m-l-10" runat="server">
                        <span class="label label-rouded label-danger pull-right">    
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server"> 
                         <ContentTemplate> 
                             <asp:Label ID="lblordertotal" runat="server" Text="0"></asp:Label>
                         </ContentTemplate>
                        </asp:UpdatePanel>
                        </span>
                        <i class="ti-shopping-cart text-white"></i>
                    </button>
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
                                    <div class="card-body" style="padding:0rem">

            <!-- ============================================================== -->
            <!-- Start Tab Content For Eat Here & Take Away-->
            <!-- ============================================================== -->
                                <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li class="nav-item"> <a class="nav-link font-weight-bold active" data-toggle="tab" href="#eathere" role="tab">Eat Here</a></li>
                                    <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#takeaway" role="tab">Take Away</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content tabcontent-border">

            <!-- ============================================================== -->
            <!-- Start Eat Here Tab -->
            <!-- ============================================================== -->
                                        
            <div class="tab-pane active" id="eathere" role="tabpanel">

                <div class="p-20" style="padding:0px;">
                                             
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li class="nav-item"> <a class="nav-link font-weight-bold active" data-toggle="tab" href="#alacart4eathere" role="tab">Ala Carte</a> </li>
                                    <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#set4eathere" role="tab">Set</a> </li>
                                    <li class="nav-item"> <a class="nav-link font-weight-bold" data-toggle="tab" href="#combo4eathere" role="tab">Combo</a> </li>
                            </ul>
                                            
                    <div class="tab-content tabcontent-border">
                                
                                <!-- ============================================================== -->
                                <!-- Start Eat Here Ala Carte -->
                                <div class="tab-pane active" id="alacart4eathere" role="tabpanel">
                                    <div class="p-20" style="padding:0px;">

                                        <div class="vtabs">
                             
                                  <!-- Start Vertical Tabs Sidebar -->
                                  <ul class="nav nav-tabs tabs-vertical" role="tablist"  style="width:0px">
                                        
                                         <li class="nav-item"> 
                                             <a class="nav-link active" data-toggle="tab" href="#default1" role="tab">
                                                 <span class="hidden-sm-up"><p class="font-weight-bold">All</p></span>
                                                       <span class="hidden-xs-down"><p class="text-center">All Menu</p></span>
                                             </a>
                                         </li>
                                             

                                        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource9">
                                            <ItemTemplate>
                                                    <li class="nav-item"> 
                                                        <a class="nav-link" data-toggle="tab" href="#<%# Eval("MENUCATEGORYNAME") %>1" role="tab"><span class="hidden-sm-up"><asp:Image ID="Image2" runat="server" Style="height:2rem;width:2rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>' /></span>
                                                       <span class="hidden-xs-down"> 
                                                           <asp:Image ID="Image1" runat="server" Style="height:6rem;width:6rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>'/>
                                                           <p class="text-center"><%# Eval("MENUCATEGORYNAME")%></p></span> 
                                                        </a>
                                                    </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME],[MENUCATEGORYIMAGE] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>

                                    </ul> 
                                     <!-- End Vertical Tabs Sidebar -->
                                     
                                     <!-- Start Vertical Tabs Content -->
                                    <div class="tab-content">

                                        <!-- Default Active Tab -->
                                         <div class="tab-pane active" id="default1" role="tabpanel">
                                           <asp:UpdatePanel ID="UpdatePanel101" runat="server"> 
                                            <ContentTemplate> 
                                             <div class="p-20">
                                                 <asp:ListView ID="ListView100" runat="server" DataSourceID="SqlDataSource100" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                <EmptyDataTemplate>
                                                    <div><span><h1>No menu set yet.</h1></span></div>
                                                </EmptyDataTemplate>

                                                <ItemTemplate>

                                                    <div class="col-lg-12" runat="server" id="categoryname">

                                                        <h2><asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCATEGORY") %>' runat="server" ID="Label3"/></h2>
                                                           <br />
                                                    </div>
                                                    
                                                    <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                        
                                                        <asp:ImageButton ID="ImageButton2" AutoPostBack="true" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" class="zoom"/><br />
                                                       
                                                        
                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCATEGORY") %>' runat="server" ID="MENUCATEGORYLabel" Visible="false"/>

                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                        <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>
                                                        <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />
                                                        <br />
                                                    </div>
                                                </ItemTemplate>
                           

                                                <LayoutTemplate>
                                                    <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                        <div class="row">
                                                        <div runat="server" id="itemPlaceholder">
                                                        </div>
                                                        </div>
                                                    </div>
                                                </LayoutTemplate>
   
                                              </asp:ListView>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource100" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                    <SelectParameters>
                                                    <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                          
                                              </div>
                          
                                             </ContentTemplate>
                                                  </asp:UpdatePanel>
                                         </div>
                                        <!-- Default Active Tab -->

                                        <!-- Other Tab -->
                                     

                                        <asp:ListView ID="ListView9" runat="server" DataSourceID="SqlDataSource10">
                                            <ItemTemplate>
                                                 <div class="tab-pane" id='<%# Eval("MENUCATEGORYNAME") %>1' role="tabpanel">
                                                     <asp:UpdatePanel ID="UpdatePanel102" runat="server"> 
                                                       <ContentTemplate> 
                                                     <div class="p-20">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               <asp:Label ID="Label2" runat="server" Text='<%# Eval("MENUCATEGORYNAME") %>' Style="display:none"></asp:Label>

                                                               <!-- Other Tab content -->
                                                               <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                                    <EmptyDataTemplate>
                                                                        <span>No menu set yet.</span>
                                                                    </EmptyDataTemplate>

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
                                                                       <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div class="row">
                                                                           <div runat="server" id="itemPlaceholder">
                                                                           </div>
                                                                           </div>
                                                                       </div>
                                                                   </LayoutTemplate>

                                                                  
                                                               </asp:ListView>
                                                                <!-- Other Tab content -->

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUCATEGORY] = @MENUCATEGORY) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                                    <SelectParameters>
                                                                    <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                    <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                                    <asp:ControlParameter ControlID="Label2" Name="MENUCATEGORY" PropertyName="Text" />
                                                                    </SelectParameters>
                                                               </asp:SqlDataSource>
                                                              

                                                                </div>
                                                        </div>
                                                </div>
                                                  </ContentTemplate>
                                                         </asp:UpdatePanel>
                                        </div>
                                        </ItemTemplate>
                                           
                                        </asp:ListView>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                        <!-- Other Tab Content --> 
                          
                           
                                    
                                      </div>
                                                 </div>
                                           </div>
                                    </div>

                                    <!-- End Vertical Tabs Content -->
                                    <!-- End Eat Here Ala Carte -->
                                    <!-- ============================================================== -->





                                 <!-- ============================================================== -->
                                 <!-- Start Eat Here Set -->
                                <div class="tab-pane" id="set4eathere" role="tabpanel">
                                    <div class="p-20" style="padding:0px;">

                                        <div class="vtabs">
                             
                                  <!-- Start Vertical Tabs Sidebar -->
                                  <ul class="nav nav-tabs tabs-vertical" role="tablist"  style="width:0px">
                                        
                                         <li class="nav-item"> 
                                             <a class="nav-link active" data-toggle="tab" href="#default2" role="tab">
                                                 <span class="hidden-sm-up"><i class="ti-home"></i></span>
                                                       <span class="hidden-xs-down"><p class="text-center">All Menu</p></span>
                                             </a>
                                         </li>
                                             

                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                    <li class="nav-item"> 
                                                        <a class="nav-link" data-toggle="tab" href="#<%# Eval("MENUCATEGORYNAME") %>2" role="tab"><span class="hidden-sm-up"><asp:Image ID="Image2" runat="server" Style="height:2rem;width:2rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>' /></span>
                                                       <span class="hidden-xs-down"> 
                                                           <asp:Image ID="Image1" runat="server" Style="height:6rem;width:6rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>'/>
                                                           <p class="text-center"><%# Eval("MENUCATEGORYNAME")%></p></span> 
                                                        </a>
                                                    </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME],[MENUCATEGORYIMAGE] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>

                                    </ul> 
                                     <!-- End Vertical Tabs Sidebar -->
                                     
                                     <!-- Start Vertical Tabs Content -->
                                    <div class="tab-content">

                                        <!-- Default Active Tab -->
                                         <div class="tab-pane active" id="default2" role="tabpanel">
                                             <asp:UpdatePanel ID="UpdatePanel201" runat="server"> 
                                            <ContentTemplate> 
                                             <div class="p-20">

                                                 <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource4" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                <EmptyDataTemplate>
                                                   <h3>No menu set yet.</h3>
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                    <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                        
                                                        <asp:ImageButton ID="ImageButton2" class="zoom" AutoPostBack="true" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />
                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                        <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>
                                                        <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />
                                                        <br />
                                                    </div>
                                                </ItemTemplate>

                                                <LayoutTemplate>
                                                    <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                        <div class="row">
                                                        <div runat="server" id="itemPlaceholder">
                                                        </div>
                                                        </div>
                                                    </div>
                                                </LayoutTemplate>
   
                                              </asp:ListView>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                    <SelectParameters>
                                                    <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                              </div>
                                                </ContentTemplate>
                                                 </asp:UpdatePanel>
                                         </div>
                                        <!-- Default Active Tab -->

                                        <!-- Other Tab -->
                                        <asp:ListView ID="ListView13" runat="server" DataSourceID="SqlDataSource14">

                                            <ItemTemplate>
                                               
                                                 <div class="tab-pane" id='<%# Eval("MENUCATEGORYNAME") %>2' role="tabpanel">
                                                     <asp:UpdatePanel ID="UpdatePanel202" runat="server"> 
                                                       <ContentTemplate> 
                                                     <div class="p-20">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               <asp:Label ID="Lblcategname" runat="server" Text='<%# Eval("MENUCATEGORYNAME") %>' Style="display:none"></asp:Label>

                                                               <!-- Other Tab content -->
                                                               <asp:ListView ID="ListView101" runat="server" DataSourceID="SqlDataSource101" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                                    <EmptyDataTemplate>
                                                                        <EmptyDataTemplate>
                                                                            <h3>No menu set yet.</h3>
                                                                        </EmptyDataTemplate>
                                                                    </EmptyDataTemplate>

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
                                                                       <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div class="row">
                                                                           <div runat="server" id="itemPlaceholder">
                                                                           </div>
                                                                           </div>
                                                                       </div>
                                                                   </LayoutTemplate>

                                                                  
                                                               </asp:ListView>
                                                                <!-- Other Tab content -->

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource101" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUCATEGORY] = @MENUCATEGORY) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                                    <SelectParameters>
                                                                    <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                    <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                                    <asp:ControlParameter ControlID="Lblcategname" Name="MENUCATEGORY" PropertyName="Text" />
                                                                    </SelectParameters>
                                                               </asp:SqlDataSource>
                                                              

                                                                </div>
                                                        </div>
                                                </div>
                                                           </ContentTemplate>
                                                         </asp:UpdatePanel>
                                        </div>
                                        </ItemTemplate>
                                           
                                        </asp:ListView>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource14" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                        <!-- Other Tab Content -->  
                                       
                                    
                                      </div>
                                                 </div>
                                           </div>
                                    </div>

                                    <!-- End Vertical Tabs Content -->

                                    <!-- End Eat Here Set -->
                                    <!-- ============================================================== -->

                                    <!-- ============================================================== -->
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
                                                <!-- ============================================================== -->
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


                                 <!-- ============================================================== -->
                                 <!-- Start Take Away Ala Carte -->
                                <div class="tab-pane active" id="alacart4takeaway" role="tabpanel">
                                    <div class="p-20" style="padding:0px;">

                                        <div class="vtabs">
                             
                                  <!-- Start Vertical Tabs Sidebar -->
                                  <ul class="nav nav-tabs tabs-vertical" role="tablist"  style="width:0px">
                                        
                                         <li class="nav-item"> 
                                             <a class="nav-link active" data-toggle="tab" href="#default4" role="tab">
                                                 <span class="hidden-sm-up"><i class="ti-home"></i></span>
                                                       <span class="hidden-xs-down"><p class="text-center">All Menu</p></span>
                                             </a>
                                         </li>
                                             

                                        <asp:ListView ID="ListView10" runat="server" DataSourceID="SqlDataSource11">
                                            <ItemTemplate>
                                                   <li class="nav-item"> 
                                                        <a class="nav-link" data-toggle="tab" href="#<%# Eval("MENUCATEGORYNAME") %>4" role="tab"><span class="hidden-sm-up"><asp:Image ID="Image2" runat="server" Style="height:2rem;width:2rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>' /></span>
                                                       <span class="hidden-xs-down"> 
                                                           <asp:Image ID="Image1" runat="server" Style="height:6rem;width:6rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>'/>
                                                           <p class="text-center"><%# Eval("MENUCATEGORYNAME")%></p></span> 
                                                        </a>
                                                    </li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME],[MENUCATEGORYIMAGE] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>

                                    </ul> 
                                     <!-- End Vertical Tabs Sidebar -->
                                     
                                     <!-- Start Vertical Tabs Content -->
                                    <div class="tab-content">

                                        <!-- Default Active Tab -->
                                         <div class="tab-pane active" id="default4" role="tabpanel">
                                             <asp:UpdatePanel ID="UpdatePanel401" runat="server"> 
                                                       <ContentTemplate> 
                                             <div class="p-20">

                                                 <asp:ListView ID="ListView11" runat="server" DataSourceID="SqlDataSource12" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                <EmptyDataTemplate>
                                                    <div><span><h1>No menu set yet.</h1></span></div>
                                                </EmptyDataTemplate>

                                                <ItemTemplate>

                                                     <div class="col-lg-12" runat="server" id="categoryname5">

                                                        <h2><asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCATEGORY") %>' runat="server" ID="lbl5"/></h2>
                                                           <br />
                                                    </div>
                                                    
                                                   
                                                       
                                                        
                                                        

                                                    <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                        
                                                        <asp:ImageButton ID="ImageButton2" class="zoom" AutoPostBack="true" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />
                                                        
                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCATEGORY") %>' runat="server" ID="MENUCATEGORYLabel" Visible="false"/>
                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                        <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>
                                                        <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />
                                                        <br />
                                                    </div>
                                                </ItemTemplate>

                                                <LayoutTemplate>
                                                    <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                        <div class="row">
                                                        <div runat="server" id="itemPlaceholder">
                                                        </div>
                                                        </div>
                                                    </div>
                                                </LayoutTemplate>
   
                                              </asp:ListView>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                    <SelectParameters>
                                                    <asp:Parameter DefaultValue="Take Away" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                              </div>
                                                           </ContentTemplate>
                                                 </asp:UpdatePanel>
                                         </div>
                                        <!-- Default Active Tab -->

                                        <!-- Other Tab -->
                                        <asp:ListView ID="ListView12" runat="server" DataSourceID="SqlDataSource13">

                                            <ItemTemplate>
                                               
                                                 <div class="tab-pane" id="<%# Eval("MENUCATEGORYNAME") %>4" role="tabpanel">
                                                      <asp:UpdatePanel ID="UpdatePanel402" runat="server"> 
                                                       <ContentTemplate> 
                                                     <div class="p-20">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               <asp:Label ID="lblcategnametawayalacarte" runat="server" Text='<%# Eval("MENUCATEGORYNAME") %>' Style="display:none"></asp:Label>

                                                               <!-- Other Tab content -->
                                                               <asp:ListView ID="ListView400" runat="server" DataSourceID="SqlDataSource400" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                                    <EmptyDataTemplate>
                                                                        <span>No menu set yet.</span>
                                                                    </EmptyDataTemplate>

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
                                                                       <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div class="row">
                                                                           <div runat="server" id="itemPlaceholder">
                                                                           </div>
                                                                           </div>
                                                                       </div>
                                                                   </LayoutTemplate>

                                                                  
                                                               </asp:ListView>
                                                                <!-- Other Tab content -->

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource400" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUCATEGORY] = @MENUCATEGORY) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                                    <SelectParameters>
                                                                    <asp:Parameter DefaultValue="Take Away" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                    <asp:Parameter DefaultValue="Ala Carte" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                                    <asp:ControlParameter ControlID="lblcategnametawayalacarte" Name="MENUCATEGORY" PropertyName="Text" />
                                                                    </SelectParameters>
                                                               </asp:SqlDataSource>
                                                              

                                                                </div>
                                                        </div>
                                                </div>
                                                           </ContentTemplate>
                                                          </asp:UpdatePanel>
                                        </div>
                                        </ItemTemplate>
                                           
                                        </asp:ListView>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource13" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                        <!-- Other Tab Content -->  
                                       
                                    
                                      </div>
                                                 </div>
                                           </div>
                                    </div>

                                    <!-- End Vertical Tabs Content -->

                                    <!-- End Take Away Ala Carte -->
                                    <!-- ============================================================== -->

                                    <!-- ============================================================== -->
                                    <!-- Start Take Away Set -->
                                    <div class="tab-pane p-20" id="set4takeaway" role="tabpanel">
                                               <div class="p-20" style="padding:0px;">

                                                <div class="vtabs">
                                            
                                                     <!-- Start Vertical Tabs Sidebar -->
                                                    <ul class="nav nav-tabs tabs-vertical" role="tablist"  style="width:0px">
                                        
                                                     <li class="nav-item"> 
                                                         <a class="nav-link active" data-toggle="tab" href="#default5" role="tab">
                                                             <span class="hidden-sm-up"><i class="ti-home"></i></span>
                                                                   <span class="hidden-xs-down"><p class="text-center">All Menu</p></span>
                                                         </a>
                                                     </li>
                                             

                                                    <asp:ListView ID="ListView15" runat="server" DataSourceID="SqlDataSource16">
                                                        <ItemTemplate>
                                                                <li class="nav-item"> 
                                                        <a class="nav-link" data-toggle="tab" href="#<%# Eval("MENUCATEGORYNAME") %>5" role="tab"><span class="hidden-sm-up"><asp:Image ID="Image2" runat="server" Style="height:2rem;width:2rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>' /></span>
                                                       <span class="hidden-xs-down"> 
                                                           <asp:Image ID="Image1" runat="server" Style="height:6rem;width:6rem" ImageUrl='<%# Eval("MENUCATEGORYIMAGE") %>'/>
                                                           <p class="text-center"><%# Eval("MENUCATEGORYNAME")%></p></span> 
                                                        </a>
                                                    </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource16" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME],[MENUCATEGORYIMAGE] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>

                                                    </ul> 
                                                     <!-- End Vertical Tabs Sidebar -->

                                                     <!-- Start Vertical Tabs Content -->
                                    <div class="tab-content">

                                        <!-- Default Active Tab -->
                                         <div class="tab-pane active" id="default5" role="tabpanel">
                                             <asp:UpdatePanel ID="UpdatePanel501" runat="server"> 
                                            <ContentTemplate> 
                                             <div class="p-20">

                                                 <asp:ListView ID="ListView16" runat="server" DataSourceID="SqlDataSource17" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                <EmptyDataTemplate>
                                                   <h3>No menu set yet.</h3>
                                                </EmptyDataTemplate>

                                                <ItemTemplate>
                                                    <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                        
                                                        <asp:ImageButton ID="ImageButton2" class="zoom" AutoPostBack="true" runat="server" CommandName="ADDTOCART" CommandArgument='<%# Container.DataItemIndex %>' ImageUrl='<%# Bind("MENUPICTURE") %>' style="height:120px;width:120px;box-shadow: 0 0 5px black;" /><br />
                                                        <asp:Label class="font-weight-bold text-center" Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" /><br />
                                                        <p class="text-center" style="margin-bottom: 0px;" ><asp:Label  Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-weight-bold" style="color: #f57224;"/></p>
                                                        <small class="font-weight-bold"> RM<asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></small><br />
                                                        <br />
                                                    </div>
                                                </ItemTemplate>

                                                <LayoutTemplate>
                                                    <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                        <div class="row">
                                                        <div runat="server" id="itemPlaceholder">
                                                        </div>
                                                        </div>
                                                    </div>
                                                </LayoutTemplate>
   
                                              </asp:ListView>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource17" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                    <SelectParameters>
                                                    <asp:Parameter DefaultValue="Take Away" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                              </div>
                                                </ContentTemplate>
                                                 </asp:UpdatePanel>
                                         </div>
                                         <!-- Default Active Tab -->

                                        <!-- Other Tab -->
                                        <asp:ListView ID="ListView17" runat="server" DataSourceID="SqlDataSource18">

                                            <ItemTemplate>
                                               
                                                 <div class="tab-pane" id='<%# Eval("MENUCATEGORYNAME") %>5' role="tabpanel">
                                                     <asp:UpdatePanel ID="UpdatePanel502" runat="server"> 
                                                       <ContentTemplate> 
                                                     <div class="p-20">
                                                        <div class="row">
                                                           <div class="col-lg-12">
                                                               <asp:Label ID="Lblcategnametawayset" runat="server" Text='<%# Eval("MENUCATEGORYNAME") %>' Style="display:none"></asp:Label>

                                                               <!-- Other Tab content -->
                                                               <asp:ListView ID="ListView500" runat="server" DataSourceID="SqlDataSource500" OnItemCommand="LV1Inner_ItemCommand" DataKeyNames="MENUNAME,MENUCODE,MENUPRICE" >

                                                                    <EmptyDataTemplate>
                                                                        <EmptyDataTemplate>
                                                                            <h3>No menu set yet.</h3>
                                                                        </EmptyDataTemplate>
                                                                    </EmptyDataTemplate>

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
                                                                       <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                                           <div class="row">
                                                                           <div runat="server" id="itemPlaceholder">
                                                                           </div>
                                                                           </div>
                                                                       </div>
                                                                   </LayoutTemplate>

                                                                  
                                                               </asp:ListView>
                                                                <!-- Other Tab content -->

                                                               <asp:SqlDataSource runat="server" ID="SqlDataSource500" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE) AND ([MENUCATEGORY] = @MENUCATEGORY) AND ([MENUSTATUS] = @MENUSTATUS)) ORDER BY [MENUCATEGORY]">
                                                                    <SelectParameters>
                                                                    <asp:Parameter DefaultValue="Take Away" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                                    <asp:Parameter DefaultValue="Set" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                                        <asp:Parameter DefaultValue="ACTIVE" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                                    <asp:ControlParameter ControlID="Lblcategnametawayset" Name="MENUCATEGORY" PropertyName="Text" />
                                                                    </SelectParameters>
                                                               </asp:SqlDataSource>
                                                              

                                                                </div>
                                                        </div>
                                                </div>
                                                           </ContentTemplate>
                                                         </asp:UpdatePanel>
                                        </div>
                                        </ItemTemplate>
                                           
                                        </asp:ListView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource18" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                        <!-- Other Tab Content -->  
                                       
                                    
                                      </div>
                                                 </div>
                                           </div>
                                    </div>

                                    <!-- End Vertical Tabs Content -->

                                    <!-- End Take Away Set -->
                                    <!-- ============================================================== -->





                                    <!-- ============================================================== -->
                                    <!-- Start Take Away Combo -->
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

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUPICTURE], [MENUCODE], [MENUCATEGORY] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUTYPE] = @MENUTYPE) AND ([MENUSETTYPE] = @MENUSETTYPE)) ORDER BY [MENUCATEGORY]">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="Eat Here" Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="Combo" Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                                    </div>
                                                </div>


                                    </div>
                                    <!-- End Take Away Combo -->
                                    <!-- ============================================================== -->
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

                <div class="right-sidebar" id="rightsidebar" runat="server" >
                    
                    <div class="slimScrollBar">
                         <div class="rpanel-title" > Order Cart <span><i class="ti-close right-side-toggle"></i></span> </div>

                          

                        <div class="r-panel-body" >

                            <asp:UpdatePanel ID="UpdatePanel3" runat="server"> 
                       <ContentTemplate>  
                    <div class="row">
                         <div class="col-md-12 m-t-10">
                           <div class="row">
                                <div class="col-lg-12">
                                    <h3><i class="fas fa-shopping-cart"></i>  Order Cart
                                 </div>
                           </div>
                             <div class="row">
                                 <div class="col-md-12">
                                     <p class="font-weight-bold">Order Num : <asp:Label ID="lblOrderNum" runat="server" Text=""></asp:Label> </p> <br />
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


                                                <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [TABLENUM] FROM [SHOPLIFYRESTAURANTTABLE] WHERE ([TABLENUM] = @TABLENUM)">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter QueryStringField="tablenum" Name="TABLENUM" Type="String"></asp:QueryStringParameter>
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
                           </ContentTemplate>
                   </asp:UpdatePanel> 
                            </div>
                         
                         </div>
                    
                        </div>
                 
                <!-- ============================================================== -->
                <!-- End Right panel -->
                <!-- ============================================================== -->


 


   <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="false" UpdateMode="conditional"> 
                       <ContentTemplate> 
    

    <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_viewMenuDetail" runat="server" PopupControlID="pnlviewmenu" TargetControlID="LinkButton4" CancelControlID="ButtonCloseMenu" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlviewmenu" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none">

       
        <div class="modal-dialog modal-dialog-centered modal-xl slideInUp animated">
        <div class="modal-content">

        <div class="modal-header">
            <h2 class="modal-title font-bold">MENU <asp:Label ID="lblmenudetail" runat="server" Text=""></asp:Label></h2>
            
            <asp:LinkButton ID="ButtonCloseMenu" runat="server" CssClass="btn btn-danger"><i class="mdi mdi-close"></i></asp:LinkButton>
            
        </div>
            
        <div class="modal-body">
              
                    <asp:ListView ID="ListView14" runat="server" DataSourceID="SqlDataSource15">
                       
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        
                        <ItemTemplate>
                                             
                                                <div class="col-lg-12" runat="server" style="">
                                                     <div class="card " style="padding-bottom:0px">
                                    <div class="card-body" style="padding-bottom:0px">
                                                    <div class="row">
                                                        

                                                    <div class="col-lg-6 col-12"> 
                                                        <div class="card text-center">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("MENUPICTURE") %>' class="card-img-top img-responsive"/><br />
                                                            <div class="card-body" style="background-color: rgba(120, 130, 140, 0.13);">
                                                                <h4 class="card-title font-weight-bold">
                                                                <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" />
                                                                <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /></h4>
                                                            </div>
                                                         </div>
                                                    </div>
                                                    

                                                    <div class="col-lg-6 col-12">
                                                        
                                                <br />

                                                    
                                                   <h2 class="font-weight-bold">RM <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /></h2><br />

                                         

                                                   
                                                   

                                                        <p><i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel" />
                                                    
                                                    <i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" /> </p><br /><br />
                                                   
                                                   <p> Details : <br />
                                                   
                                                   <asp:Label Text='<%# Eval("MENUDETAIL") %>' runat="server" ID="MENUDETAILLabel" /></p> 
                                                    
                                                    
                                                    
                                                   


                                               </div>
                                                    </div>
                                                    </div>
                                                </div>
                                                    </div>
                                                    
                                            </ItemTemplate>

                        <LayoutTemplate>
                           <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                     <div class="row">
                                                    <div  runat="server" id="itemPlaceholder" />
                                                         </div>
                                                </div>
                                                
                                                </div>
                        </LayoutTemplate>
                       
                    </asp:ListView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource15" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUPICTURE], [MENUSTATUS], [MENUCODE], [MENUDETAIL], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER] WHERE ([MENUCODE] = @MENUCODE)">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="tmpMENUCODE" Name="MENUCODE" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
              
                <div class="modal-footer">
                
                    <div class="col-lg-12 text-right">
                    
                        <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="col-md-3 offset-md-9 p-3 btn btn-block btn-lg btn-info"><i class="fas fa-cart-plus"></i>  Add to Cart</asp:LinkButton>
                        
                        </div>
                
                </div>    
           
               
       </div>
            
                
                
            
        </div>
            </div>
           
    </asp:Panel>

                      </ContentTemplate> 
        </asp:UpdatePanel> 

       

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_resetOrderDone" runat="server" PopupControlID="pnlresetorderdone" TargetControlID="LinkButton1" CancelControlID="ButtonClose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlresetorderdone" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">

        <div class="modal-dialog modal-dialog-centered bounceIn animated">
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

        <div class="modal-dialog modal-dialog-centered bounceIn animated">
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

        <div class="modal-dialog modal-dialog-centered bounceIn animated">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold text-success">Submit Order</h4>
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


    
    <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_submitOrderWarning" runat="server" PopupControlID="pnlSbmtOrderWarning" TargetControlID="LinkButton5" CancelControlID="btnCloseOrderWarning" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlSbmtOrderWarning" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">

        <div class="modal-dialog modal-dialog-centered bounceIn animated">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold text-danger">Submit Order Warning!</h4>
            </div>
            <div class="modal-body">
                <label>Please select at least 1 menu!</label>
                
            </div>
            <div class="modal-footer">
                
                <asp:Button ID="btnCloseOrderWarning" runat="server" Text="OK" CssClass="btn btn-danger" />
            </div>
        </div>
            </div>
    </asp:Panel>




   

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

    <!-- <script type="text/javascript">

        Sys.Application.add_init(appl_init);

        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_endRequest(EndHandler);
        }

        function EndHandler() {
        // This will be called whenever your updatepanel update 
        // It will be trigger after the update updatepanel
        //add your javascript here

            $.getScript('assets/plugins/jquery/jquery.min.js', function()
        {
 
            });

             $.getScript('assets/plugins/bootstrap/js/popper.min.js', function()
        {

            });

             $.getScript('assets/plugins/bootstrap/js/bootstrap.min.js', function()
        {

            });

             $.getScript('assets/js/perfect-scrollbar.jquery.min.js', function()
        {

            });

             $.getScript('assets/js/waves.js', function()
        {

            });

               $.getScript('assets/js/sidebarmenu.js', function()
        {

            });

               $.getScript('assets/plugins/sticky-kit-master/dist/sticky-kit.min.js', function()
        {

            });

               $.getScript('assets/plugins/sparkline/jquery.sparkline.min.js', function()
        {

            });

               $.getScript('assets/js/custom.min.js', function()
        {

            });

             $.getScript('assets/js/chat.js', function()
        {

            });

              $.getScript('assets/plugins/styleswitcher/jQuery.style.switcher.js', function()
        {

            });


        }                                                          
    </script>  -->
    

</asp:Content>

