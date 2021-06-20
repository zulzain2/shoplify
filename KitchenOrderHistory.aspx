<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="KitchenOrderHistory.aspx.vb" Inherits="KitchenOrderHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/media/css/dataTables.bootstrap4.css">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Order History</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">Kitchen</li>
                            <li class="breadcrumb-item font-bold">Order History</li>
                    </ol>
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
                                        <h4 class="m-b-0 text-white">Order History</h4>
                                    </div>
                                    <div class="card-body">
                                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ORDERFINALNUM" SortExpression="ORDERFINALNUM" ItemStyle-HorizontalAlign="Center">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("ORDERFINALNUM") %>' ID="TextBox1"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        
                                                         <asp:LinkButton ID="viewMenu" runat="server" CommandName="view" CommandArgument='<%# Bind("ORDERFINALNUM") %>'><i class="fas fa-eye fa-lg" style="color:#398bf7"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="ORDERFINALNUM" HeaderText="ORDERFINALNUM" SortExpression="ORDERFINALNUM"></asp:BoundField>
                                                
                                                
                                                <asp:BoundField DataField="ORDERTAKEBY" HeaderText="ORDERTAKEBY" SortExpression="ORDERTAKEBY"></asp:BoundField>
                                                <asp:BoundField DataField="ORDERTAKETIME" HeaderText="ORDERTAKETIME" SortExpression="ORDERTAKETIME"></asp:BoundField>
                                                
                                                <asp:BoundField DataField="FINALORDERSTATUS" HeaderText="FINALORDERSTATUS" SortExpression="FINALORDERSTATUS"></asp:BoundField>
                                                
                                            </Columns>
                                        </asp:GridView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [ORDERTOTALPRICE], [TOTALMENUORDER], [ORDERTAKEBY], [ORDERTAKETIME], [ORDERFINALNUM], [FINALORDERSTATUS], [TOTALMENUREJECT] FROM [SHOPLIFYORDERTOTAL] ORDER BY ORDERFINALNUM DESC"></asp:SqlDataSource>
                                    </div>
                                    </div>
                                </div>
           </div>

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

