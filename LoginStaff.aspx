<%@ Page Language="VB" Debug="true" AutoEventWireup="false" CodeFile="LoginStaff.aspx.vb" Inherits="LoginStaff" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon1.png"/>

    <title>Login Shoplify Staff</title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- page css -->
    <link href="assets/css/pages/login-register-lock.css" rel="stylesheet"/>
     <!--alerts CSS -->
    <link href="assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
    <!-- Custom CSS -->
    <link href="assets/css/style.css" rel="stylesheet"/>
    
    <!-- You can change the theme colors from here -->
    <link href="assets/css/colors/default-dark.css" id="theme" rel="stylesheet"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
   <form id="form1" runat="server">
        <div>
     
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss <img src="assets/images/logo-icon6.png" width ="180px" height="180px" alt="Home" />-->
    <!-- ============================================================== -->
    <section id="wrapper" class="login-register login-sidebar" style="background-image:url(assets/images/background/login-register6.jpg);">
        <div class="login-box card">
            <div class="card-body" style="background-color: #6d3600;">
                
                    <a href="javascript:void(0)" class="text-center db"></a><br /><br /><br /><br />
                <h1 class="text-white font-weight-bold text-center">Login</h1>    
                <div class="form-group m-t-40">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <asp:TextBox ID="TxtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate ="TxtUsername" runat="server" ErrorMessage="RequiredFieldValidator" InitialValue="Username" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-xs-12">
                            <asp:TextBox ID="TxtPassword" runat="server" type="password"  class="form-control" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate ="TxtPassword" runat="server" ErrorMessage="RequiredFieldValidator" InitialValue="Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary float-left p-t-0">
                                <input id="checkbox-signup" type="checkbox" class="filled-in chk-col-light-blue">
                                <label for="checkbox-signup" style="color: white;"> Remember me </label>
                            </div>
                            <a href="javascript:void(0)" id="to-recover" class="text-muted float-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a> </div>
                    </div>


                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <asp:Button ID="Button1" runat="server" Text="Log In" class="btn btn-warning btn-block text-uppercase btn-rounded" OnClick="Button1_Click"></asp:Button>
                        </div>
                    </div>
                   
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center" style="color: white;">
                            Don't have an account? <a href="pages-register2.html" class="text-muted m-l-5" ><b>Sign Up</b></a>
                        </div>
                    </div>

            </div>



        </div>
            </div>
    </section>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->


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
      </script>

    <!-- Sweet-Alert  -->
    <script src="assets/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="assets/plugins/sweetalert/jquery.sweet-alert.custom.js"></script>

   

        </div>
    </form>
</body>
</html>
