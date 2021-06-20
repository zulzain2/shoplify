<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageMenu.aspx.vb" Inherits="Manage_Menu" %>

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
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Edit Menu</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Menu Master</li>
                        <li class="breadcrumb-item font-bold">Manage Menu</li>
                    </ol>
                </div>
              
            </div>

     <div class="row">
         <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
                
                    <div class="row">
             <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewmenu" runat="server" class="btn btn-outline-info btn-block"><i class="ti-plus text"></i> Menu</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnadddeletecategory" runat="server" class="btn btn-outline-info btn-block"><i class="ti-plus text"></i>/<i class="mdi mdi-delete text"></i> Category</asp:LinkButton>
             </div>
                 
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btneditmenu" runat="server" class="btn btn-info btn-block"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbalemenu" runat="server" class="btn btn-outline-info btn-block"><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
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
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">

                                        
                                        <div style="overflow-x:auto;">
                                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataKeyNames="MENUCATEGORYNAME" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
                                                
                                                <Columns>
                                                   

                                                    <asp:TemplateField HeaderText="ACTION" SortExpression="MENUCATEGORYNAME" ItemStyle-HorizontalAlign="Center">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Eval("MENUCATEGORYNAME") %>' ID="Label2"></asp:Label>
                                                        </EditItemTemplate>

                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="viewMenu" runat="server" CommandName="view" CommandArgument='<%# Bind("MENUCATEGORYNAME") %>'><i class="fas fa-eye fa-lg" style="color:#398bf7"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:BoundField DataField="MENUCATEGORYNAME" HeaderText="MENUCATEGORYNAME" ReadOnly="True" SortExpression="MENUCATEGORYNAME"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' 
                                                SelectCommand="SELECT [MENUTYPEID], [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                        </div>
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

