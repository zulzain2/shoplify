<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="CustomerHome.aspx.vb" Inherits="CustomerHome" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">


            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles hidden-sm-down">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-home"></i>&nbsp Home</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item font-bold"><a href="Home.aspx">Home</a></li>
                      
                    </ol>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
             <!-- row -->
                <div class="row hidden-sm-up" style="margin-top: -25px;">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body" style="padding:0px">
                                <div class="row">
                                    
                                    <div class="col-lg-12" style="padding:0px">
                                        
                                        <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
                                                <li data-target="#carouselExampleIndicators3" data-slide-to="1"></li>
                                                <li data-target="#carouselExampleIndicators3" data-slide-to="2"></li>
                                            </ol>
                                            <div class="carousel-inner" role="listbox">
                                                <div class="carousel-item active">
                                                    <img class="img-responsive" src="../assets/images/big/img3.jpg" alt="First slide">
                                                </div>
                                               
                                               <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>

                                                      <div class="carousel-item">
                                                       <img class="img-responsive" src="<%# Eval("ANNOUNCEMENTIMAGE") %>">
                                                      </div>
                                              
                                                </ItemTemplate>

                                              
        
                                            </asp:ListView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [ANNOUNCEMENTIMAGE] FROM [SHOPLIFYANNOUNCEMENT]"></asp:SqlDataSource>
    
                                                
                                                
                                                
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                   
                                   
                                </div>
                                <div class="text-center bg-light" style="margin-left: -15px;margin-right:-15px;">
                                <div class="row">
                                    <div class="col-6  p-20 b-r" style="border-bottom: 1px solid rgba(120, 130, 140, 0.13);">
                                    <asp:LinkButton ID="LinkButton1" runat="server"><h4 class="m-b-0 font-medium"><i class="mdi mdi-cart-plus"></i></h4><small>Make Order Now</small></asp:LinkButton>
                                        </div>

                                    <div class="col-6  p-20" style="border-bottom: 1px solid rgba(120, 130, 140, 0.13);">
                                       <asp:LinkButton ID="LinkButton2" runat="server"> <h4 class="m-b-0 font-medium"><i class="mdi mdi-bell-ring"></i></h4><small>Call Us</small></asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End row -->
               

                <!-- ============================================================== -->
                <!-- Latest Feed -->
                <!-- ============================================================== -->

     <div class="row">
                    <div class="col-lg-9 col-md-12 hidden-sm-down">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div>
                                        <h4 class="card-title m-b-5 font-weight-bold" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif"><span class="lstick"></span>Latest Feed </h4>
                                    </div>
                                    
                                </div>
                            </div>
                            
                            <div class="card-body" style="padding:0px">
                                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body" style="padding:0px">
                                <div class="row">
                                    
                                    <div class="col-lg-12">
                                        
                                        <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-target="#carouselExampleIndicators2" data-slide-to="0" class="active"></li>
                                                <li data-target="#carouselExampleIndicators2" data-slide-to="1"></li>
                                                <li data-target="#carouselExampleIndicators2" data-slide-to="2"></li>
                                            </ol>
                                            <div class="carousel-inner" role="listbox">
                                                <div class="carousel-item active">
                                                    <img class="img-responsive" src="../assets/images/big/img3.jpg" alt="First slide">
                                                </div>
                                               
                                               <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                                <ItemTemplate>

                                                      <div class="carousel-item">
                                                       <img class="img-responsive" src="<%# Eval("ANNOUNCEMENTIMAGE") %>">
                                                      </div>
                                              
                                                </ItemTemplate>

                                              
        
                                            </asp:ListView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [ANNOUNCEMENTIMAGE] FROM [SHOPLIFYANNOUNCEMENT]"></asp:SqlDataSource>
    
                                                
                                                
                                                
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleIndicators2" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleIndicators2" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                   
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End row -->
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- visit charts-->
                    <!-- ============================================================== -->
                    <div class="col-lg-3 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                <h4 class="card-title font-weight-bold" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif"><span class="lstick"></span>All Time Favourites</h4>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


    <!-- ============================================================== -->
                <!-- Projects of the month -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                        <h4 class="card-title font-weight-bold" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif"><span class="lstick"></span>Promotion</h4>
                                   
                                </div>
                              
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Activity widget find scss into widget folder-->
                    <!-- ============================================================== -->
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h4 class="card-title font-weight-bold" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif"><span class="lstick"></span>How To Use Shoplify?</h4>
                                   
                                   
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>




                
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->

    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

