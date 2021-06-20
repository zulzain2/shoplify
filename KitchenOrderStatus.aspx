<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="KitchenOrderStatus.aspx.vb" Inherits="KitchenOrderStatus" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

       <link rel="stylesheet" type="text/css" href="assets/plugins/datatables/media/css/dataTables.bootstrap4.css">
    <style>
    .pagination-ys {
    /*display: inline-block;*/
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}
 
.pagination-ys table > tbody > tr > td {
    display: inline;
}
 
.pagination-ys table > tbody > tr > td > a,
.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;
    color: #dd4814;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    margin-left: -1px;
}
 
.pagination-ys table > tbody > tr > td > span {
    position: relative;
    float: left;
    padding: 8px 12px;
    line-height: 1.42857143;
    text-decoration: none;    
    margin-left: -1px;
    z-index: 2;
    color: #aea79f;
    background-color: #f5f5f5;
    border-color: #dddddd;
    cursor: default;
}
 
.pagination-ys table > tbody > tr > td:first-child > a,
.pagination-ys table > tbody > tr > td:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
}
 
.pagination-ys table > tbody > tr > td:last-child > a,
.pagination-ys table > tbody > tr > td:last-child > span {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px;
}
 
.pagination-ys table > tbody > tr > td > a:hover,
.pagination-ys table > tbody > tr > td > span:hover,
.pagination-ys table > tbody > tr > td > a:focus,
.pagination-ys table > tbody > tr > td > span:focus {
    color: #97310e;
    background-color: #eeeeee;
    border-color: #dddddd;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Order Status</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">Manage Order</li>
                            <li class="breadcrumb-item font-bold">Order Status</li>
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
                                        <h4 class="m-b-0 text-white">Order Status</h4>
                                    </div>
                                    <div class="card-body">
                                          <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                       <ContentTemplate>

                                        <h3>Order show for current day.</h3>
                                        <div style="overflow-x:auto;">
                                            <asp:Timer ID="Timer1" runat="server" Interval="10000" ontick="Timer1_Tick"></asp:Timer>
                                            <asp:Label runat="server" Text="Page not refreshed yet." id="Label1"></asp:Label>

                                            <asp:GridView ID="GridView1" OnDataBound="OnDataBound" PageSize="20" CssClass="table table-bordered table-striped gvv" runat="server" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available." AllowPaging="True">
                                                <Columns>
                                                    <asp:BoundField DataField="ORDERFINALNUM" HeaderText="Order Num" SortExpression="ORDERFINALNUM" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERTABLE" HeaderText="Table" SortExpression="ORDERTABLE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERMENUCODE" HeaderText="Code" SortExpression="ORDERMENUCODE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="MENUNAME" HeaderText="Name" SortExpression="MENUNAME" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERDESCRIPTION" HeaderText="Description" SortExpression="ORDERDESCRIPTION" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERSTATUS" HeaderText="Status" SortExpression="ORDERSTATUS" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="MENUPRICE" HeaderText="Price" SortExpression="MENUPRICE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERQUANTITY" HeaderText="Quantity" SortExpression="ORDERQUANTITY" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERTOTALPRICE" HeaderText="Total Price" SortExpression="ORDERTOTALPRICE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="TOTALMENUORDER" HeaderText="Total Quantity" SortExpression="TOTALMENUORDER" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="Expr1" HeaderText="Total" SortExpression="Expr1" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="MENUTYPE" HeaderText="Type" SortExpression="MENUTYPE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="MENUSETTYPE" HeaderText="Type" SortExpression="MENUSETTYPE" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERTAKEBY" HeaderText="Take By" SortExpression="ORDERTAKEBY" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField DataField="ORDERTAKETIME" HeaderText="Take Time" SortExpression="ORDERTAKETIME" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                </Columns>
                                                <PagerStyle CssClass="pagination-ys" />
                                            </asp:GridView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERDESCRIPTION, SHOPLIFYORDER.ORDERTAKEBY, SHOPLIFYORDER.ORDERTAKETIME, SHOPLIFYORDER.ORDERSTATUS, SHOPLIFYORDER.ORDERTABLE, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYORDERTOTAL.ORDERTOTALPRICE AS Expr1, SHOPLIFYORDERTOTAL.TOTALMENUORDER, SHOPLIFYORDERTOTAL.ORDERFINALNUM, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYMENUMASTER.MENUCATEGORY, SHOPLIFYMENUMASTER.MENUPICTURE, SHOPLIFYMENUMASTER.MENUTYPE, SHOPLIFYMENUMASTER.MENUSETTYPE FROM SHOPLIFYORDER INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE WHERE SHOPLIFYORDER.ORDERTAKETIME BETWEEN @STARTDATE AND @ENDDATE ORDER BY ORDERFINALNUM DESC">
                                                <SelectParameters>
                                                    <asp:SessionParameter SessionField="datetimestart" Name="STARTDATE" Type="DateTime"></asp:SessionParameter>
                                                    <asp:SessionParameter SessionField="datetimeend" Name="ENDDATE" Type="DateTime"></asp:SessionParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        

                           
                            </ContentTemplate>
                   </asp:UpdatePanel>

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
        
        
        $(function bindDataTable() {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
            });
        });

        </script>
</asp:Content>


