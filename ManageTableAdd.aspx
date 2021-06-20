<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageTableAdd.aspx.vb" Inherits="ManageTableAdd" %>

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
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Add Table</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Customer</li>
                        <li class="breadcrumb-item">Manage Table</li>
                        <li class="breadcrumb-item font-bold">Add Table</li>
                    </ol>
                </div>
              
            </div>

     <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
                
                    <div class="row">
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewtable" runat="server" class="btn btn-info btn-block" ><i class="ti-plus text"></i> Table</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnedittable" runat="server" class="btn btn-outline-info btn-block" ><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbaletable" runat="server" class="btn btn-outline-info btn-block" ><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
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
             <!-- Row -->

             <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">Add Table</h4>
                                    </div>
                                    <div class="card-body">

                                        <div class="form-body">
                                            <h3 class="box-title">Table Info</h3>
                                            <hr class="m-t-0 m-b-40">

                                            <div class="row">
                                              <!--/span-->
                                                    <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">Table Number</label>
                                                        <div class="col-md-9">
                                                            <div class="controls">
                                                                <asp:textbox ID="txtTableNum" runat="server" class="form-control"></asp:textbox>
                                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtTableNum" ValidationGroup="UpdateTable" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                                </div>
                                                            <asp:Label ID="lblerrorTable" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                                            </div>
                                                        </div>
                                                        </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Number of Seat</label>
                                                    <div class="col-md-9">
                                                        <div class="controls">
                                                        <asp:textbox ID="txtSeatNum" runat="server" class="form-control"></asp:textbox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtSeatNum" ValidationGroup="UpdateTable" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                        </div>
                                                
                                                    </div>
                                                </div>
                                            </div>
                                                </div>
                                                <!--/span-->

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <asp:Button ID="btnUpdtTable" runat="server" ValidationGroup="UpdateTable" Text="Add Table" class="btn btn-outline-info btn-lg btn-block" style="font-size: medium;"/> 
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                    </div>
                                </div>

    <!-- Row -->

             <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">Table List</h4>
                                    </div>
                                    <div class="card-body">

                                       
                                            
                                                <div style="overflow-x:auto;">
                                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="TABLEID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                                                        <Columns>
                                                            <asp:BoundField DataField="TABLENUM" HeaderText="TABLENUM" ReadOnly="True" SortExpression="TABLENUM" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            <asp:BoundField DataField="TABLESEATNUM" HeaderText="TABLESEATNUM" SortExpression="TABLESEATNUM" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            <asp:BoundField DataField="TABLESTATUS" HeaderText="TABLESTATUS" SortExpression="TABLESTATUS" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            <asp:BoundField DataField="TABLECHANGEBY" HeaderText="TABLECHANGEBY" SortExpression="TABLECHANGEBY" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            <asp:BoundField DataField="TABLECHANGEDATE" HeaderText="TABLECHANGEDATE" SortExpression="TABLECHANGEDATE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            
                                                            <asp:BoundField DataField="TABLEADDDATE" HeaderText="TABLEADDDATE" SortExpression="TABLEADDDATE" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                            <asp:BoundField DataField="TABLEADDBY" HeaderText="TABLEADDBY" SortExpression="TABLEADDBY" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>


                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [TABLEID], [TABLENUM], [TABLECHANGEBY], [TABLECHANGEDATE], [TABLESEATNUM], [TABLEADDDATE], [TABLEADDBY], [TABLESTATUS] FROM [SHOPLIFYRESTAURANTTABLE]"></asp:SqlDataSource>
                                                </div>
                                               
                                            
                                        </div>
                                    </div>
                                </div>
                 </div>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_table" runat="server" PopupControlID="pnltabledone" TargetControlID="LinkButton1" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnltabledone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add Table</h4>
            </div>
            <div class="modal-body">
                <label>Table has been added successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose1" runat="server"></asp:LinkButton>
                <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_errorTable" runat="server" PopupControlID="pnlerrorTable" TargetControlID="LinkButton2" CancelControlID="lnkclose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlerrorTable" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add New Table</h4>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_errorTable" runat="server"></asp:Label>
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

