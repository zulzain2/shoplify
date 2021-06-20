<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage6.master" AutoEventWireup="false" CodeFile="TakeOrderTable.aspx.vb" Inherits="TakeOrderTable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Take Order</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Customer</li>
                        <li class="breadcrumb-item font-bold">Select Table</li>
                    
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
                                        <h4 class="m-b-0 text-white">Take Order</h4>
                                    </div>
                                    <div class="card-body">

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                          
                                            <EditItemTemplate>
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    TABLESTATUS:
                                                    <asp:TextBox Text='<%# Bind("TABLESTATUS") %>' runat="server" ID="TABLESTATUSTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /></td>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <table style="">
                                                    <tr>
                                                        <td>No data was returned.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    TABLESTATUS:
                                                    <asp:TextBox Text='<%# Bind("TABLESTATUS") %>' runat="server" ID="TABLESTATUSTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /></td>
                                            </InsertItemTemplate>

                                            <ItemTemplate>
                                                <div class="col-xl-2 col-lg-3 col-md-3 col-6 text-center" runat="server" style="">
                                                    <asp:Label Text='<%# Eval("CURRENTTABLESTATUS") %>' runat="server" ID="CURRENTTABLESTATUSlbl" Visible="false"/>
                                                    <div>
                                                    <asp:Image ID="imgtablenotpaid" runat="server" ImageUrl="~/assets/images/table-available.png" Height="80%" Width="80%"/>
                                                      

                                                    <asp:Image ID="imgtableavailable" runat="server" ImageUrl="~/assets/images/table-donepay.png" Height="80%" Width="80%" /> 
                                                   </div>
                                                    <asp:Button ID="Button1" runat="server" Text='<%# Eval("TABLENUM") %>' CommandName="view" CommandArgument='<%# Bind("TABLENUM") %>' class="btn btn-block btn-lg btn-secondary font-weight-bold" /><br />
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
                                                <td runat="server" style="">TABLENUM:
                                                    <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="TABLENUMLabel" /><br />
                                                    TABLESTATUS:
                                                    <asp:Label Text='<%# Eval("TABLESTATUS") %>' runat="server" ID="TABLESTATUSLabel" /><br />
                                                </td>
                                            </SelectedItemTemplate>
                                        </asp:ListView>


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [TABLENUM], [TABLESTATUS], [CURRENTTABLESTATUS] FROM [SHOPLIFYRESTAURANTTABLE] WHERE ([TABLESTATUS] = @TABLESTATUS)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="ACTIVE" Name="TABLESTATUS" Type="String"></asp:Parameter>
                                                
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    </div>
                                </div>
                            </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

