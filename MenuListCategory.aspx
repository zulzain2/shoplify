<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuListCategory.aspx.vb" Inherits="MenuListCategory" %>

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
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Menu List</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Menu Master</li>
                        <li class="breadcrumb-item font-bold">Menu Category List</li>
                    </ol>
                </div>
            </div>

    <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card">
                <div class="card-body" style="background-color:#f4f6f9">
                    <div class="row">
             <div class="col-lg-3">
                 <asp:LinkButton ID="btnviewallmenu" runat="server" class="btn btn-outline-info btn-lg btn-block" style="padding: 10% 0"><i class="mdi mdi-eye"></i><p class="text-center">View All Menu</p></asp:LinkButton>
             </div>
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
                                        <h4 class="m-b-0 text-white">Menu Category List</h4>
                                    </div>
                                    <div class="card-body">
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                          
                                            <EditItemTemplate>
                                                <span style="">MENUCATEGORYNAME:
                                                    <asp:TextBox Text='<%# Bind("MENUCATEGORYNAME") %>' runat="server" ID="MENUCATEGORYNAMETextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                    <br />
                                                </span>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <span>No data was returned.</span>
                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <span style="">MENUCATEGORYNAME:
                                                    <asp:TextBox Text='<%# Bind("MENUCATEGORYNAME") %>' runat="server" ID="MENUCATEGORYNAMETextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                    <br />
                                                </span>
                                            </InsertItemTemplate>

                                            <ItemTemplate>
                                                 <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                
                                                     <span style="">
                                                   
                                                         <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-outline-info btn-lg btn-block" Style="padding:10% 0;" CommandName="view" CommandArgument='<%# Bind("MENUCATEGORYNAME") %>'><%# Eval("MENUCATEGORYNAME") %></asp:LinkButton>
                                                </span>
                                                     <br />
                                                     </div>
                                            </ItemTemplate>

                                            <LayoutTemplate>
                                               <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">

                                                                           <div class="row">

                                                                           <div runat="server" id="itemPlaceholder">

                                                                           </div>

                                                                           </div>
                                                   
                                                                       </div>
                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <span style="">MENUCATEGORYNAME:
                                                    <asp:Label Text='<%# Eval("MENUCATEGORYNAME") %>' runat="server" ID="MENUCATEGORYNAMELabel" /><br />
                                                    <br />
                                                </span>
                                            </SelectedItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [MENUCATEGORYNAME] FROM [SHOPLIFYMENUTYPE]"></asp:SqlDataSource>
                                    </div>
                                    </div>
                                </div>
         </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

