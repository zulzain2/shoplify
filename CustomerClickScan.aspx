<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage5.master" AutoEventWireup="false" CodeFile="CustomerClickScan.aspx.vb" Inherits="CustomerClickScan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- page css -->
    <link href="assets/css/pages/login-register-lock.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    


    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
   

     <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <section id="wrapper">
        <div class="login-register" style="background-image:url(../assets/images/background/login-register.jpg);filter: blur(0px); opacity: 1; transform: matrix(1, 0, 0, 1, 0, 0);" data-zanim-xs="{&quot;delay&quot;:0.4,&quot;animation&quot;:&quot;zoom-out&quot;}">

         


            <div class="login-box card" style="background-color:rgba(0, 0, 0, 0.12)">
                <div class="card-body" style="background-color:rgba(0, 0, 0, 0.12)">
                   
                         <div class="row">
    <div class="col-lg-12 text-center">
     
   <h3 class="text-white">SCAN QR LOCATED ON YOUR TABLE</h3>
        <asp:ImageButton ID="LinkButton1" runat="server" ImageUrl="~/assets/images/qr-code.png" style="height:200px;width:200px;"/>
    </div>
</div>
    <div class="row">
        <div class="col-lg-12 text-center">
            
        <h3 class="font-weight-bold text-white">OR</h3>
            </div>
    </div>
    <div class="row">
    <div class="col-lg-12 text-center text-white">
     
   <h3 class="text-white">SELECT YOUR TABLE</h3>
        <asp:ImageButton ID="btnselecttable" runat="server" ImageUrl="~/assets/images/dinner.png" style="height:200px;width:200px;"/>
    </div>
</div>
                    
                </div>
            </div>
        </div>
    </section>

    
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->


   
     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!--Custom JavaScript -->
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        });
        // ============================================================== 
        // Login and Recover Password 
        // ============================================================== 
        $('#to-recover').on("click", function() {
            $("#loginform").slideUp();
            $("#recoverform").fadeIn();
        });
    </script>

</asp:Content>

