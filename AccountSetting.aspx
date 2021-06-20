<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AccountSetting.aspx.vb" Inherits="AccountSetting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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

    <link rel="stylesheet" href="assets/plugins/dropify/dist/css/dropify.min.css">

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>

     <!-- ============================================================== -->
     <!-- Bread crumb and right sidebar toggle -->
     <!-- ============================================================== -->
        <div class="row page-titles">
            <div class="col-md-5 align-self-center">
                <h3 class="page-header"><i class="mdi mdi-account-settings-variant"></i>&nbsp Account Setting</h3>
            </div>
            <div class="col-md-7 align-self-center">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                    <li class="breadcrumb-item">User Control</li>
                    <li class="breadcrumb-item font-bold">Account Setting</li>
                </ol>
            </div>
        </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- Start User Right Info -->
    <!-- ============================================================== -->
    <div class="row">
        <div class="col-lg-4 col-xlg-3 col-md-5">
            <div class="card">
                            <div class="card-body">
                                <center class="m-t-30"> <asp:Image ID="img_file2" runat="server" class="img-circle" width="150" /> 

                                    <h4 class="card-title m-t-10"><% = Session("ssUserName") %></h4>
                                    <h6 class="card-title m-t-10">Member Since <% = Convert.ToDateTime(Session("ssUserCreateDate").ToString()).ToString("dd/MM/yyyy") %></h6>
                                   
                                   
                                    
                                </center>
                            </div>
                            <div>
                                </div>
                            
                 <div class="card-body text-center" style="background-color:lightslategrey">
                   <h4 class="font-weight-bold" style="color:azure">Last Login : <% =Session("ssUserLastLogin") %></h4> 
                </div>

                               <div class="text-center bg-light">
                                <div class="row">
                                    <div class="col-6  p-20 b-r">
                                        <h4 class="m-b-0 font-medium"><% =Session("ssUserSection") %></h4><small>Section</small></div>
                                    <div class="col-6  p-20">
                                        <h4 class="m-b-0 font-medium"><% =Session("ssUserLevel") %></h4><small>Role</small></div>
                                </div>
                            </div>
               

                <div class="text-center bg-light" style="border-top: 1px solid rgba(120, 130, 140, 0.13);">
                                <div class="row">
                                    <div class="col-12  p-20 b-r">
                                        <h4 class="m-b-0 font-medium"><% =Session("ssUserBranch") %></h4><small>Restaurant Branch</small></div>
                                   
                                </div>
                            </div>

                

               
                                
                                
                                
                            
                        </div>
            </div>

        <!-- ============================================================== -->
        <!-- End User Right Info -->
        <!-- ============================================================== -->

        

        
        <div class="col-lg-8 col-xlg-9 col-md-7">
            <div class="card">
                   <ul class="nav nav-tabs profile-tab" role="tablist">
                                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#generalinfo" role="tab"><span class="hidden-sm-up"><i class="mdi mdi-account mdi-24px"></i></span> <span class="hidden-xs-down">General Info</span> </a> </li>
                                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#changeuname" role="tab"><span class="hidden-sm-up"><i class="mdi mdi-account-edit mdi-24px"></i></span> <span class="hidden-xs-down">Change Username</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link " data-toggle="tab" href="#changeupass" role="tab"><span class="hidden-sm-up"><i class="mdi mdi-security mdi-24px"></i></span> <span class="hidden-xs-down">Change Password</span></a> </li>
                                    <li class="nav-item"> <a class="nav-link " data-toggle="tab" href="#changeudp" role="tab"><span class="hidden-sm-up"><i class="mdi mdi-face mdi-24px"></i></span> <span class="hidden-xs-down">Change Profile Picture</span></a> </li>
                                </ul>
                     
              <div class="tab-content">
                


            <!-- ============================================================== -->
            <!-- Start User General Info -->
            <!-- ============================================================== -->
            <div class="tab-pane active" id="generalinfo" role="tabpanel">
                <div class="card-body">

                    <h4 class="card-title font-bold"><span class="lstick"></span>General Info</h4>

                                <small class="text-muted">Full Name </small>
                                <h6><%   = (Session("ssUserFullName")) %></h6> 

                                <small class="text-muted p-t-30 db">Employee ID </small>
                                <h6><% = (Session("ssEmployeeId")) %></h6> 

                                <small class="text-muted p-t-30 db">Email address </small>
                                <h6><%=Session("ssUserEmail") %></h6> 

                                <small class="text-muted p-t-30 db">Status </small>
                                <h6><%=Session("ssUserStatus") %></h6> 

                                <small class="text-muted p-t-30 db">Branch </small>
                                <h6><%= Session("ssUserBranch") %></h6> 
                                
                                <small class="text-muted p-t-30 db">Section</small>
                                <h6><%=Session("ssUserSection") %></h6>  

                                <small class="text-muted p-t-30 db">Level</small>
                                <h6><%=Session("ssUserLevel") %></h6>  

                                <small class="text-muted p-t-30 db">Account Create</small>
                                <h6><%=Session("ssUserCreateDate") %></h6>  


              
                </div>
                </div>
            <!-- ============================================================== -->
            <!-- End User General info -->
            <!-- ============================================================== -->


              <!-- ============================================================== -->
              <!-- Start User Change Username -->
              <!-- ============================================================== -->
              <div class="tab-pane" id="changeuname" role="tabpanel">
                                    
              <div class="card-body">
              <h4 class="card-title font-bold"><span class="lstick"></span>Change Username</h4>

                  <div class="row">  
                <div class="col-md-4">
                    <b class="p-t-10 db">Current Username :  
                    <% currentusername.Text = Session("ssUserName")%>
                    <asp:TextBox ID="currentusername" runat="server" Text="" ReadOnly="true" style="border: aqua;"></asp:TextBox> </b>
                        
                    

                </div>
                 </div>
              
             <div class="row">  
                <div class="col-md-4">
                    <div class="form-group">
                        <b class="p-t-20 db">New Username</b>
                        <asp:TextBox ID="txtNewUsername" name="username" runat="server" placeholder="New Username" ToolTip="Enter your new username" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vldtxtNewName" runat="server"  ControlToValidate="txtNewUsername" ValidationGroup="NewUsernameGroup" ErrorMessage="Required Field" CssClass="text-danger"/>
                    </div>

                </div>
                 <div class="col-md-6">
                    <div class="form-group">
                        <br />
                        <br />
                        <asp:CompareValidator ID="CompareValidatorUname" runat="server" ErrorMessage="New username same as old username!" ControlToValidate="txtNewUsername" ControlToCompare="currentusername" Operator="NotEqual" Type="String" ForeColor="Red"></asp:CompareValidator>
            </div>
                     </div>
                 </div>

              <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <asp:Button ID="btnUpdateUName" ValidationGroup="NewUsernameGroup" runat="server" Text="UPDATE USERNAME" class="btn btn-info"/> 
                    </div>
                </div>
            </div>
                  </div>
                     
                               </div>
        <!-- ============================================================== -->
        <!-- End User Change Username -->
        <!-- ============================================================== -->
                
        <!-- ============================================================== -->
        <!-- Start User Change Password -->
        <!-- ============================================================== -->
        <div class="tab-pane" id="changeupass" role="tabpanel">

        <div class="card-body">
                                        
        <h4 class="card-title font-bold"><span class="lstick"></span>Change Password</h4> 
                                        
        <div class="row">
           <div class="col-md-4">
                <div class="form-group">
                    <b>Current Password</b>
                    <div class="controls">
                    <asp:TextBox ID="currentpass" runat="server" placeholder="Current Password" ToolTip="Enter your current passsword" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="currentpass" ValidationGroup="PassGroup" ErrorMessage="Required Field" CssClass="text-danger"/>
                    </div>  
                </div>
          </div>
        </div>
         
        <div class="row">  
            <div class="col-md-4">
                <div class="form-group">
                    <b>New Password</b>
                    <div class="controls">
                    <asp:TextBox ID="newpass1" name="password"  runat="server" placeholder="New Password" ToolTip="Enter your new password" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="newpass1" ValidationGroup="PassGroup" ErrorMessage="Required Field" CssClass="text-danger"/>
                    </div>
                </div>
            </div>
        </div>

       <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <b>Retype New Password</b>
                    <div class="controls">
                    <asp:TextBox ID="newpass2" runat="server" placeholder="Retype New Password" ToolTip="Retype your new password" CssClass="form-control" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="newpass2" ValidationGroup="PassGroup" ErrorMessage="Required Field" CssClass="text-danger"/>
                    </div>
                    <br />
					<span style="font-style:italic; color: #6293e0;">Your new password must have at least 10 characters, one lowercase, one uppercase and one number.</span>
                </div>
            </div>
        </div>

       <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <asp:Button ID="btnUpdatePass" ValidationGroup="PassGroup" runat="server" Text="UPDATE PASSWORD" class="btn btn-info"/> 
                </div>
            </div>
        </div>

        </div>
        <!-- </form> -->
        </div>

        <!-- ============================================================== -->
        <!-- End User Change Password -->
        <!-- ============================================================== -->
       
        <!-- ============================================================== -->
        <!-- Start User Change UserDP -->
        <!-- ============================================================== -->
         <div class="tab-pane" id="changeudp" role="tabpanel">
                      <!-- For Client Side Validation Only -->
                  <!-- <form class="needs-validation" novalidate> -->
            <div class="card-body">
                <h4 class="card-title font-bold"><span class="lstick"></span>Change Profile Picture</h4> 
                <div class="row">
                 <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Profile Picture Upload</h4>
                                

                                
                                <br />

                                <div class="col-md-6 offset-md-3  p-3 text-center">
                                <h4>Current Profile Picture</h4>
                                <% If img_file.ImageUrl <> "" Then %>
                                    <asp:Image ID="img_file" runat="server" Width="50%" Height="50%" />
                                <%-- <asp:Button ID="btnUploadImg" runat="server" Text="Choose File" CssClass="btn btn-default" />--%>
                                <% Else%>
                                    <asp:Label ID="lbl_imgfile" runat="server">No Image Uploaded Yet.</asp:Label>
                                <% End If %>
                                <br />
                                </div>

                                <label for="input1">Drag and drop image below or click below. </label>
                                <div class="form-group">
                                <asp:FileUpload ID="fileDP" runat="server" class="dropify" data-default-file="" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="fileDP" ValidationGroup="UpdateDPGroup" ErrorMessage="Please select your new Profile Picture." CssClass="text-danger"/>
                                </div>

                                <br />
                                  <div class="row">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Button ID="btnDP" runat="server" Text="UPDATE PROFILE PICTURE" ValidationGroup="UpdateDPGroup" class="btn btn-info btn-lg btn-block" style="font-size: medium;"/> 
                                        </div>
                                    </div>
                                </div>

                              

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- </form> -->
        </div>
        <!-- ============================================================== -->
        <!-- End User Change UserDP -->
        <!-- ============================================================== -->

        </div>
        </div>
        </div>
        </div>
               

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_errorpass" runat="server" PopupControlID="pnlerrorpass" TargetControlID="LinkButton1" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlerrorpass" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Login Password</h4>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_errorpass" runat="server"></asp:Label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose1" runat="server"></asp:LinkButton>
                <a href="AccountSetting.aspx" class="btn btn-success">OK</a>
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_donepass" runat="server" PopupControlID="pnlpassdone" TargetControlID="LinkButton2" CancelControlID="lnkclose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlpassdone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Login Password</h4>
            </div>
            <div class="modal-body">
                <label>Password has been changed successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose" runat="server"></asp:LinkButton>
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                <a href="AccountSetting.aspx" class="btn btn-success">OK</a>
            </div>
        </div>
    </asp:Panel>

     <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_failedpass" runat="server" PopupControlID="pnlpassfailed" TargetControlID="LinkButton3" CancelControlID="Button4" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlpassfailed" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Login Password</h4>
            </div>
            <div class="modal-body">
                <label>An error occurred. Failed to change password.</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button4" runat="server" Text="OK" CssClass="btn btn-success" />
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_errorUname" runat="server" PopupControlID="pnlerrorUname" TargetControlID="LinkButton4" CancelControlID="lnkclose1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlerrorUname" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Username</h4>
            </div>
            <div class="modal-body">
                <asp:Label ID="lbl_errorUname" runat="server"></asp:Label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="LinkButton5" runat="server"></asp:LinkButton>
                <a href="AccountSetting.aspx" class="btn btn-success">OK</a>
            </div>
        </div>
    </asp:Panel>

     <asp:LinkButton ID="LinkButton6" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_confirm" runat="server" PopupControlID="pnlconfirm" TargetControlID="LinkButton6" CancelControlID="btnClose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlconfirm" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold" id="myModalLabel1">Change Username</h4>
            </div>
            <div class="modal-body">
                <label>Are you sure to change your username ?</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnClose" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="btnSubmit" runat="server" OnClick="updateUname_Click" Text="Yes" CssClass="btn btn-success" />
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton9" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="pass_confirm" runat="server" PopupControlID="Panel1" TargetControlID="LinkButton9" CancelControlID="Button1" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold" id="myModalLabel2">Change Password</h4>
            </div>
            <div class="modal-body">
                <label>Are you sure to change your password?</label>
            </div>
            <div class="modal-footer">
                <asp:Button ID="Button1" runat="server" Text="No" CssClass="btn btn-danger" />
                <asp:Button ID="updatepassconfirm" runat="server" Text="Yes" CssClass="btn btn-success" />
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton7" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_Uname" runat="server" PopupControlID="pnlunamedone" TargetControlID="LinkButton7" CancelControlID="lnkclose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlunamedone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Username</h4>
            </div>
            <div class="modal-body">
                <label>Username has been changed successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose2" runat="server" class="btn btn-success">OK</asp:LinkButton>
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
            </div>
        </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton10" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_done_dp" runat="server" PopupControlID="pnldpdone" TargetControlID="LinkButton10" CancelControlID="lnkclose4" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnldpdone" runat="server" style="display:none">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">Change Profile Picture</h4>
            </div>
            <div class="modal-body">
                <label>Profile Picture has been changed successfully.</label>
            </div>
            <div class="modal-footer">
                <asp:LinkButton id="lnkclose4" runat="server" class="btn btn-success">OK</asp:LinkButton>
                <%-- <asp:Button ID="btnOK" runat="server" Text="OK" OnClick="btnOK_Click" CssClass="btn btn-success" /> --%>
                
            </div>
        </div>
    </asp:Panel>
   
        </ContentTemplate>
          <Triggers>
        <asp:PostBackTrigger ControlID = "btnDP" />
    </Triggers>

   </asp:UpdatePanel>


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

     <!--Custom JavaScript -->
    
    <script src="assets/js/validation.js"></script>
    <script>
    ! function(window, document, $) {
        "use strict";
        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
    }(window, document, jQuery);
    </script>

</asp:Content>

