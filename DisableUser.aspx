<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="DisableUser.aspx.vb" Inherits="DisableUser" %>

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
                     <h3 class="page-header"><i class="mdi mdi-account-off"></i>&nbsp Disable User</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">User Control</li>
                        <li class="breadcrumb-item font-bold">Disable User</li>
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
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">
<div style="overflow-x:auto;">

    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="USEREMPLOYEEID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
        <Columns>
            <asp:ImageField HeaderText="Photo" DataImageUrlField="USERPICTURE" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
            <asp:BoundField DataField="USEREMPLOYEEID" HeaderText="Employee Id" ReadOnly="True" SortExpression="USEREMPLOYEEID"></asp:BoundField>
            <asp:BoundField DataField="USERFULLNAME" HeaderText="Full Name" SortExpression="USERFULLNAME"></asp:BoundField>
            
            <asp:TemplateField HeaderText="Status" SortExpression="USERSTATUS">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("USERSTATUS") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <span class="label label-danger"><asp:Label runat="server" Text='<%# Bind("USERSTATUS") %>' ID="Label1"></asp:Label></span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME"></asp:BoundField>
            <asp:BoundField DataField="USERBRANCH" HeaderText="Branch" SortExpression="USERBRANCH"></asp:BoundField>
            <asp:BoundField DataField="USERSECTION" HeaderText="Section" SortExpression="USERSECTION"></asp:BoundField>
            <asp:BoundField DataField="USERLEVEL" HeaderText="Level" SortExpression="USERLEVEL"></asp:BoundField>
            <asp:BoundField DataField="USERGENDER" HeaderText="Gender" SortExpression="USERGENDER"></asp:BoundField>
            <asp:BoundField DataField="USERLASTLOGIN" HeaderText="Last Login" SortExpression="USERLASTLOGIN"></asp:BoundField>
            <asp:BoundField DataField="USERCREATEBY" HeaderText="Created By" SortExpression="USERCREATEBY"></asp:BoundField>
            <asp:BoundField DataField="USERCREATEDATE" HeaderText="Created Date" SortExpression="USERCREATEDATE"></asp:BoundField>
            <asp:BoundField DataField="USERCHANGEBY" HeaderText="Change By" SortExpression="USERCHANGEBY"></asp:BoundField>
            <asp:BoundField DataField="USERCHANGEDATE" HeaderText="Change Date" SortExpression="USERCHANGEDATE"></asp:BoundField>
            <asp:BoundField DataField="USERLASTPASSWORDCHANGE" HeaderText="Last Password Change" SortExpression="USERLASTPASSWORDCHANGE"></asp:BoundField>
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [USEREMPLOYEEID], [USERNAME], [USERSTATUS], [USERFULLNAME], [USERLEVEL], [USERLASTLOGIN], [USERSECTION], [USERCREATEBY], [USERCREATEDATE], [USERCHANGEBY], [USERCHANGEDATE], [USERBRANCH], [USERLASTPASSWORDCHANGE], [USERGENDER], [USERPICTURE] FROM [SHOPLIFYUSER] WHERE ([USERSTATUS] = @USERSTATUS)">
        <SelectParameters>
            <asp:Parameter DefaultValue="DISABLE" Name="USERSTATUS" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
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
        $(function() {
            bindDataTable(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
        });
        
        $(function bindDataTable() {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
            });
        });

        </script>


</asp:Content>

