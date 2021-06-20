<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage4.master" AutoEventWireup="false" CodeFile="OrderStatusCustomer.aspx.vb" Inherits="OrderStatusCustomer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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

    <script src="https://www.paypal.com/sdk/js?client-id=AWoeAtk0HLK-Bv6zlfkq1Fx4Enok24q8dLmT2BY1VF6XioZZ9lcky708C8pH32KQU_8HZTI4hwx_aggI&currency=MYR"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
        
        paypal.Buttons({
            
            // Set up the transaction
            createOrder: function (data, actions) {
                var ordertotal = document.getElementById("<%=totallblforpaypal.ClientID%>").value
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: ordertotal
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                   
                    var url = window.location.href
                    var arr = url.split("/");
                    var urlParams = new URLSearchParams(location.search);
                    var tablenum = urlParams.get('tablenum');
                    var tablestatus = urlParams.get('currenttablestatus');

                    window.location.href= arr[0] + "//" + arr[2] + "/PaymentSuccessfull.aspx?tablenum=" + tablenum + "&currenttablestatus=" + tablestatus + "&paymentstatus=PAID"
                });
            }


        }).render('#paypal-button-container');
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
   
   
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                       <ContentTemplate> 
                             <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick"></asp:Timer> 
                          
                       <asp:TextBox ID="totallblforpaypal" runat="server" ReadOnly="true" style="display:none"></asp:TextBox>     
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles" >
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Order Status</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Customer</li>
                        <li class="breadcrumb-item font-bold">Order Status</li>
             
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

                           

                        <div class="row" id="haveorder" runat="server">
                            
                                
                      
                                         <div class="col-lg-3">
                                <div class="card ">
                                    <div class="card-body">

                                         <div class="col-lg-12">
                                                    <h3><b>ORDER QUEUE</b></h3>
                                             </div>

                                        <div class="col-lg-12">
                                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
                                            
                                            <EmptyDataTemplate>
                                                <span>No order queue at the moment.</span>
                                            </EmptyDataTemplate>
                                       
                                            <ItemTemplate>
                                                <span style="">
                                                   
                                                   <asp:Label Text='<%# Eval("ORDERFINALNUM") %>' runat="server" ID="ORDERFINALNUMLabel" class="font-weight-bold"/><br />
                                                  
                                                    <h5> <asp:Label class="" Text='<%# Eval("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSLabel" style="font-size:large;padding-top:4px;padding-bottom:4px" />
                                                        &nbsp&nbsp
                                                        <div class="spinner-border text-danger" role="status" runat="server" id="orderstatusspinner" style="width:1.5rem; height:1.5rem"></div>

                                                    </h5>
                                                    <br />
                                                </span>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                                                <div style="">
                                                </div>
                                            </LayoutTemplate>
                                          
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [ORDERFINALNUM], [FINALORDERSTATUS] FROM [SHOPLIFYORDERTOTAL] WHERE ((([FINALORDERSTATUS] = @FINALORDERSTATUS) OR ([FINALORDERSTATUS] = @FINALORDERSTATUS2) OR ([FINALORDERSTATUS] = @FINALORDERSTATUS3)) AND ([CURRENTTABLESTATUS] = @CURRENTTABLESTATUS))">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="SUBMIT TO KITCHEN" Name="FINALORDERSTATUS" Type="String"></asp:Parameter>
                                                <asp:Parameter DefaultValue="PROCESSING" Name="FINALORDERSTATUS2" Type="String"></asp:Parameter>
                                                <asp:Parameter DefaultValue="FINISH COOK" Name="FINALORDERSTATUS3" Type="String"></asp:Parameter>
                                                <asp:Parameter DefaultValue="OCCUPIED" Name="CURRENTTABLESTATUS" Type="String"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                             </div>
                                    </div>
                                    </div>
                                </div>


                            <div class="col-lg-9">


                                <div class="card">
                                    <div class="card-body">


                              
                                          

                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="ORDERFINALNUM,ORDERTOTALPRICE,TABLENUM">
                                           
                                            <EditItemTemplate>
                                                <span style="">ORDERTOTALPRICE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICETextBox" /><br />
                                                    FINALORDERSTATUS:
                                                    <asp:TextBox Text='<%# Bind("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSTextBox" /><br />
                                                    TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    PAYMENT:
                                                    <asp:TextBox Text='<%# Bind("PAYMENT") %>' runat="server" ID="PAYMENTTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                    <br />
                                                </span>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <span>No data was returned.</span>
                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <span style="">ORDERTOTALPRICE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICETextBox" /><br />
                                                    FINALORDERSTATUS:
                                                    <asp:TextBox Text='<%# Bind("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSTextBox" /><br />
                                                    TABLENUM:
                                                    <asp:TextBox Text='<%# Bind("TABLENUM") %>' runat="server" ID="TABLENUMTextBox" /><br />
                                                    PAYMENT:
                                                    <asp:TextBox Text='<%# Bind("PAYMENT") %>' runat="server" ID="PAYMENTTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                    <br />
                                                </span>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <span style="">
                                                    <div class="row">
                                                        <div class="col-6">
                                                    <h3><b>ORDER STATUS</b> <span class="pull-right"><asp:Label ID="Label1" runat="server" Text="">#<%# Eval("ORDERFINALNUM")  %></asp:Label></span></h3>
                                                            </div>
                                                        <div class="col-6">
                                                    <h3 class="pull-right text-right"><b><asp:Label Text='<%# Eval("PAYMENT") %>' runat="server" ID="PAYMENTLabel" class="" style="padding-top:10px;padding-bottom:10px" /></b></span>
                                                        <i class="mdi mdi-check mdi-36px" role="status" runat="server" id="tick" style="color:green; width:0.5rem; height:0.5rem"></i>
                                                        <i class="mdi mdi-close mdi-36px" role="status" runat="server" id="xsymbol" style="color:red; width:0.5rem; height:0.5rem"></i>
                                                    </h3><br />
                                                        </div>
                                                        </div>

                                                    <div class="row">
                                                     <div class="col-lg-4">
                                                    <h5>STATUS : <asp:Label class="" Text='<%# Eval("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSLabel" style="font-size:large;padding-top:4px;padding-bottom:4px"/>
                                                        &nbsp&nbsp
                                                        <div class="spinner-border text-danger" role="status" runat="server" id="finalstatusspinner" style="width:1.5rem; height:1.5rem"></div>
                                                    </h5>
                                                         </div>
                                                        <div class="col-lg-4">
                                                            
                                                            <asp:LinkButton ID="btnViewInvoice" CommandName="VIEWINVOICE" CommandArgument='<%# Container.DataItemIndex %>' runat="server" class="btn btn-block btn-rounded btn-info font-weight-bold"><i class="mdi mdi-file-document"></i> VIEW INVOICE</asp:LinkButton><br />
                                                             <asp:LinkButton ID="btnViewReceipt" CommandName="VIEWRECEIPT" CommandArgument='<%# Container.DataItemIndex %>' runat="server" class="btn btn-block btn-rounded btn-primary font-weight-bold"><i class="mdi mdi-file-document"></i> VIEW RECEIPT</asp:LinkButton>
                                                            
                                                            </div>
                                                        
                                                        <div class="col-lg-4 pull-right text-right">
                                                             <asp:LinkButton ID="btnMakePayment" CommandName="MAKEPAYMENT" CommandArgument='<%# Container.DataItemIndex %>' runat="server" class="btn btn-block btn-rounded btn-success font-weight-bold"><i class="mdi mdi-cash-usd"></i> MAKE PAYMENT</asp:LinkButton>
                                                          </br>
                                                            </div>
                                                        </div>

                                                    <div class="row">
                                                    <div class="col-lg-6">
                                                    <h5>TABLE :  <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="TABLENUMLabel" /></h5>
                                                   </div>

                                                        </div>

                                                   
                                                    
                                                    <br />
                                                </span>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                                                <div style="">
                                                </div>
                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <span style="">ORDERTOTALPRICE:
                                                    <asp:Label Text='<%# Eval("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICELabel" /><br />
                                                    FINALORDERSTATUS:
                                                    <asp:Label Text='<%# Eval("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSLabel" /><br />
                                                    TABLENUM:
                                                    <asp:Label Text='<%# Eval("TABLENUM") %>' runat="server" ID="TABLENUMLabel" /><br />
                                                    PAYMENT:
                                                    <asp:Label Text='<%# Eval("PAYMENT") %>' runat="server" ID="PAYMENTLabel" /><br />
                                                    <br />
                                                </span>
                                            </SelectedItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT [ORDERFINALNUM],[ORDERTOTALPRICE], [FINALORDERSTATUS], [TABLENUM], [PAYMENT] FROM [SHOPLIFYORDERTOTAL] WHERE ([TABLENUM] = @TABLENUM AND [CURRENTTABLESTATUS] = @CURRENTTABLESTATUS)">
                                            <SelectParameters>
                                                <asp:QueryStringParameter QueryStringField="tablenum" Name="TABLENUM" Type="String"></asp:QueryStringParameter>
                                                <asp:QueryStringParameter QueryStringField="currenttablestatus" Name="CURRENTTABLESTATUS" Type="String"></asp:QueryStringParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>





                                        <!--<div class="row">
                                <div class="col-lg-6">       
                                <div class="card ">
                                    <div class="card-body">

                                         <h3 runat="server" id="invoicetitle"><b>INVOICE</b></h3>
                                        <h3 runat="server" id="receipttitle"><b>RECEIPT</b></h3>
                                         
                                        <asp:Button ID="btnviewInvoice" runat="server" Text="VIEW INVOICE" class="btn btn-block btn-lg btn-rounded btn-info font-weight-bold" style="height:80px"/>
                                        <asp:Button ID="btnviewreceipt" runat="server" Text="VIEW RECEIPT" class="btn btn-block btn-lg btn-rounded btn-info font-weight-bold" style="height:80px"/>

                                        </div>
                                  </div>
                                    </div>
                                        <div class="col-lg-6" >
                                             <div class="card ">
                                    <div class="card-body">

                                         <h3 runat="server" id="paymentbuttondiv"><b>PAYMENT</b></h3>

                                        <asp:Button ID="btnmakepayment" runat="server" Text="MAKE PAYMENT" class="btn btn-block btn-lg btn-rounded btn-success font-weight-bold" style="height:80px" />

                                        </div>
                                  </div>

                                        </div>
                                            </div>
                                        -->

                                        <div class="row">
                                            <div class="col-lg-10">
                                                 <div class="card" style="margin-bottom:0px">
                                    <div class="card-body">
                                            <h3><b>YOUR ORDER</b></h3>
                                        </div>
                                                     </div>
                                                </div>
                                        </div>

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                            
                                            
                                            <EmptyDataTemplate>
                                                No data was returned.
                                            </EmptyDataTemplate>
                                         
                                            <ItemSeparatorTemplate>
                                                <br />
                                            </ItemSeparatorTemplate>
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
                                                                <asp:Label Text='<%# Eval("MENUCODE") %>' runat="server" ID="MENUCODELabel" />
                                                                <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /></h4>
                                                            </div>
                                                         </div>
                                                    </div>
                                                    

                                                    <div class="col-lg-8 col-7" style="padding-right:0px">
                                                        
                                                    <h4 class="font-weight-bold">
                                                        <asp:Label Text='<%# Eval("ORDERSTATUS") %>' runat="server" ID="ORDERSTATUSLabel" class="" style="font-size:large;"/>
                                                        &nbsp&nbsp
                                                        <div class="spinner-border text-danger" role="status" runat="server" id="eachstatusspinner" style="width:1.5rem; height:1.5rem"></div>

                                                    </h4><br />

                                                    Price : RM
                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />

                                                    Quantity :
                                                    <asp:Label Text='<%# Eval("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYLabel" /><br />

                                                    Total Price : RM
                                                    <asp:Label Text='<%# Eval("Expr1") %>' runat="server" ID="Expr1Label" /><br /><br />
                                                   

                                                        <i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel" />
                                                    
                                                    <i class="fa fa-check text-info"></i><asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" /> <br /><br />
                                                   
                                                    Details : <br />
                                                   
                                                   <asp:Label Text='<%# Eval("MENUDETAIL") %>' runat="server" ID="MENUDETAILLabel" /> <br /><br />
                                                    
                                                    
                                                    
                                                   

                                                    Remarks (If Any) :
                                                    <asp:Label Text='<%# Eval("ORDERDESCRIPTION") %>' runat="server" ID="ORDERDESCRIPTIONLabel" /><br />
                                                    Reject Remark (If Any) :
                                                    <asp:Label Text='<%# Eval("ORDERREJECTREMARK") %>' runat="server" ID="ORDERREJECTREMARKLabel" />
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

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDERTOTAL.ORDERFINALNUM, SHOPLIFYORDERTOTAL.FINALORDERSTATUS, SHOPLIFYORDERTOTAL.TOTALMENUREJECT, SHOPLIFYORDERTOTAL.TABLENUM, SHOPLIFYORDERTOTAL.PAYMENT, SHOPLIFYORDERTOTAL.CURRENTTABLESTATUS, SHOPLIFYORDERTOTAL.ORDERTAKETIME, SHOPLIFYORDERTOTAL.ORDERTOTALPRICE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYMENUMASTER.MENUPICTURE, SHOPLIFYMENUMASTER.MENUCODE, SHOPLIFYMENUMASTER.MENUDETAIL, SHOPLIFYMENUMASTER.MENUTYPE, SHOPLIFYMENUMASTER.MENUSETTYPE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERDESCRIPTION, SHOPLIFYORDER.ORDERSTATUS, SHOPLIFYORDER.ORDERTABLE, SHOPLIFYORDER.ORDERTOTALPRICE AS Expr1, SHOPLIFYORDER.ORDERREJECTREMARK FROM SHOPLIFYORDER INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE WHERE ([TABLENUM] = @TABLENUM AND [CURRENTTABLESTATUS] = @CURRENTTABLESTATUS)">
                                     <SelectParameters>
                                         <asp:QueryStringParameter QueryStringField="tablenum" Name="TABLENUM" Type="String"></asp:QueryStringParameter>
                                                <asp:QueryStringParameter QueryStringField="currenttablestatus" Name="CURRENTTABLESTATUS" Type="String"></asp:QueryStringParameter>
                                    </SelectParameters> 
                                        </asp:SqlDataSource>


                                    </div>
                                   
                                    </div>
                                
                                 
                           
                                </div>


                                 



                            </div>

      
                


            <!-- ============================================================== -->
            <!-- End Page Content -->
            <!-- ============================================================== -->


          

            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
             <!-- Row -->

                        <div class="row" id="noorder" runat="server" style="display:none;">
                            
                            <br /><br /><br />
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-body">
                                        
                                        <h1 class="text-center">PLEASE MAKE ORDER FIRST</h1>
                                       
                                        </div>
                                    </div>
                                </div>
                            </div>

                   </ContentTemplate>
                   </asp:UpdatePanel>  
                            

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="false" UpdateMode="conditional"> 
                       <ContentTemplate> 

    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_viewInvoice" runat="server" PopupControlID="pnlviewinvoice" TargetControlID="LinkButton1" CancelControlID="ButtonClose" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlviewinvoice" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none" >

       
        <div class="modal-dialog modal-dialog-centered modal-xl bounceIn animated">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">INVOICE <asp:Label ID="invoicelbl" runat="server" Text=""></asp:Label></h4>
            </div>
            <div class="modal-body">
                
                <div class="row">
                                <div class="col-md-12">
                                    <div class="pull-left">
                                        <address>
                                            <h3> &nbsp;<b class="text-danger">Restoran Asam Pedas & BBQ</b></h3>
                                            <p class="text-muted m-l-5">Jalan Pendidikan 4,
                                                <br/> Taman Universiti, 
                                                <br/> 81300 Skudai,
                                                <br/> Johor</p>
                                        </address>
                                    </div>
                                    <div class="pull-right text-right">
                                        <address>
                                            <h3>To,</h3>
                                            <h4 class="font-bold">Customer</h4>
                                           
                                            <h4 class="m-t-30">Invoice Date : <i class="fa fa-calendar"></i> <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></h4>
                                            <h4>Due Date : <i class="fa fa-calendar"></i> <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></h4>
                                        </address>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="table-responsive m-t-40" style="clear: both;">
                                    <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" style="border:0px;">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ORDERMENUCODE" HeaderText="Code" SortExpression="ORDERMENUCODE"></asp:BoundField>
                                            <asp:BoundField DataField="MENUNAME" HeaderText="Description" SortExpression="MENUNAME"></asp:BoundField>
                                            <asp:BoundField DataField="ORDERQUANTITY" HeaderText="Quantity" SortExpression="ORDERQUANTITY"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Unit Price" SortExpression="MENUPRICE">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("MENUPRICE") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    RM <asp:Label runat="server" Text='<%# Bind("MENUPRICE") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total" SortExpression="ORDERTOTALPRICE">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("ORDERTOTALPRICE") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    RM <asp:Label runat="server" Text='<%# Bind("ORDERTOTALPRICE") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            


                                        </Columns>
                                    </asp:GridView>
                                        </div>
                                    

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYORDERTOTAL.ORDERFINALNUM FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM WHERE ([TABLENUM] = @TABLENUM AND [CURRENTTABLESTATUS] = @CURRENTTABLESTATUS)">
                                         <SelectParameters>
                                       <asp:QueryStringParameter QueryStringField="tablenum" Name="TABLENUM" Type="String"></asp:QueryStringParameter>
                                                <asp:QueryStringParameter QueryStringField="currenttablestatus" Name="CURRENTTABLESTATUS" Type="String"></asp:QueryStringParameter>
                                    </SelectParameters>
                                    </asp:SqlDataSource>
                                    
                                 
                                </div>
                    

                                <div class="col-md-12">
                                    <div class="pull-right m-t-30 text-right">
                                        <h4>Sub - Total amount: RM<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h4>
                                   
                                        <hr>
                                        <h3><b>Total : </b>RM <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h3>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr>
                                    <div class="text-right">
                                        
                                       <!-- <asp:Button ID="invmakepaymentbtn" runat="server" Text="Proceed to payment" class="btn btn-danger"/> -->
                                    </div>
                                </div>
                            </div>


            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="btn btn-danger" />
                
            </div>
        </div>
            </div>
           
    </asp:Panel>


  

    <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_makepayment" runat="server" PopupControlID="pnlmakepayment" TargetControlID="LinkButton2" CancelControlID="ButtonClose2" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlmakepayment" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none" >

       
        <div class="modal-dialog modal-dialog-centered modal-xl bounceIn animated">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h3 class="modal-title font-bold" style="color:white;">Please Select Payment Type</h3>
            </div>
            <div class="modal-body">
                
                 <div class="row">
                                <div class="col-lg-6">       
                                <div class="card ">
                                    <div class="card-body">
                                        <asp:Button ID="btnpayhere" runat="server" Text="PAY HERE" class="btn btn-block btn-lg btn-rounded btn-secondary font-weight-bold" style="height:80px"/>
                                        </div>
                                  </div>
                                    </div>
                                        <div class="col-lg-6">
                                             <div class="card ">
                                    <div class="card-body">

                                        <asp:Button ID="btnpaycounter" runat="server" Text="AT COUNTER" class="btn btn-block btn-lg btn-rounded btn-secondary font-weight-bold" style="height:80px"/>

                                        </div>
                                  </div>
                                        </div>
                                            </div>

            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose2" runat="server" Text="Close" CssClass="btn btn-secondary font-weight-bold" style="color:red" />
                
            </div>
        </div>
            </div>
    </asp:Panel>

                            <asp:LinkButton ID="LinkButton4" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender ID="mp_viewReceipt" runat="server" PopupControlID="pnlviewreceipt" TargetControlID="LinkButton4" CancelControlID="ButtonClose4" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlviewreceipt" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none" >

       
        <div class="modal-dialog modal-dialog-centered modal-xl bounceIn animated">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">RECEIPT <asp:Label ID="receiptlbl" runat="server" Text=''></asp:Label></h4>
            </div>
            <div class="modal-body">
                
                <div class="row">
                                <div class="col-md-12">
                                    <div class="pull-left">
                                        <address>
                                            <h3> &nbsp;<b class="text-danger">Restoran Asam Pedas & BBQ</b></h3>
                                            <p class="text-muted m-l-5">Jalan Pendidikan 4,
                                                <br/> Taman Universiti, 
                                                <br/> 81300 Skudai,
                                                <br/> Johor</p>
                                        </address>
                                    </div>
                                    <div class="pull-right text-right">
                                        <address>
                                            <h3>To,</h3>
                                            <h4 class="font-bold">Customer</h4>
                                           
                                            <h4 class="m-t-30">Receipt Date : <i class="fa fa-calendar"></i> <asp:Label ID="receiptdate" runat="server" Text="Label"></asp:Label></h4>
                                           
                                        </address>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="table-responsive m-t-40" style="clear: both;">
                                    <asp:GridView ID="GridView2" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" style="border:0px;">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ORDERMENUCODE" HeaderText="Code" SortExpression="ORDERMENUCODE"></asp:BoundField>
                                            <asp:BoundField DataField="MENUNAME" HeaderText="Description" SortExpression="MENUNAME"></asp:BoundField>
                                            <asp:BoundField DataField="ORDERQUANTITY" HeaderText="Quantity" SortExpression="ORDERQUANTITY"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Unit Price" SortExpression="MENUPRICE">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("MENUPRICE") %>' ID="TextBox1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    RM <asp:Label runat="server" Text='<%# Bind("MENUPRICE") %>' ID="Label1"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total" SortExpression="ORDERTOTALPRICE">
                                                <EditItemTemplate>
                                                    <asp:TextBox runat="server" Text='<%# Bind("ORDERTOTALPRICE") %>' ID="TextBox2"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    RM <asp:Label runat="server" Text='<%# Bind("ORDERTOTALPRICE") %>' ID="Label2"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            


                                        </Columns>
                                    </asp:GridView>
                                        </div>

                                  
                                    
                                 
                                </div>
                    

                                <div class="col-md-12">
                                    <div class="pull-right m-t-30 text-right">
                                        <h4>Sub - Total amount: RM<asp:Label ID="lblsubtotal" runat="server" Text="Label"></asp:Label></h4>
                                   
                                        <hr>
                                        <h3><b>Total : </b>RM <asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label></h3>
                                    </div>
                                    <div class="clearfix"></div>
                                   
                                    
                                </div>
                            </div>


            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose4" runat="server" Text="Close" CssClass="btn btn-danger" />
                
            </div>
        </div>
            </div>
           
    </asp:Panel>




                   </ContentTemplate> 
        </asp:UpdatePanel> 

    
    <asp:LinkButton ID="LinkButton5" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender  ID="mp_paycounter" runat="server" PopupControlID="pnlpaycounter" TargetControlID="LinkButton5" CancelControlID="ButtonClose5" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlpaycounter" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none" >

       
        <div class="modal-dialog modal-dialog-centered modal-xl fadeIn animated">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h3 class="modal-title font-bold" style="color:white;">Select Payment Ways</h3>
            </div>
            <div class="modal-body">
                
                <div class="row">
                <div class="col-lg-12" style="text-align:center;">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/assets/images/cashier.png" style="width:200px; height:200px"/>
                    </div>
                    </div>
                <div class="row">
                    <div class="col-lg-12" style="text-align:center;">
                <h3>Kindly go to counter and tell your table number to make payment.</h3>
                        </div>
                   </div>         
            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose5" runat="server" Text="Close" CssClass="btn btn-secondary font-weight-bold" style="color:red" />
                
            </div>
        </div>
           </div>
    </asp:Panel>

    <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
    <asp:ModalPopupExtender  ID="mp_choosepaymentgateway" runat="server" PopupControlID="pnlchoosepayment" TargetControlID="LinkButton3" CancelControlID="ButtonClose3" BackgroundCssClass="modal-backdrop"></asp:ModalPopupExtender>
    <asp:Panel ID="pnlchoosepayment" runat="server" style="position: fixed;z-index: 10002;left: 0px;top: 0px;height:  100%;width:  100%; overflow-y: auto;display:none" >

       
        <div class="modal-dialog modal-dialog-centered modal-xl fadeIn animated">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h3 class="modal-title font-bold" style="color:white;">Select Payment Ways</h3>
            </div>
            <div class="modal-body">
                
                 <div class="row">
                                <div class="col-lg-6">       
                                <div class="card ">
                                    <div class="card-body">
                                        <div id="paypal-button-container"></div>
                                       <!-- <asp:ImageButton ID="btnPaypal" runat="server" ImageUrl="~/assets/images/PayPal.png" Height="100%" Width="100%"/> -->
                                        </div>
                                  </div>
                                    </div>
                                        <div class="col-lg-6">
                                             <div class="card ">
                                    <div class="card-body">
                                         
                                       <!-- <asp:Button ID="Button4" runat="server" Text="CAPIKS COINS" class="btn btn-block btn-lg btn-rounded btn-secondary font-weight-bold" style="height:80px"/> -->

                                        </div>
                                  </div>
                                        </div>
                                            </div>

            </div>
            <div class="modal-footer">
                <asp:Button ID="ButtonClose3" runat="server" Text="Close" CssClass="btn btn-secondary font-weight-bold" style="color:red" />
                
            </div>
        </div>
            </div>
    </asp:Panel>


                  



    


      

               
                      
                         
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script" Runat="Server">


</asp:Content>

