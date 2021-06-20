<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="AddNewUser.aspx.vb" Inherits="AddNewUser" %>

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
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Add New User</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">User Control</li>
                            <li class="breadcrumb-item font-bold">Add New User</li>
                        
                    </ol>
                </div>
              
            </div>

    <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card"  style="background-color:#f4f6f9">
                
                    <div class="row">
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewuser" runat="server" class="btn btn-info btn-block"><i class="ti-plus text"></i> User</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnedituser" runat="server" class="btn btn-outline-info btn-block"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
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

            <!-- Row -->
    
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">Add New User</h4>
                                    </div>
                                    <div class="card-body">
                                         
                                            <div class="form-body">
                                                <h3 class="box-title">User Info</h3>
                                                <hr class="m-t-0 m-b-40">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Full Name</label>
                                                            <div class="col-md-9">
                                                                <div class="controls">
                                                                <asp:textbox ID="txtFullName" runat="server" class="form-control" required data-validation-required-message="This field is required"></asp:textbox>
                                                                 </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Emails</label>
                                                            <div class="col-md-9">
                                                                <div class="controls">
                                                                <asp:textbox ID="txtEmail" runat="server" class="form-control" placeholder="abc@gmail.com" required data-validation-required-message="This field is required"></asp:textbox>
                                                                </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                </div>
                                                <!--/row-->
                                                <div class="row">
                                                     <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Employee ID</label>
                                                            <div class="col-md-9">
                                                                <div class="controls">
                                                                <asp:textbox ID="txtEmpId" runat="server" class="form-control" required data-validation-required-message="This field is required"></asp:textbox>
                                                                
                                                                 </div>
                                                                <asp:Label ID="lblerrorID" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                            
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Gender</label>
                                                            <div class="col-md-9">
                                                                <div class="m-b-10">  
                                                                    <asp:DropDownList ID="DropDownList4" runat="server" class="form-control custom-select">
                                                                        <asp:ListItem Value="Male"></asp:ListItem>
                                                                        <asp:ListItem Value="Female"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                 </div>
                                                
                                                    
                                                   
                                                    
                                                <!--/span-->
                                                </div>
                                             
                                                <!--/row-->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            
                                                            <label class="control-label text-right col-md-3">Branch</label>
                                                            <div class="col-md-9">
                                                                <div class="controls">
                                                            <asp:DropDownList class="form-control custom-select" ID="DropDownList1" runat="server" 
                                                                DataSourceID="SqlDataSource2" 
                                                                DataTextField="BRANCHNAME" 
                                                                DataValueField="BRANCHNAME"
                                                                AppendDataBoundItems="True"
                                                                required data-validation-required-message="This field is required">
                                                                <asp:ListItem Value="" Text="Select User Branch">-- Select user branch -- </asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoplifyConnectionString %>" SelectCommand="SELECT [BRANCHNAME] FROM [SHOPLIFYBRANCH]"></asp:SqlDataSource>
                                                           </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Section</label>
                                                            <div class="col-md-9">
                                                                 <div class="controls">
                                                                <asp:DropDownList class="form-control custom-select" ID="DropDownList2" runat="server" 
                                                                    DataSourceID="SqlDataSource3" 
                                                                    DataTextField="SECTIONNAME" 
                                                                    DataValueField="SECTIONNAME"
                                                                    AppendDataBoundItems="True"
                                                                    required data-validation-required-message="This field is required">
                                                                    <asp:ListItem Value="" Text="Select user section">-- Select User Section -- </asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [SECTIONNAME] FROM [SHOPLIFYSECTION]"></asp:SqlDataSource>
                                                                </div>
                                                              
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>

                                                    <!--/span-->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-3">Level</label>
                                                            <div class="col-md-9">
                                                                 <div class="controls">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" class="form-control custom-select"
                                                                    DataSourceID="SqlDataSource4" 
                                                                    DataTextField="LEVELNAME" 
                                                                    DataValueField="LEVELNAME"
                                                                    AppendDataBoundItems="True"
                                                                    required data-validation-required-message="This field is required">
                                                                 <asp:ListItem Value="" Text="Select User Level">-- Select user level -- </asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [LEVELNAME] FROM [SHOPLIFYLEVEL]"></asp:SqlDataSource>
                                                              </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                        </div>
                                            <div class="form-actions">
                                             <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-success" />
                                        
                                    </div>
                             
                                            </div>
                                    
                                    </div>
                                
                                </div>
                            </div>
              
    

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">User List</h4>
                                    </div>
                                    <div class="card-body">

                                        
                                        <div style="overflow-x:auto;">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                                            <Columns>
                                                <asp:ImageField HeaderText="Photo" DataImageUrlField="USERPICTURE" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
                                                <asp:BoundField DataField="USEREMPLOYEEID" HeaderText="EmployeeID" SortExpression="USEREMPLOYEEID" />
                                                <asp:BoundField DataField="USERFULLNAME" HeaderText="Full Name" SortExpression="USERFULLNAME" />
                                                <asp:BoundField DataField="USERSTATUS" HeaderText="Status" SortExpression="USERSTATUS" />
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
                                    </div>
                                </div>
        </div>
   
    
   
    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_adduserdone" runat="server" PopupControlID="pnladduserdone" TargetControlID="LinkButton1" CancelControlID="lnkclose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnladduserdone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add New User</h4>
            </div>
            <div class="modal-body">
                <label>User has been added successfully. Login details has been sent to user email</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose" runat="server"></asp:LinkButton>
                <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
            </div>
        </div>
    </asp:Panel>


                                                   


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

    <!--Custom JavaScript -->
    
    <script src="assets/js/validation.js"></script>
    <script>
    ! function(window, document, $) {
        "use strict";
        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
    }(window, document, jQuery);
    </script>

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

