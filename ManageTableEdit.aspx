<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageTableEdit.aspx.vb" Inherits="ManageTableEdit" %>

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
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Edit Table</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Customer</li>
                        <li class="breadcrumb-item">Manage Table</li>
                        <li class="breadcrumb-item font-bold">Edit Table</li>
                    </ol>
                </div>
              
            </div>

    <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
               
                    <div class="row">
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewtable" runat="server" class="btn btn-outline-info btn-block"><i class="ti-plus text"></i> Table</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnedittable" runat="server" class="btn btn-info btn-block"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbaletable" runat="server" class="btn btn-outline-info btn-block"><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
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
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataKeyNames="TABLEID" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
                                <Columns>
                                   
                                    <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" OnClientClick="return confirm('Are You Sure to Update?');" CausesValidation="True" ID="LinkButton1"><i class="fas fa-check fa-lg" style="color:green"></i></asp:LinkButton>
                                            <br /> 
                                            <br />
                                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"><i class="fas fa-times fa-lg" style="color:red"></i></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="far fa-edit fa-lg" style="color:#398bf7"></i></asp:LinkButton>&nbsp &nbsp &nbsp
                                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2" OnClientClick="return confirm('Are You Sure to Delete?');"><i class="fas fa-trash-alt fa-lg" style="color:red"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TABLENUM" SortExpression="TABLENUM" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("TABLENUM") %>' ID="Label1" CssClass="form-control"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLENUM") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="TABLESEATNUM" SortExpression="TABLESEATNUM" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("TABLESEATNUM") %>' ID="TextBox3" CssClass="form-control"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLESEATNUM") %>' ID="Label4"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TABLESTATUS" SortExpression="TABLESTATUS" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLESTATUS") %>' ID="TextBox6"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLESTATUS") %>' ID="Label7"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TABLECHANGEBY" SortExpression="TABLECHANGEBY" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLECHANGEBY") %>' ID="TextBox1"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLECHANGEBY") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TABLECHANGEDATE" SortExpression="TABLECHANGEDATE" ItemStyle-HorizontalAlign="Center" >
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLECHANGEDATE", "{0:dd/MM/yyyy}") %>' ID="TextBox2"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLECHANGEDATE", "{0:dd/MM/yyyy}") %>' ID="Label3"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="TABLEADDDATE" SortExpression="TABLEADDDATE" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLEADDDATE", "{0:dd/MM/yyyy}") %>' ID="TextBox4"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLEADDDATE", "{0:dd/MM/yyyy}") %>' ID="Label5"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TABLEADDBY" SortExpression="TABLEADDBY" ItemStyle-HorizontalAlign="Center">
                                        <EditItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLEADDBY") %>' ID="TextBox5"></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("TABLEADDBY") %>' ID="Label6"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                                </div>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' 
                                DeleteCommand="DELETE FROM [SHOPLIFYRESTAURANTTABLE] WHERE [TABLEID] = @TABLEID" 
                                InsertCommand="INSERT INTO [SHOPLIFYRESTAURANTTABLE] ([TABLENUM], [TABLECHANGEBY], [TABLECHANGEDATE], [TABLESEATNUM], [TABLEADDDATE], [TABLEADDBY], [TABLESTATUS]) VALUES (@TABLENUM, @TABLECHANGEBY, @TABLECHANGEDATE, @TABLESEATNUM, @TABLEADDDATE, @TABLEADDBY, @TABLESTATUS)" 
                                SelectCommand="SELECT [TABLEID], [TABLENUM], [TABLECHANGEBY], [TABLECHANGEDATE], [TABLESEATNUM], [TABLEADDDATE], [TABLEADDBY],[TABLESTATUS] FROM [SHOPLIFYRESTAURANTTABLE]" 
                                UpdateCommand="UPDATE [SHOPLIFYRESTAURANTTABLE] SET [TABLENUM] = @TABLENUM, [TABLECHANGEBY] = @TABLECHANGEBY, [TABLECHANGEDATE] = @TABLECHANGEDATE, [TABLESEATNUM] = @TABLESEATNUM, [TABLEADDDATE] = @TABLEADDDATE, [TABLEADDBY] = @TABLEADDBY, [TABLESTATUS] = @TABLESTATUS WHERE [TABLEID] = @TABLEID">
                                <DeleteParameters>
                                    <asp:Parameter Name="TABLEID" Type="String"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="TABLEID" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="TABLENUM" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="TABLECHANGEBY" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="TABLECHANGEDATE"></asp:Parameter>
                                    <asp:Parameter Name="TABLESEATNUM" Type="Int32"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="TABLEADDDATE"></asp:Parameter>
                                    <asp:Parameter Name="TABLEADDBY" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="TABLESTATUS" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    
                                    <asp:Parameter Name="TABLECHANGEBY" Type="String"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="TABLECHANGEDATE"></asp:Parameter>
                                    <asp:Parameter Name="TABLESEATNUM" Type="Int32"></asp:Parameter>
                                    <asp:Parameter DbType="Date" Name="TABLEADDDATE"></asp:Parameter>
                                    <asp:Parameter Name="TABLEADDBY" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="TABLENUM" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="TABLESTATUS" Type="String"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
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

