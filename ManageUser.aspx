<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageUser.aspx.vb" Inherits="ManageUser" %>
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
                     <h3 class="page-header"><i class="mdi mdi-account-settings-variant"></i>&nbsp Manage User</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">User Control</li>
                        <li class="breadcrumb-item font-bold">Manage User</li>
                        
                    </ol>
                </div>
              
            </div>

      <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
                
                    <div class="row">
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewuser" runat="server" class="btn btn-outline-info btn-block" ><i class="ti-plus text"></i> User</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnedituser" runat="server" class="btn btn-info btn-block" ><i class="fas fa-edit"></i> Edit</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnenabledisbaleuser" runat="server" class="btn btn-outline-info btn-block"><i class="mdi mdi-book-open"></i> Activation</asp:LinkButton>
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
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">
<div style="overflow-x:auto;">

    <asp:GridView ID="manageuserlist" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="USEREMPLOYEEID,USERSTATUS" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
        <Columns>
            
         
            

            <asp:TemplateField HeaderText="ACTION" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <asp:LinkButton runat="server" Text="Update" OnClientClick="return confirm('Are You Sure to Update?');" CommandName="Update" CausesValidation="True" ID="LinkButton1"><i class="fas fa-check fa-lg" style="color:green"></i></asp:LinkButton>
                    <br /> 
                    <br />
                    <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"><i class="fas fa-times fa-lg" style="color:red"></i></asp:LinkButton> 
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1" ><i class="far fa-edit fa-lg" style="color:#398bf7"></i></asp:LinkButton> &nbsp
                     <asp:LinkButton runat="server" Text="Delete" OnClientClick="return confirm('Are You Sure to Delete?');" CommandName="Delete" CausesValidation="False" ID="LinkButton2"><i class="fas fa-trash-alt fa-lg" style="color:red"></i></asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>



            <asp:TemplateField HeaderText="Photo" >
                <EditItemTemplate>
                    
                        <asp:Image runat="server" ImageUrl='<%# Eval("USERPICTURE") %>' ID="Image2"></asp:Image>
                    
                    
                </EditItemTemplate>
                <ItemTemplate>
                    
                    <asp:Image runat="server" ImageUrl='<%# Eval("USERPICTURE") %>' ID="Image1"></asp:Image>
              
                    </ItemTemplate>

                <ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="EMPLOYEE ID" SortExpression="USEREMPLOYEEID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USEREMPLOYEEID") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USEREMPLOYEEID") %>' ID="Label6"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="FULL NAME" SortExpression="USERFULLNAME">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("USERFULLNAME") %>' ID="TextBox1" CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERFULLNAME") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="USERSTATUS" HeaderText="User Status" SortExpression="USERSTATUS" ReadOnly="true"/>

            <asp:TemplateField HeaderText="USERNAME" SortExpression="USERNAME">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERNAME") %>' ID="TextBox3"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERNAME") %>' ID="Label8"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="GENDER" SortExpression="USERGENDER">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("USERGENDER") %>' CssClass="form-control">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERGENDER") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="BRANCH" SortExpression="USERBRANCH">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="BRANCHNAME" DataValueField="BRANCHNAME" SelectedValue='<%# Bind("USERBRANCH") %>' CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [BRANCHNAME] FROM [SHOPLIFYBRANCH]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERBRANCH") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="LEVEL" SortExpression="USERLEVEL">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="LEVELNAME" DataValueField="LEVELNAME" SelectedValue='<%# Bind("USERLEVEL") %>' CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [LEVELNAME] FROM [SHOPLIFYLEVEL]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERLEVEL") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="SECTION" SortExpression="USERSECTION">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource4" DataTextField="SECTIONNAME" DataValueField="SECTIONNAME" SelectedValue='<%# Bind("USERSECTION") %>' CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [SECTIONNAME] FROM [SHOPLIFYSECTION]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERSECTION") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="LAST LOGIN" SortExpression="USERLASTLOGIN">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERLASTLOGIN") %>' ID="TextBox4"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERLASTLOGIN", "{0:dd/MM/yyyy}") %>' ID="Label9"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="LAST PASSWORD CHANGE" SortExpression="USERLASTPASSWORDCHANGE">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERLASTPASSWORDCHANGE") %>' ID="TextBox5"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERLASTPASSWORDCHANGE", "{0:dd/MM/yyyy}") %>' ID="Label10"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CREATE BY" SortExpression="USERCREATEBY">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCREATEBY") %>' ID="TextBox6"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCREATEBY") %>' ID="Label11"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CREATE DATE" SortExpression="USERCREATEDATE">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCREATEDATE") %>' ID="TextBox7"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCREATEDATE", "{0:dd/MM/yyyy}") %>' ID="Label12"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CHANGE DATE" SortExpression="USERCHANGEDATE">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCHANGEDATE") %>' ID="TextBox8"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCHANGEDATE", "{0:dd/MM/yyyy}") %>' ID="Label13"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CHANGE BY" SortExpression="USERCHANGEBY">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCHANGEBY") %>' ID="TextBox9"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("USERCHANGEBY") %>' ID="Label14"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

               
           
            

        </Columns>

    </asp:GridView>

     <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' DeleteCommand="DELETE FROM [SHOPLIFYUSER] WHERE [USEREMPLOYEEID] = @USEREMPLOYEEID" InsertCommand="INSERT INTO [SHOPLIFYUSER] ([USERNAME], [USERSTATUS], [USERFULLNAME], [USEREMPLOYEEID], [USERGENDER], [USERLEVEL], [USERSECTION], [USERBRANCH], [USERCREATEBY], [USERCREATEDATE], [USERCHANGEBY], [USERCHANGEDATE], [USERLASTPASSWORDCHANGE], [USERLASTLOGIN]) VALUES (@USERNAME, @USERSTATUS, @USERFULLNAME, @USEREMPLOYEEID, @USERGENDER, @USERLEVEL, @USERSECTION, @USERBRANCH, @USERCREATEBY, @USERCREATEDATE, @USERCHANGEBY, @USERCHANGEDATE, @USERLASTPASSWORDCHANGE, @USERLASTLOGIN)" SelectCommand="Select [USERPICTURE], [USEREMPLOYEEID], [USERNAME], [USERSTATUS], [USERFULLNAME], [USERLASTLOGIN], [USERLEVEL], [USERSECTION], [USERCREATEBY], [USERCREATEDATE], [USERBRANCH], [USERLASTPASSWORDCHANGE], [USERGENDER] , [USERCHANGEDATE], [USERCHANGEBY] FROM [SHOPLIFYUSER]" UpdateCommand="UPDATE [SHOPLIFYUSER] SET [USERNAME] = @USERNAME, [USERSTATUS] = @USERSTATUS, [USERFULLNAME] = @USERFULLNAME, [USERGENDER] = @USERGENDER, [USERLEVEL] = @USERLEVEL, [USERSECTION] = @USERSECTION, [USERBRANCH] = @USERBRANCH, [USERCREATEBY] = @USERCREATEBY, [USERCREATEDATE] = @USERCREATEDATE, [USERCHANGEBY] = @USERCHANGEBY, [USERCHANGEDATE] = @USERCHANGEDATE, [USERLASTPASSWORDCHANGE] = @USERLASTPASSWORDCHANGE, [USERLASTLOGIN] = @USERLASTLOGIN WHERE [USEREMPLOYEEID] = @USEREMPLOYEEID">
                <DeleteParameters>
                    <asp:Parameter Name="USEREMPLOYEEID" Type="String"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERSTATUS" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERFULLNAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USEREMPLOYEEID" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERGENDER" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERLEVEL" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERSECTION" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERBRANCH" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERCREATEBY" Type="String"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERCREATEDATE"></asp:Parameter>
                    <asp:Parameter Name="USERCHANGEBY" Type="String"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERCHANGEDATE"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERLASTPASSWORDCHANGE"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERLASTLOGIN"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERSTATUS" Type="String"></asp:Parameter>
                    <asp:Parameter Name="USERFULLNAME" Type="String"></asp:Parameter> 
                    <asp:Parameter Name="USERGENDER" Type="String"></asp:Parameter> 
                    <asp:Parameter Name="USERLEVEL" Type="String"></asp:Parameter> 
                    <asp:Parameter Name="USERSECTION" Type="String"></asp:Parameter> 
                    <asp:Parameter Name="USERBRANCH" Type="String"></asp:Parameter> 
                    <asp:Parameter Name="USERCREATEBY" Type="String"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERCREATEDATE"></asp:Parameter>
                    <asp:Parameter Name="USERCHANGEBY" Type="String"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERCHANGEDATE"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERLASTPASSWORDCHANGE"></asp:Parameter>
                    <asp:Parameter DbType="Date" Name="USERLASTLOGIN"></asp:Parameter>
                    <asp:Parameter Name="USEREMPLOYEEID" Type="String"></asp:Parameter>
                </UpdateParameters>
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

     $(function () {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                
            });
        });

        </script>

</asp:Content>

