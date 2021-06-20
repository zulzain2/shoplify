<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuActivationDetail.aspx.vb" Inherits="MenuActivationDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/media/css/dataTables.bootstrap4.css">

     <style>
        .modal-backdrop {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width : 100%;
            height : 100%;
            z-index: 1040;
            background-color: #000;
            filter: alpha(opacity=60) !important;
            opacity: 0.7 !important;
        }
    </style>

    <!-- Popup CSS -->
    <link href="assets/plugins/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">
    <!-- page css -->
    <link href="assets/css/pages/user-card.css" rel="stylesheet">



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

       <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Menu Activation Status</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Menu Master</li>
                        <li class="breadcrumb-item font-bold"> Menu Activation Status</li>
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
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">

                                        
                                        <div style="overflow-x:auto;">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="MENUNAME,MENUSTATUS" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
                                                <Columns>
                                                    <asp:ButtonField CommandName="AVAILABILITY" ButtonType="Button" HeaderStyle-CssClass="text-center" HeaderText="ACTIVATION"></asp:ButtonField>
                                                    <asp:TemplateField HeaderText="MENUPICTURE" SortExpression="MENUPICTURE">
                                                        <EditItemTemplate>

                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUPICTURE") %>' ID="TextBox6"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <div class="el-element-overlay">
                                                                <div class="card">
                                                                    <div class="el-card-item" style="padding-bottom:  0px;">
                                                                        <div class="el-card-avatar el-overlay-1"> <asp:Image runat="server" ImageUrl='<%# Bind("MENUPICTURE") %>' ID="Image1"></asp:Image>
                                                                            <div class="el-overlay">
                                                                                <ul class="el-info">
                                                                                    <li><asp:HyperLink ID="HyperLink1" runat="server" class="btn default btn-outline image-popup-vertical-fit" NavigateUrl='<%# Bind("MENUPICTURE") %>'><i class="icon-magnifier"></i></asp:HyperLink></li>
                                                                                   
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                    </div>
                                                                </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUNAME" SortExpression="MENUNAME">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("MENUNAME") %>' ID="Label1"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUNAME") %>' ID="Label1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUPRICE" SortExpression="MENUPRICE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUPRICE") %>' ID="TextBox1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUPRICE") %>' ID="Label2"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUCATEGORY" SortExpression="MENUCATEGORY">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUCATEGORY") %>' ID="TextBox2"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCATEGORY") %>' ID="Label3"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="MENUSTATUS" SortExpression="MENUSTATUS">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUSTATUS") %>' ID="TextBox7"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                           
                                                            <span class="label label-danger"><asp:Label runat="server" Text='<%# Bind("MENUSTATUS") %>' ID="Label1"></asp:Label></span>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                 
               
                                                    <asp:TemplateField HeaderText="MENUADDDATE" SortExpression="MENUADDDATE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUADDDATE") %>' ID="TextBox3"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUADDDATE") %>' ID="Label4"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUCHANGEDATE" SortExpression="MENUCHANGEDATE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUCHANGEDATE") %>' ID="TextBox4"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEDATE") %>' ID="Label5"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUCHANGEBY" SortExpression="MENUCHANGEBY">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUCHANGEBY") %>' ID="TextBox5"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEBY") %>' ID="Label6"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                   
                                                    <asp:TemplateField HeaderText="MENUCODE" SortExpression="MENUCODE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUCODE") %>' ID="TextBox8"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCODE") %>' ID="Label9"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUDETAIL" SortExpression="MENUDETAIL">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="TextBox9"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="Label10"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MENUTYPE" SortExpression="MENUTYPE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUTYPE") %>' ID="TextBox10"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUTYPE") %>' ID="Label11"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="MENUSETTYPE" HeaderText="MENUSETTYPE" SortExpression="MENUSETTYPE"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUCODE], [MENUDETAIL], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER] WHERE ([MENUCATEGORY] = @MENUCATEGORY)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter QueryStringField="menucategory" Name="MENUCATEGORY" Type="String"></asp:QueryStringParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        </div>
                                    </div>
                                </div>
         </div>

    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>

    <asp:LinkButton ID="lnkfake1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_confirm_disable" runat="server" PopupControlID="pnlconfirm_disable" TargetControlID="lnkfake1" CancelControlID="Button1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlconfirm_disable" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
        
       <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold" id="vcenter">Disable User</h4>
            </div>
            <div class="modal-body">
                <label>
                    Are you sure to disable
                    <asp:Label ID="lblName" runat="server"></asp:Label>?</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button1" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="btnconfirmdisable" runat="server" Text="Yes" OnClick="btnconfirmdisable_Click" CssClass="btn btn-success" />
            </div>
          </div>
       </div>
         </asp:Panel>

     <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_confirmenable" runat="server" PopupControlID="pnlconfirm_enable" TargetControlID="LinkButton3" CancelControlID="Button5" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlconfirm_enable" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Enable User</h4>
            </div>
            <div class="modal-body">
                <label>
                    Are you sure to enable
                    <asp:Label ID="Label5" runat="server"></asp:Label>?</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button5" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="btnconfirm_enable" runat="server" Text="Yes" OnClick="btnconfirm_enable_Click" CssClass="btn btn-success" />
            </div>
        </div>
          </div>
    </asp:Panel>

     <asp:LinkButton ID="lnkfake2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_disable_done" runat="server" PopupControlID="pnldisabledone" TargetControlID="lnkfake2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnldisabledone" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Disable Menu</h4>
            </div>
            <div class="modal-body">
                Menu <asp:Label ID="lbl_fullname" runat="server"></asp:Label> has been disabled.
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button3" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
            </div>
        </div>
        </div>
    </asp:Panel>

     <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_enable_done" runat="server" PopupControlID="pnlenabledone" TargetControlID="LinkButton4" CancelControlID="lnkbutton3" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlenabledone" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Enable Menu</h4>
            </div>
            <div class="modal-body">
                Menu <asp:Label ID="Label6" runat="server"></asp:Label> has been enabled.
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="lnkbutton3" runat="server"></asp:LinkButton>
                <asp:Button ID="Button7" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
            </div>
        </div>
          </div>
    </asp:Panel>

    <asp:LinkButton ID="lnkfake3" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_disable_failed" runat="server" PopupControlID="pnldisablefailed" TargetControlID="lnkfake3" CancelControlID="Button2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnldisablefailed" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Disable Menu</h4>
            </div>
            <div class="modal-body">
                Menu <asp:Label ID="lbl_fullname1" runat="server"></asp:Label> failed to be disabled.
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="OK" CssClass="btn btn-success" />
            </div>
        </div>
          </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_enablefailed" runat="server" PopupControlID="pnlenablefailed" TargetControlID="LinkButton5" CancelControlID="Button8" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlenablefailed" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%;display:none">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Enable Menu</h4>
            </div>
            <div class="modal-body">
                Menu <asp:Label ID="Label7" runat="server"></asp:Label> failed to be enabled.
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button8" runat="server" Text="OK" CssClass="btn btn-success" />
            </div>
        </div>
          </div>
    </asp:Panel>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

      <!-- This is data table -->
    <!-- DataTables JavaScript -->
    <script src="startbootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/datatables.min.js"></script>
    
     <!-- Magnific popup JavaScript -->
    <script src="assets/plugins/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
    <script src="assets/plugins/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>

    <script>

     $(function () {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                
            });
        });

        </script>


</asp:Content>

