<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageMenuDetails.aspx.vb" Inherits="ManageMenuDetails"  %>
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

    <!-- Popup CSS -->
    <link href="assets/plugins/Magnific-Popup-master/dist/magnific-popup.css" rel="stylesheet">
    <!-- page css -->
    <link href="assets/css/pages/user-card.css" rel="stylesheet">

     <link rel="stylesheet" href="assets/plugins/dropify/dist/css/dropify.min.css">


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
                        <li class="breadcrumb-item font-bold">Edit Menu</li>
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
                                    <div class="card-body">

                                        
                                        <div style="overflow-x:auto;">



                                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped gvv" HeaderStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataKeyNames="MENUID" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Available.">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ACTION" ItemStyle-HorizontalAlign="Center">
                                                        <EditItemTemplate>
                                                            <asp:LinkButton runat="server" Text="Update" OnClientClick="return confirm('Are You Sure to Update?');" CommandName="Update" CausesValidation="True" ID="LinkButton1"><i class="fas fa-check fa-lg" style="color:green"></i></asp:LinkButton>
                                                             <br /> 
                                                              <br />
                                                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"><i class="fas fa-times fa-lg" style="color:red"></i></asp:LinkButton>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"><i class="far fa-edit fa-lg" style="color:#398bf7"></i></asp:LinkButton> &nbsp
                                                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are You Sure to Delete?');" CausesValidation="False" ID="LinkButton2"><i class="fas fa-trash-alt fa-lg" style="color:red"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PICTURE" SortExpression="MENUPICTURE">
                                                        <EditItemTemplate>
                                                            <asp:FileUpload ID="fileDP" runat="server" class="dropify" data-default-file='<%# Eval("MENUPICTURE") %>' />
                                                             <asp:Label runat="server" Text='<%# Bind("MENUPICTURE") %>' ID="TextBox10" CssClass="form-control" Visible="false"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                             <div class="el-element-overlay">
                                                                <div class="card">
                                                                    <div class="el-card-item" style="padding-bottom:  0px;">
                                                                        <div class="el-card-avatar el-overlay-1"> <asp:Image runat="server" ImageUrl='<%# Bind("MENUPICTURE") %>' ID="Image1"></asp:Image>
                                                                            <div class="el-overlay">
                                                                                <ul class="el-info">
                                                                                    <li><asp:HyperLink ID="HyperLink1" runat="server" class="btn default btn-outline image-popup-vertical-fit" NavigateUrl='<%# Bind("MENUPICTURE") %>'><i class="icon-magnifier"></i></asp:HyperLink></li>
                                                                                   
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        
                                                                    </div>
                                                                </div>
                                                                 </div>

                                                        </ItemTemplate>

                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="MENUCODE" SortExpression="MENUCODE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUCODE") %>' ID="TextBox1" CssClass="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCODE") %>' ID="Label1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUNAME" SortExpression="MENUNAME">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUNAME") %>' ID="TextBox2" CssClass="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUNAME") %>' ID="Label2"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUPRICE" SortExpression="MENUPRICE">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUPRICE") %>' ID="TextBox3" CssClass="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUPRICE") %>' ID="Label3"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUCATEGORY" SortExpression="MENUCATEGORY">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                                                DataSourceID="SqlDataSource3" 
                                                                DataTextField="MENUCATEGORYNAME" 
                                                                DataValueField="MENUCATEGORYNAME" 
                                                                SelectedValue='<%# Bind("MENUCATEGORY") %>' 
                                                                CssClass="form-control">

                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCATEGORY") %>' ID="Label4"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUTYPE" SortExpression="MENUTYPE">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                                                DataSourceID="SqlDataSource4" 
                                                                DataTextField="MENUTYPENAME" 
                                                                DataValueField="MENUTYPENAME" 
                                                                SelectedValue='<%# Bind("MENUTYPE") %>' 
                                                                CssClass="form-control">

                                                            </asp:DropDownList>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUTYPENAME] FROM [SHOPLIFYMENUTYPE2]"></asp:SqlDataSource>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUTYPE") %>' ID="Label5"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUSETTYPE" SortExpression="MENUSETTYPE">
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="MENUTYPE3NAME" DataValueField="MENUTYPE3NAME" SelectedValue='<%# Bind("MENUSETTYPE") %>' CssClass="form-control"></asp:DropDownList>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUTYPE3NAME] FROM [SHOPLIFYMENUTYPE3]"></asp:SqlDataSource>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUSETTYPE") %>' ID="Label7"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUSTATUS" SortExpression="MENUSTATUS">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUSTATUS") %>' ID="TextBox8"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUSTATUS") %>' ID="Label8"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUDETAIL" SortExpression="MENUDETAIL">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="TextBox9" CssClass="form-control"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUDETAIL") %>' ID="Label9"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUADDDATE" SortExpression="MENUADDDATE">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUADDDATE") %>' ID="TextBox5"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUADDDATE") %>' ID="Label10"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUCHANGEDATE" SortExpression="MENUCHANGEDATE">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEDATE") %>' ID="TextBox6"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEDATE") %>' ID="Label11"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="MENUCHANGEBY" SortExpression="MENUCHANGEBY">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEBY") %>' ID="TextBox7"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("MENUCHANGEBY") %>' ID="Label12"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" 
                                                ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' 
                                                DeleteCommand="DELETE FROM [SHOPLIFYMENUMASTER] WHERE [MENUID] = @MENUID" 
                                                InsertCommand="INSERT INTO [SHOPLIFYMENUMASTER] ([MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUCODE], [MENUDETAIL], [MENUTYPE], [MENUSETTYPE]) VALUES (@MENUNAME, @MENUPRICE, @MENUCATEGORY, @MENUADDDATE, @MENUCHANGEDATE, @MENUCHANGEBY, @MENUPICTURE, @MENUSTATUS, @MENUCODE, @MENUDETAIL, @MENUTYPE, @MENUSETTYPE)" 
                                                SelectCommand="SELECT [MENUID], [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUCODE], [MENUDETAIL], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER] WHERE (([MENUCATEGORY] = @MENUCATEGORY) AND ([MENUCATEGORY] = @MENUCATEGORY2))" 
                                                UpdateCommand="UPDATE [SHOPLIFYMENUMASTER] SET [MENUNAME] = @MENUNAME, [MENUPRICE] = @MENUPRICE, [MENUCATEGORY] = @MENUCATEGORY, [MENUADDDATE] = @MENUADDDATE, [MENUCHANGEDATE] = @MENUCHANGEDATE, [MENUCHANGEBY] = @MENUCHANGEBY, [MENUPICTURE] = @MENUPICTURE, [MENUSTATUS] = @MENUSTATUS, [MENUCODE] = @MENUCODE, [MENUDETAIL] = @MENUDETAIL, [MENUTYPE] = @MENUTYPE, [MENUSETTYPE] = @MENUSETTYPE WHERE [MENUID] = @MENUID">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="MENUID" Type="String"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="MENUID" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUNAME" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUPRICE" Type="Double"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCATEGORY" Type="String"></asp:Parameter>
                                                    <asp:Parameter DbType="Date" Name="MENUADDDATE"></asp:Parameter>
                                                    <asp:Parameter DbType="Date" Name="MENUCHANGEDATE"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCHANGEBY" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUPICTURE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCODE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUDETAIL" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUSETTYPE" Type="String"></asp:Parameter>
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:QueryStringParameter QueryStringField="menucategory" Name="MENUCATEGORY" Type="String"></asp:QueryStringParameter>
                                                    <asp:QueryStringParameter QueryStringField="menucategory" Name="MENUCATEGORY2" Type="String"></asp:QueryStringParameter>
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="MENUNAME" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUPRICE" Type="Double"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCATEGORY" Type="String"></asp:Parameter>
                                                    <asp:Parameter DbType="Date" Name="MENUADDDATE"></asp:Parameter>
                                                    <asp:Parameter DbType="Date" Name="MENUCHANGEDATE"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCHANGEBY" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUPICTURE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUCODE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUDETAIL" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUTYPE" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="MENUSETTYPE" Type="String"></asp:Parameter>

                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUID], [MENUNAME], [MENUPRICE], [MENUCATEGORY], [MENUADDDATE], [MENUCHANGEDATE], [MENUCHANGEBY], [MENUPICTURE], [MENUSTATUS], [MENUCODE], [MENUDETAIL], [MENUTYPE], [MENUSETTYPE] FROM [SHOPLIFYMENUMASTER] WHERE ([MENUCATEGORY] = @MENUCATEGORY)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="menucategory" Name="MENUCATEGORY" Type="String"></asp:QueryStringParameter>
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

    <!-- Magnific popup JavaScript -->
    <script src="assets/plugins/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
    <script src="assets/plugins/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>
    
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

    <script>

     $(function () {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                
            });
        });

        </script>

</asp:Content>





