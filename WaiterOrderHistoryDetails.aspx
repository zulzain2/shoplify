<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="WaiterOrderHistoryDetails.aspx.vb" Inherits="WaiterOrderHistoryDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

     <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Order History</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">Kitchen</li>
                            <li class="breadcrumb-item font-bold">Order History</li>
                    </ol>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

      
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->

     <div class="row">
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-header bg-info">
                                        <h4 class="m-b-0 text-white">Order History</h4>
                                    </div>
                                    <div class="card-body">

                                          <div class="row">
                                            <div class="col-lg-12">
                                                <h2 class="font-weight-bold">Order Number : <asp:Label ID="Label11" runat="server"></asp:Label></h2>
                                                <h5 class="font-weight-bold">Status : <asp:Label ID="lblstatus" runat="server"></asp:Label></h5>
                                                <h5 class="font-weight-bold">Table Number : <asp:Label ID="lbltablenum" runat="server"></asp:Label></h5>
                                                <h5 class="font-weight-bold">Take By : <asp:Label ID="lbltakeby" runat="server"></asp:Label></h5>
                                                <h5 class="font-weight-bold">Take Time : <asp:Label ID="lbltaketime" runat="server"></asp:Label></h5>
                                                <h5 class="font-weight-bold">Total Menu Order : <asp:Label ID="lbltotalmenu" runat="server"></asp:Label></h5>
                                                <h5 class="font-weight-bold">Total Price : RM <asp:Label ID="lbltotalprice" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                        <br />

                                        <div class="row">
                                            <div class="col-lg-12">
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                           
                                            <EmptyDataTemplate>
                                                <span>No data was returned.</span>
                                            </EmptyDataTemplate>
                                           
                                            <ItemTemplate>
                                              
                                                <div class="col-lg-6" runat="server" style="">
                                                     <div class="card ">
                                                     <div class="card-body" style="padding:0px">
                                                    <div class="row">
                                                        
                                                    <div class="col-lg-4 col-5" style="padding:0px"> 
                                                        <div class="card text-center" style="height:250px">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("MENUPICTURE") %>' class="card-img-top img-responsive" style="margin:auto;height:100%;width:100%"/><br />
                                                            <div class="card-body" style="background-color: rgba(120, 130, 140, 0.13);">
                                                                <h4 class="card-title font-weight-bold">
                                                                <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="Label1" />
                                                                <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="Label2" /></h4>
                                                            </div>
                                                         </div>
                                                    </div>
                                                    

                                                    <div class="col-lg-8 col-7" style="padding-right:0px">
                                                        
                                                    <h4 class="font-weight-bold">
                                                        <asp:Label Text='<%# Eval("ORDERSTATUS") %>' runat="server" ID="Label3" class="" style="font-size:large;"/>
                                                       

                                                    </h4><br />

                                                    Price : RM
                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="Label4" /><br />

                                                    Quantity :
                                                    <asp:Label Text='<%# Eval("ORDERQUANTITY") %>' runat="server" ID="Label5" /><br />

                                                    Total Price : RM
                                                    <asp:Label Text='<%# Eval("Expr1") %>' runat="server" ID="Label6" /><br /><br />
                                                   

                                                        <i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="Label7" />
                                                    
                                                    <i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="Label8" /> <br /><br />
                                                   
                                                    Details : <br />
                                                   
                                                   <asp:Label Text='<%# Eval("MENUDETAIL") %>' runat="server" ID="MENUDETAILLabel" /> <br /><br />
                                                    
                                                    
                                                    
                                                   

                                                    Remarks (If Any) :
                                                    <asp:Label Text='<%# Eval("ORDERDESCRIPTION") %>' runat="server" ID="Label9" /><br />
                                                    Reject Remark (If Any) :
                                                    <asp:Label Text='<%# Eval("ORDERREJECTREMARK") %>' runat="server" ID="Label10" />
                                               </div>
                                                    </div>
                                                    </div>
                                                </div>
                                                    </div>
                                                    


                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div runat="server" id="itemPlaceholderContainer" style="width: 100%;" border="0">
                                                     <div class="row">
                                                    <div  runat="server" id="itemPlaceholder" />
                                                         </div>
                                                </div>
                                                
                                                </div>
                                            </LayoutTemplate>
                                            
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDERTOTAL.ORDERTOTALPRICE, SHOPLIFYORDERTOTAL.TOTALMENUORDER, SHOPLIFYORDERTOTAL.ORDERTAKEBY, SHOPLIFYORDERTOTAL.ORDERTAKETIME, SHOPLIFYORDERTOTAL.ORDERFINALNUM, SHOPLIFYORDERTOTAL.FINALORDERSTATUS, SHOPLIFYORDERTOTAL.TOTALMENUREJECT, SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERDESCRIPTION, SHOPLIFYORDER.ORDERSTATUS, SHOPLIFYORDER.ORDERTABLE, SHOPLIFYORDER.ORDERTOTALPRICE AS Expr1, SHOPLIFYORDER.ORDERREJECTREMARK, SHOPLIFYMENUMASTER.MENUNAME,SHOPLIFYMENUMASTER.MENUDETAIL, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYMENUMASTER.MENUPICTURE, SHOPLIFYMENUMASTER.MENUCODE, SHOPLIFYMENUMASTER.MENUTYPE, SHOPLIFYMENUMASTER.MENUSETTYPE FROM SHOPLIFYMENUMASTER INNER JOIN SHOPLIFYORDER ON SHOPLIFYMENUMASTER.MENUCODE = SHOPLIFYORDER.ORDERMENUCODE INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM  WHERE ([ORDERFINALNUM] = @ORDERFINALNUM)">
                                      <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="orderfinalnum" Name="ORDERFINALNUM" Type="String"></asp:QueryStringParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            </div>
                                    </div>
                                
                                  
                                </div>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

