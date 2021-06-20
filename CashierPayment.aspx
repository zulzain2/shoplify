<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CashierPayment.aspx.vb" Inherits="CashierPayment" %>

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

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

  <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                       <ContentTemplate> 

                           <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick"></asp:Timer> 
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-book-multiple"></i>&nbsp Payment Status</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Cashier</li>
                        <li class="breadcrumb-item font-bold">Payment</li>
             
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
                                    <div class="card-body">
                                        <h4 class="font-weight-bold">Click on table number if payment have been made.</h4><br />
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="CURRENTMENUORDER,TABLENUM,CURRENTPAYMENTSTATUS">
                                          
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
                                                    
                                                    <asp:Label Text='<%# Eval("CURRENTTABLESTATUS") %>' runat="server" ID="CURRENTTABLESTATUSlbl" /><br /> 
                                                    <asp:Label Text='<%# Eval("CURRENTPAYMENTSTATUS") %>' runat="server" ID="CURRENTPAYMENTSTATUSlbl" /><br /> 
                                                    <div>
                                                    <asp:Image ID="imgtablenotpaid" runat="server" ImageUrl="~/assets/images/table-notpaid.png"  Height="80%" Width="80%"/>
                                                       <asp:Image ID="imgtabledonepaid" runat="server" ImageUrl="~/assets/images/table-donepay.png" Height="80%" Width="80%" /> 

                                                    <asp:Image ID="imgtableavailable" runat="server" ImageUrl="~/assets/images/table-available.png" Height="80%" Width="80%" /> <br />
                                                        </div>
                                                    <asp:Button ID="Button1" runat="server" Text='<%# Eval("TABLENUM") %>' CommandName="VIEWORDER" CommandArgument='<%# Container.DataItemIndex %>' class=""  /><br />
                                                    
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


                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT TABLENUM, TABLESTATUS, CURRENTTABLESTATUS, CURRENTPAYMENTSTATUS, CURRENTMENUORDER FROM SHOPLIFYRESTAURANTTABLE WHERE (TABLESTATUS = @TABLESTATUS)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="ACTIVE" Name="TABLESTATUS" Type="String"></asp:Parameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>

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
        
                                   
       
        <div class="modal-dialog modal-dialog-centered modal-xl zoomIn animated">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title font-bold">ORDER REVIEW <asp:Label ID="Label2" runat="server" Text=""></asp:Label></h4>
            </div>
            <div class="modal-body">
                 
                <div class="row">
                               <div class="col-lg-12">
                                    <h4 class="font-weight-bold" style="color:red;">*Please check and ensure that all order is correct before proceed with confirmation.</h4>

                                   <div style="overflow-x:auto;">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered gvv" HeaderStyle-HorizontalAlign="Center" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="TABLENUM" HeaderText="Table" SortExpression="TABLENUM"></asp:BoundField>
                            <asp:BoundField DataField="ORDERFINALNUM" HeaderText="Order Number" SortExpression="ORDERFINALNUM"></asp:BoundField>
                            <asp:BoundField DataField="ORDERMENUCODE" HeaderText="Code" SortExpression="ORDERMENUCODE"></asp:BoundField>
                            <asp:BoundField DataField="MENUNAME" HeaderText="Name" SortExpression="MENUNAME"></asp:BoundField>
                            <asp:BoundField DataField="MENUPRICE" HeaderText="Price" SortExpression="MENUPRICE"></asp:BoundField>
                            <asp:BoundField DataField="ORDERQUANTITY" HeaderText="Quantity" SortExpression="ORDERQUANTITY"></asp:BoundField>
                            <asp:BoundField DataField="PAYMENT" HeaderText="Payment" SortExpression="PAYMENT"></asp:BoundField>
                            <asp:BoundField DataField="ORDERTOTALPRICE" HeaderText="Total Price" SortExpression="ORDERTOTALPRICE"></asp:BoundField>
                            <asp:BoundField DataField="TOTALMENUORDER" HeaderText="Total Order" SortExpression="TOTALMENUORDER"></asp:BoundField>
                            <asp:BoundField DataField="Expr1" HeaderText="Total Price" SortExpression="Expr1"></asp:BoundField>
                            <asp:BoundField DataField="ORDERDESCRIPTION" HeaderText="Remarks" SortExpression="ORDERDESCRIPTION"></asp:BoundField>
                            
                            
                        </Columns>
                    </asp:GridView> 
                    </div>

                         
                                   

                                  
                                   </div>

                   
                </div>

                <div class="row">
                    <div class="col-lg-3"></div>
                                <div class="col-lg-6">       
                                <div class="card ">
                                    <div class="card-body">

                                        <asp:Button ID="btnconfirmpay" runat="server" Visible="True" Text="CONFIRM PAY" class="btn btn-block btn-lg btn-rounded btn-info font-weight-bold" style="height:80px" UseSubmitBehavior="false" onclick="btnClose_Click" />

                                        <asp:Button ID="btnavailabletable" runat="server" Visible="True" Text="MAKE TABLE AVAILABLE" class="btn btn-block btn-lg btn-rounded btn-success font-weight-bold" style="height:80px" UseSubmitBehavior="false" onclick="btnClose2_Click" />
                                        </div>
                                  </div>
                                    </div>
                                      
                                            </div>

            <div class="modal-footer">
                <asp:Button ID="ButtonClose" runat="server" Text="Close" class="btn btn-danger" />
                
            </div>
        </div>
            </div>
            </div>
           
    </asp:Panel>
                           
        </ContentTemplate> 
        </asp:UpdatePanel> 


                           
                      

    
    


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

     <!-- This is data table -->
    <!-- DataTables JavaScript -->
    <script src="startbootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/datatables.min.js"></script>
    

    <script>
        $(function() {
            bindDataTable(); // bind data table on first page load
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindDataTable); // bind data table on every UpdatePanel refresh
        });
        
        $(function bindDataTable() {
            $(".gvv").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
            });
        });

        </script>

    <script runat="server">

        Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.mp_viewInvoice.Hide()
        End Sub

        Protected Sub btnClose2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.mp_viewInvoice.Hide()
        End Sub

</script>
   


</asp:Content>



