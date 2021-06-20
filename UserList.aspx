<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="UserList.aspx.vb" Inherits="UserList" %>

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
                     <h3 class="page-header"><i class="mdi mdi-account-card-details"></i>&nbsp User List</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">User Control</li>
                            <li class="breadcrumb-item font-bold">User List</li>
                        
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


                                    <div class="card-body" runat="server">
                                        
                                        
                                        <div style="overflow-x:auto;" runat="server">
                                           
                                            <asp:Label runat="server" Text="Page not refreshed yet." id="Label1"></asp:Label>
                                            

                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                                            <Columns>
                                                
                                                <asp:ImageField HeaderText="Photo" DataImageUrlField="USERPICTURE" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
                                                <asp:BoundField DataField="USEREMPLOYEEID" HeaderText="EmployeeID" SortExpression="USEREMPLOYEEID" />
                                                <asp:BoundField DataField="USERFULLNAME" HeaderText="Full Name" SortExpression="USERFULLNAME" />
                                                <asp:BoundField DataField="USERSTATUS" HeaderText="User Status" SortExpression="USERSTATUS" />
                                                <asp:BoundField DataField="USERNAME" HeaderText="Username" SortExpression="USERNAME" />
                                                <asp:BoundField DataField="USERGENDER" HeaderText="Gender" SortExpression="USERGENDER" />
                                                <asp:BoundField DataField="USERBRANCH" HeaderText="Branch" SortExpression="USERBRANCH" />
                                                <asp:BoundField DataField="USERSECTION" HeaderText="Section" SortExpression="USERSECTION" />
                                                <asp:BoundField DataField="USERLEVEL" HeaderText="Level" SortExpression="USERLEVEL" />
                                                <asp:BoundField DataField="USERCREATEBY" HeaderText="Create By" SortExpression="USERCREATEBY" />
                                                <asp:BoundField DataField="USERCREATEDATE" HeaderText="Create Date" SortExpression="USERCREATEDATE" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="USERLASTLOGIN" HeaderText="Last Login" SortExpression="USERLASTLOGIN" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="USERLASTPASSWORDCHANGE" HeaderText="Last Password Change" SortExpression="USERLASTPASSWORDCHANGE" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="USERCHANGEDATE" HeaderText="Change Date" SortExpression="USERCHANGEDATE" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="USERCHANGEBY" HeaderText="Change By" SortExpression="USERCHANGEBY" />
                                            </Columns>

                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoplifyConnectionString %>" SelectCommand="SELECT [USERPICTURE], [USERNAME], [USEREMAIL], [USERSTATUS], [USERFULLNAME], [USERLASTLOGIN], [USERLEVEL], [USERSECTION], [USERCREATEBY], [USERCREATEDATE], [USERCHANGEBY], [USERCHANGEDATE], [USERBRANCH], [USERLASTPASSWORDCHANGE], [USEREMPLOYEEID], [USERGENDER] FROM [SHOPLIFYUSER]"></asp:SqlDataSource>
                                            </div>
                                            
                                       

                                        
                                    </div>

                         <!--   </ContentTemplate>
                   </asp:UpdatePanel> -->

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

