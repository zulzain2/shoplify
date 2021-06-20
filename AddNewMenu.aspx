<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddNewMenu.aspx.vb" Inherits="AddNewMenu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="assets/plugins/dropify/dist/css/dropify.min.css">

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
                     <h3 class="page-header"><i class="mdi mdi-food"></i>&nbsp Add New Menu</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Menu Master</li>
                        <li class="breadcrumb-item font-bold">Add New Menu</li>
                    </ol>
                </div>
              
            </div>
   <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card" style="background-color:#f4f6f9">
               
                    <div class="row">
             <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnaddnewmenu" runat="server" class="btn btn-info btn-block"><i class="ti-plus text"></i> Menu</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnadddeletecategory" runat="server" class="btn btn-outline-info btn-block"><i class="ti-plus text"></i>/<i class="mdi mdi-delete text"></i> Category</asp:LinkButton>
             </div>
                 
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btneditmenu" runat="server" class="btn btn-outline-info btn-block"><i class="fas fa-edit"></i> Edit</asp:LinkButton>
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

            <!-- ============================================================== -->
            <!-- Start Add New Menu -->
            <!-- ============================================================== -->

            <div class="row">
            <div class="col-lg-12">
                <div class="card ">
                    <div class="card-header bg-info">
                        <h4 class="m-b-0 text-white">Add New Menu</h4>
                    </div>
                    <div class="card-body">

                        <div class="form-body">
                                <h3 class="box-title">Menu Info</h3>
                                <hr class="m-t-0 m-b-40">

                            <div class="row">
                                  <!--/span-->
                                        <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Category</label>
                                            <div class="col-md-9">
                                                <div class="m-b-10">  
                                                    <asp:DropDownList runat="server" class="form-control custom-select" ID="DropDownList1"
                                                        DataSourceID="SqlDataSource1" 
                                                        DataTextField="MENUCATEGORYNAME" 
                                                        DataValueField="MENUCATEGORYNAME"
                                                        AppendDataBoundItems="True"
                                                        required data-validation-required-message="This field is required">
                                                        <asp:ListItem Value="" Text="Select Menu Type">-- Select Menu Category -- </asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="DropDownList1" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                

                            <!--/span-->
                                        <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Serve Type</label>
                                            <div class="col-md-9">
                                                <div class="m-b-10">  
                                                   

                                                    <asp:DropDownList ID="DropDownList3" class="form-control custom-select" runat="server" 
                                                        DataSourceID="SqlDataSource4" 
                                                        DataTextField="MENUTYPENAME" 
                                                        DataValueField="MENUTYPENAME"
                                                        AppendDataBoundItems="True"
                                                        required data-validation-required-message="This field is required">
                                                        <asp:ListItem Value="" Text="Select Menu Type">-- Select Serve Type -- </asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUTYPENAME] FROM [SHOPLIFYMENUTYPE2]"></asp:SqlDataSource>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="DropDownList3" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>

                             <div class="row">
                                  <!--/span-->
                                          <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Menu Type</label>
                                            <div class="col-md-9">
                                                <div class="m-b-10">  
                                                   

                                                    

                                                    <asp:DropDownList ID="DropDownList4" class="form-control custom-select" runat="server" 
                                                        DataSourceID="SqlDataSource3" 
                                                        DataTextField="MENUTYPE3NAME" 
                                                        DataValueField="MENUTYPE3NAME"
                                                        AppendDataBoundItems="True"
                                                        required data-validation-required-message="This field is required">
                                                        <asp:ListItem Value="" Text="Select Menu Type">-- Select Menu Type -- </asp:ListItem>
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUTYPE3NAME] FROM [SHOPLIFYMENUTYPE3]"></asp:SqlDataSource>
                                                    
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"  ControlToValidate="DropDownList4" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                 </div>


                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Menu Name</label>
                                            <div class="col-md-9">
                                                <div class="controls">
                                                <asp:textbox ID="txtMenuName" runat="server" class="form-control"></asp:textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtMenuName" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                </div>
                                                
                                                </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Code</label>
                                            <div class="col-md-9">
                                                <div class="controls">
                                                <asp:textbox ID="txtMenuCode" runat="server" class="form-control"></asp:textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtMenuCode" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                </div>
                                                <asp:Label ID="lblerrorMenu" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                                </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    

                                    

                                    <!--/span-->
                                </div>
                                <!--/row-->
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Price</label>
                                            <div class="col-md-9">
                                                <div class="controls">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="basic-addon1">RM</span>
                                                        </div>
                                                        <div class="input-group-prepend">
                                                        <span class="input-group-text">0.00</span>
                                                    </div>
                                                        <asp:textbox ID="txtMenuPrice" runat="server" class="form-control"></asp:textbox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtMenuPrice" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                    </div>
                                                </div>
                                                </div>
                                        </div>
                                    </div>
                                   
                                   

                                     <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Details</label>
                                            <div class="col-md-9">
                                                <div class="controls">
                                                <asp:TextBox id="txtMenuDetails" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control" />  
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="txtMenuDetails" ValidationGroup="UpdateMenu" ErrorMessage="Required Field" CssClass="text-danger"/>    
                                                </div>
                                             
                                                </div>
                                            </div>
                                        </div>

                                      
                                    </div>

                             

                            <!--/row-->
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <label class="control-label text-right"><b>Menu Picture</b></label>
                                        </div>
                                    </div>


                             <!--/row-->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                             <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                            <asp:FileUpload ID="fileMenu" runat="server" class="dropify" data-default-file="" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fileMenu" ValidationGroup="UpdateMenu" ErrorMessage="Please select your new Profile Picture." CssClass="text-danger"/>
                                            </div>
                                            </div>
                                        </div>

                                </div>

                            <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnUpdtMenu" runat="server" ValidationGroup="UpdateMenu" Text="Add Menu" class="btn btn-outline-info btn-lg btn-block" style="font-size: medium;"/> 
                                        </div>
                                    </div>
                                </div>
                                               
                                <!--/span-->
                                </div>


                    </div>
                </div>
           </div>
           </div>

            <!-- ============================================================== -->
            <!-- End Add New Menu -->
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
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns ="False" DataKeyNames="MENUID" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="True" EmptyDataText="No Data Available">
                            <Columns>
                                <asp:BoundField DataField="MENUCODE" HeaderText="MENUCODE" SortExpression="MENUCODE"></asp:BoundField>
                                <asp:ImageField HeaderText="Photo" DataImageUrlField="MENUPICTURE" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
                                <asp:BoundField DataField="MENUNAME" HeaderText="MENUNAME" SortExpression="MENUNAME" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="MENUPRICE" HeaderText="MENUPRICE" SortExpression="MENUPRICE"></asp:BoundField>
                                <asp:BoundField DataField="MENUCATEGORY" HeaderText="MENUCATEGORY" SortExpression="MENUCATEGORY"></asp:BoundField>
                                <asp:BoundField DataField="MENUTYPE" HeaderText="MENUTYPE" SortExpression="MENUTYPE"></asp:BoundField>
                                <asp:BoundField DataField="MENUSETTYPE" HeaderText="MENUSETTYPE" SortExpression="MENUSETTYPE"></asp:BoundField>
                                <asp:TemplateField HeaderText="MENUDETAIL" SortExpression="MENUDETAIL">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="TextBox1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="MENUSTATUS" HeaderText="MENUSTATUS" SortExpression="MENUSTATUS"></asp:BoundField>
                                <asp:BoundField DataField="MENUADDDATE" HeaderText="MENUADDDATE" SortExpression="MENUADDDATE"></asp:BoundField>
                                <asp:BoundField DataField="MENUCHANGEDATE" HeaderText="MENUCHANGEDATE" SortExpression="MENUCHANGEDATE"></asp:BoundField>
                                <asp:BoundField DataField="MENUCHANGEBY" HeaderText="MENUCHANGEBY" SortExpression="MENUCHANGEBY"></asp:BoundField>
                            </Columns>

                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUID], [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUDETAIL], [MENUCODE], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER]"></asp:SqlDataSource>
                    </div>
                        </div>
                    </div>
                </div>
         </div>

            <!-- ============================================================== -->
            <!-- End Menu List -->
            <!-- ============================================================== -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_menu" runat="server" PopupControlID="pnlmenudone" TargetControlID="LinkButton1" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlmenudone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add Menu</h4>
            </div>
            <div class="modal-body">
                <label>Menu has been added successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose1" runat="server"></asp:LinkButton>
                <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_errorUname" runat="server" PopupControlID="pnlerrorUname" TargetControlID="LinkButton2" CancelControlID="lnkclose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlerrorUname" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add New Menu</h4>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_errorUname" runat="server"></asp:Label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose2" runat="server"  class="btn btn-success">OK</asp:LinkButton>
                
            </div>
        </div>
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

     <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>

    <!-- jQuery file upload -->
    <script src="assets/plugins/dropify/dist/js/dropify.min.js"></script>

    <script>
    $(document).ready(function() {
        // Basic
        $('.dropify').dropify();

        // Translated
        $('.dropify-fr').dropify({
            messages: {
                default: 'Glissez-déposez un fichier ici ou cliquez',
                replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                remove: 'Supprimer',
                error: 'Désolé, le fichier trop volumineux'
            }
        });

        // Used events
        var drEvent = $('#input-file-events').dropify();

        drEvent.on('dropify.beforeClear', function(event, element) {
            return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
        });

        drEvent.on('dropify.afterClear', function(event, element) {
            alert('File deleted');
        });

        drEvent.on('dropify.errors', function(event, element) {
            console.log('Has Errors');
        });

        var drDestroy = $('#input-file-to-destroy').dropify();
        drDestroy = drDestroy.data('dropify')
        $('#toggleDropify').on('click', function(e) {
            e.preventDefault();
            if (drDestroy.isDropified()) {
                drDestroy.destroy();
            } else {
                drDestroy.init();
            }
        })
        });
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

