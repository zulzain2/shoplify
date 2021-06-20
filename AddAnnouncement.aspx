<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddAnnouncement.aspx.vb" Inherits="AddAnnouncement" %>

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
            <!-- Start Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-food"></i>&nbsp Manage Annoucement</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Manage Announcement</li>
                        <li class="breadcrumb-item font-bold">Add New Announcement</li>
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
            <!-- Start Add New Menu -->
            <!-- ============================================================== -->
           <div class="row">
                <div class="col-lg-12">
                     <div class="card ">
                         <div class="card-header bg-info">
                             <h4 class="m-b-0 text-white">Add New Announcement</h4>
                             </div>
                         <div class="card-body">
                             <div class="form-body">
                                 <h3 class="box-title">Announcement Info</h3>
                                <hr class="m-t-0 m-b-40">

                                 <div class="row">
                                     <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label col-md-2">Title</label>
                                             <div class="col-md-10">
                                                <div class="controls">
                                                <asp:textbox ID="txtannouncementtitle" runat="server" class="form-control"></asp:textbox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtannouncementtitle" ValidationGroup="addannouncement" ErrorMessage="Required Field" CssClass="text-danger"/>   
                                                </div>
                                                    

                                                    </div>
                                                 </div>
                                            </div>
                                     <!--/span-->
                                     <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="control-label text-right col-md-3">Details</label>
                                             <div class="col-md-9">
                                                 <div class="controls">
                                                     <asp:textbox ID="txtannouncementdetail" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control"></asp:textbox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtannouncementtitle" ValidationGroup="addannouncement" ErrorMessage="Required Field" CssClass="text-danger"/>
                                                 </div>
                                            </div>
                                         </div>
                                     </div>
                                     <!--/span-->

                                         </div>

                                  <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                             <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                            <asp:FileUpload ID="fileAnnouncement" runat="server" class="dropify" data-default-file="" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fileAnnouncement" ValidationGroup="addannouncement" ErrorMessage="Please upload announcement picture ." CssClass="text-danger"/>
                                            </div>
                                            </div>
                                        </div>

                                </div>

                                 <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnAddAnnouncement" runat="server" ValidationGroup="addannouncement" Text="Add Annoucement" class="btn btn-outline-info btn-lg btn-block" style="font-size: medium;"/> 
                                        </div>
                                    </div>
                                </div>
                                 


                                     </div>
                                 </div>

                             </div>
                         </div>
                </div>

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_announcement" runat="server" PopupControlID="pnlannouncementdone" TargetControlID="LinkButton1" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlannouncementdone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Add Announcement</h4>
            </div>
            <div class="modal-body">
                <label>Announcement has been added successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose1" runat="server"></asp:LinkButton>
                <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" />
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
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

