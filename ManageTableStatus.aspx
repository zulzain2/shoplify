<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageTableStatus.aspx.vb" Inherits="ManageTableStatus" %>

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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-settings-variant"></i>&nbsp Status Of Table</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Customer</li>
                        <li class="breadcrumb-item">Manage Table</li>
                        <li class="breadcrumb-item font-bold">Status Of Table</li>
                        
                    </ol>
                </div>
              
            </div>

    <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
          
                
                    <div class="row">
                         <% If Session("ssUserLevel") = "Administrator" Then%>
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewtable" runat="server" class="btn btn-outline-info btn-block" ><i class="ti-plus text"></i> Table</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnedittable" runat="server" class="btn btn-outline-info btn-block" ><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                        <%End If %>
                        <% If Session("ssUserLevel") = "Administrator" Or Session("ssUserLevel") = "Chef" Then%>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbaletable" runat="server" class="btn btn-info btn-block" ><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
             </div>
                        <%End If %>
                    </div>
                    
                </div>
    
             
        </div>
    </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
                    <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">
                                    <div style="overflow-x:auto;">
                                        <asp:GridView ID="gvtablelist" runat="server" AutoGenerateColumns="False" DataKeyNames="TABLEID,TABLESTATUS" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                                            <Columns>

                                                 <asp:ButtonField CommandName="AVAILABILITY" ButtonType="Button" HeaderStyle-CssClass="text-center" HeaderText="ACTIVATION"></asp:ButtonField>
                                                <asp:TemplateField HeaderText="TABLENUM" SortExpression="TABLENUM" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLENUM") %>' ID="TextBox1"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLENUM") %>' ID="Label1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLESEATNUM" SortExpression="TABLESEATNUM" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLESEATNUM") %>' ID="TextBox2"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLESEATNUM") %>' ID="Label2"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLESTATUS" SortExpression="TABLESTATUS" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLESTATUS") %>' ID="TextBox3"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLESTATUS") %>' ID="Label3"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLECHANGEBY" SortExpression="TABLECHANGEBY" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLECHANGEBY") %>' ID="TextBox4"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLECHANGEBY") %>' ID="Label4"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLECHANGEDATE" SortExpression="TABLECHANGEDATE" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLECHANGEDATE", "{0:dd/MM/yyyy}") %>' ID="TextBox5"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLECHANGEDATE", "{0:dd/MM/yyyy}") %>' ID="Label5"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLEADDDATE" SortExpression="TABLEADDDATE" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLEADDDATE", "{0:dd/MM/yyyy}") %>' ID="TextBox6"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLEADDDATE", "{0:dd/MM/yyyy}") %>' ID="Label6"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TABLEADDBY" SortExpression="TABLEADDBY" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("TABLEADDBY") %>' ID="TextBox7"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("TABLEADDBY") %>' ID="Label7"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT * FROM [SHOPLIFYRESTAURANTTABLE]"></asp:SqlDataSource>
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
                <h4 class="modal-title font-bold" id="vcenter">Disable Table</h4>
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
                <h4 class="modal-title font-bold">Enable Table</h4>
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
                <h4 class="modal-title font-bold">Disable Table</h4>
            </div>
            <div class="modal-body">
                Table <asp:Label ID="lbl_fullname" runat="server"></asp:Label> has been disabled.
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
                <h4 class="modal-title font-bold">Enable Table</h4>
            </div>
            <div class="modal-body">
                Table <asp:Label ID="Label6" runat="server"></asp:Label> has been enabled.
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
                <h4 class="modal-title font-bold">Disable Table</h4>
            </div>
            <div class="modal-body">
                Table <asp:Label ID="lbl_fullname1" runat="server"></asp:Label> failed to be disabled.
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button2" runat="server" Text="OK" CssClass="btn btn-success" />
            </div>
        </div>
          </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_enablefailed" runat="server" PopupControlID="pnlenablefailed" TargetControlID="LinkButton5" CancelControlID="Button8" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlenablefailed" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; display:none">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Enable Table</h4>
            </div>
            <div class="modal-body">
                Table <asp:Label ID="Label7" runat="server"></asp:Label> failed to be enabled.
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
    

    <script>

     $(function () {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                
            });
        });

        </script>


</asp:Content>

