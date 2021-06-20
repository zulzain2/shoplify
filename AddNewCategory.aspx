<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddNewCategory.aspx.vb" Inherits="AddNewCategory" %>

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
                     <h3 class="page-header"><i class="mdi mdi-food"></i>&nbsp Add New Category</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Administration</li>
                        <li class="breadcrumb-item">Menu Category</li>
                        <li class="breadcrumb-item font-bold">Add/Delete New Category</li>
                    </ol>
                </div>
              
            </div>

    <div class="row">
       <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
                
                    <div class="row">
            <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewmenu" runat="server" class="btn btn-outline-info btn-block" ><i class="ti-plus text"></i> Menu</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnadddeletecategory" runat="server" class="btn btn-info btn-block" ><i class="ti-plus text"></i>/<i class="mdi mdi-delete text"></i> Category</asp:LinkButton>
             </div>
                 
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btneditmenu" runat="server" class="btn btn-outline-info btn-block" ><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbalemenu" runat="server" class="btn btn-outline-info btn-block" ><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
             </div>
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
                                <h4 class="m-b-0 text-white">Add New Category</h4>
                            </div>
                            <div class="card-body">

                                <div class="form-body">
                                        <h3 class="box-title">Category Info</h3>
                                        <hr class="m-t-0 m-b-40">


                                    <div class="row">
                                          <!--/span-->
                                         <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="control-label col-md-2">Category Name</label>
                                            <div class="col-md-10">
                                                <div class="controls">
                                                <asp:textbox ID="txtCategoryName" runat="server" class="form-control"></asp:textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtCategoryName" ValidationGroup="UpdateCategory" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                </div>
                                                <asp:Label ID="lblerrorMenu" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                                </div>
                                        </div>
                                    </div>
                                        </div>

                                     <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnUpdtCategory" runat="server" ValidationGroup="UpdateCategory" Text="Add Category" class="btn btn-outline-info btn-lg btn-block" style="font-size: medium;"/> 
                                        </div>
                                    </div>
                                </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>

     <div class="row">
            <div class="col-lg-12">
                <div class="card ">
                    <div class="card-header bg-info">
                        <h4 class="m-b-0 text-white">Category List</h4>
                    </div>
                    <div class="card-body">

                        <div style="overflow-x:auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available" DataKeyNames="MENUTYPEID">
                                <Columns>
                                    <asp:TemplateField  HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate >
                                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are You Sure to Delete?');" CausesValidation="False" ID="LinkButton1"><i class="fas fa-trash-alt fa-lg" style="color:red"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:BoundField DataField="MENUCATEGORYNAME" HeaderText="Category Name" SortExpression="MENUCATEGORYNAME" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                    <asp:BoundField DataField="MENUCATEGORYADDBY" HeaderText="Add By" SortExpression="MENUCATEGORYADDBY" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                    <asp:BoundField DataField="MENUCATEGORYADDDATE" HeaderText="Add Date" SortExpression="MENUCATEGORYADDDATE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                  
                                </Columns>

                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME], [MENUCATEGORYADDBY], [MENUCATEGORYADDDATE], [MENUTYPEID] FROM [SHOPLIFYMENUTYPE]" DeleteCommand="DELETE FROM [SHOPLIFYMENUTYPE] WHERE [MENUTYPEID] = @MENUTYPEID" InsertCommand="INSERT INTO [SHOPLIFYMENUTYPE] ([MENUCATEGORYNAME], [MENUCATEGORYADDBY], [MENUCATEGORYADDDATE]) VALUES (@MENUCATEGORYNAME, @MENUCATEGORYADDBY, @MENUCATEGORYADDDATE)" UpdateCommand="UPDATE [SHOPLIFYMENUTYPE] SET [MENUCATEGORYNAME] = @MENUCATEGORYNAME, [MENUCATEGORYADDBY] = @MENUCATEGORYADDBY, [MENUCATEGORYADDDATE] = @MENUCATEGORYADDDATE WHERE [MENUTYPEID] = @MENUTYPEID">
                                <DeleteParameters>
                                    <asp:Parameter Name="MENUTYPEID" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="MENUCATEGORYNAME" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="MENUCATEGORYADDBY" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="MENUCATEGORYADDDATE"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="MENUCATEGORYNAME" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="MENUCATEGORYADDBY" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="MENUCATEGORYADDDATE"></asp:Parameter>
                                    <asp:Parameter Name="MENUTYPEID" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                        </div>
                    </div>
                </div>
         </div>


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_category" runat="server" PopupControlID="pnlcategorydone" TargetControlID="LinkButton1" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlcategorydone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add Cetgory</h4>
            </div>
            <div class="modal-body">
                <label>Category has been added successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose1" runat="server"></asp:LinkButton>
                <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
            </div>
        </div>
    </asp:Panel>

      <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_errorCategory" runat="server" PopupControlID="pnlerrorCategory" TargetControlID="LinkButton2" CancelControlID="lnkclose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlerrorCategory" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add New Category</h4>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_errorCategory" runat="server"></asp:Label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose2" runat="server"  class="btn btn-success">OK</asp:LinkButton>
                
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

