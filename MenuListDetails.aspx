<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuListDetails.aspx.vb" Inherits="MenuListDetails" %>

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
                     <h3 class="page-header"><i class="mdi mdi-format-list-numbers"></i>&nbsp Menu List</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Menu Master</li>
                        <li class="breadcrumb-item font-bold">Menu List</li>
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
            <!-- Start Menu List -->
            <!-- ============================================================== -->


             <div class="row">
                    <div class="col-lg-12">
                        <div class="card ">
                            <div class="card-header bg-info">
                                <h4 class="m-b-0 text-white">Menu List</h4>
                            </div>
                            <div class="card-body">
                                <div style="overflow-x:auto;">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns ="False" DataKeyNames="MENUNAME" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                            <Columns>
                                <asp:BoundField DataField="MENUCODE" HeaderText="MENUCODE" SortExpression="MENUCODE"></asp:BoundField>
                                <asp:ImageField HeaderText="Photo" DataImageUrlField="MENUPICTURE" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
                                <asp:BoundField DataField="MENUNAME" HeaderText="MENUNAME" SortExpression="MENUNAME" ReadOnly="True"></asp:BoundField>
                                <asp:TemplateField HeaderText="MENUPRICE" SortExpression="MENUPRICE">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("MENUPRICE") %>' ID="TextBox2"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        RM <asp:Label runat="server" Text='<%# Bind("MENUPRICE") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="MENUCATEGORY" HeaderText="MENUTYPE" SortExpression="MENUCATEGORY"></asp:BoundField>
                                <asp:TemplateField HeaderText="MENUDETAIL" SortExpression="MENUDETAIL">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="TextBox1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="MENUSTATUS" HeaderText="MENUSTATUS" SortExpression="MENUSTATUS"></asp:BoundField>
                                <asp:BoundField DataField="MENUTYPE" HeaderText="MENUTYPE" SortExpression="MENUTYPE"></asp:BoundField>
                                <asp:BoundField DataField="MENUSETTYPE" HeaderText="MENUSETTYPE" SortExpression="MENUSETTYPE"></asp:BoundField>
                                <asp:BoundField DataField="MENUADDDATE" HeaderText="MENUADDDATE" SortExpression="MENUADDDATE"></asp:BoundField>
                                <asp:BoundField DataField="MENUCHANGEDATE" HeaderText="MENUCHANGEDATE" SortExpression="MENUCHANGEDATE"></asp:BoundField>
                                <asp:BoundField DataField="MENUCHANGEBY" HeaderText="MENUCHANGEBY" SortExpression="MENUCHANGEBY"></asp:BoundField>
                            </Columns>

                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUDETAIL], [MENUCODE], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER] WHERE ([MENUCATEGORY] = @MENUCATEGORY)">
                    <SelectParameters>
            <asp:QueryStringParameter QueryStringField="menucategory" Name="MENUCATEGORY" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
                            </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>

            <!-- ============================================================== -->
            <!-- End Menu List -->
            <!-- ============================================================== -->
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

