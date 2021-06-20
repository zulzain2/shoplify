<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="TakeOrderSelect.aspx.vb" Inherits="TakeOrderSelect" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


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
                                        <h4 class="m-b-0 text-white">Selection</h4>
                                    </div>
                                    <div class="card-body" >
                                               <br />
                                             <br />
                                             <br />
                                         <div class="row" >
                                             
                                                    <div class="col-md-6 text-center">
                                                 
                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="assets\images\takeorder.png" class="btn btn-secondary" style="box-shadow: 0 0 15px 0px black;" OnClick="ImageButton1_Click"/>
                                                       <br />
                                                        <br />
                                                        <h4 class="font-weight-bold">Take Order</h4>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6 text-center">
                                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="assets\images\editorder.png" class="btn btn-secondary" style="box-shadow: 0 0 15px 0px black;"/>
                                                        <br />
                                                        <br />
                                                        <h4 class="font-weight-bold">Edit Order</h4>
                                                    </div>
                                                    <!--/span-->
                                         </div>
                                               <br />
                                             <br />
                                             <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

