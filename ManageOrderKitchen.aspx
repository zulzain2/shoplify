<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageOrderKitchen.aspx.vb" Inherits="ManageOrderKitchen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

     
                                                           
     <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Kitchen Manage Order</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">Kitchen</li>
                            <li class="breadcrumb-item font-bold">Manage Order</li>
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
                                        <h4 class="m-b-0 text-white">Manage Order</h4>
                                    </div>
                                    <div class="card-body">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                             
                                         <asp:UpdatePanel ID="UpdatePanel1" runat="server"> 
                       <ContentTemplate>  

                                     <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick"></asp:Timer> 
                                       
                                     

                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ORDERID, ORDERFINALNUM">

                                             
                                            
                                            <EditItemTemplate>
                                                <span style="">ORDERMENUCODE:
                                                    <asp:TextBox Text='<%# Bind("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODETextBox" /><br />
                                                    MENUNAME:
                                                    <asp:TextBox Text='<%# Bind("MENUNAME") %>' runat="server" ID="MENUNAMETextBox" /><br />
                                                    ORDERQUANTITY:
                                                    <asp:TextBox Text='<%# Bind("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYTextBox" /><br />
                                                    ORDERDESCRIPTION:
                                                    <asp:TextBox Text='<%# Bind("ORDERDESCRIPTION") %>' runat="server" ID="ORDERDESCRIPTIONTextBox" /><br />
                                                    ORDERSTATUS:
                                                    <asp:TextBox Text='<%# Bind("ORDERSTATUS") %>' runat="server" ID="ORDERSTATUSTextBox" /><br />
                                                    ORDERTABLE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTABLE") %>' runat="server" ID="ORDERTABLETextBox" /><br />
                                                    ORDERTOTALPRICE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICETextBox" /><br />
                                                    MENUPRICE:
                                                    <asp:TextBox Text='<%# Bind("MENUPRICE") %>' runat="server" ID="MENUPRICETextBox" /><br />
                                                    MENUCATEGORY:
                                                    <asp:TextBox Text='<%# Bind("MENUCATEGORY") %>' runat="server" ID="MENUCATEGORYTextBox" /><br />
                                                    MENUPICTURE:
                                                    <asp:TextBox Text='<%# Bind("MENUPICTURE") %>' runat="server" ID="MENUPICTURETextBox" /><br />
                                                    MENUTYPE:
                                                    <asp:TextBox Text='<%# Bind("MENUTYPE") %>' runat="server" ID="MENUTYPETextBox" /><br />
                                                    MENUSETTYPE:
                                                    <asp:TextBox Text='<%# Bind("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPETextBox" /><br />
                                                    Expr1:
                                                    <asp:TextBox Text='<%# Bind("Expr1") %>' runat="server" ID="Expr1TextBox" /><br />
                                                    TOTALMENUORDER:
                                                    <asp:TextBox Text='<%# Bind("TOTALMENUORDER") %>' runat="server" ID="TOTALMENUORDERTextBox" /><br />
                                                    ORDERTAKEBY:
                                                    <asp:TextBox Text='<%# Bind("ORDERTAKEBY") %>' runat="server" ID="ORDERTAKEBYTextBox" /><br />
                                                    ORDERTAKETIME:
                                                    <asp:TextBox Text='<%# Bind("ORDERTAKETIME") %>' runat="server" ID="ORDERTAKETIMETextBox" /><br />
                                                    ORDERFINALNUM:
                                                    <asp:TextBox Text='<%# Bind("ORDERFINALNUM") %>' runat="server" ID="ORDERFINALNUMTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                    <br />
                                                </span>



                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <span>No data was returned.</span>


                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <span style="">ORDERMENUCODE:
                                                    <asp:TextBox Text='<%# Bind("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODETextBox" /><br />
                                                    MENUNAME:
                                                    <asp:TextBox Text='<%# Bind("MENUNAME") %>' runat="server" ID="MENUNAMETextBox" /><br />
                                                    ORDERQUANTITY:
                                                    <asp:TextBox Text='<%# Bind("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYTextBox" /><br />
                                                    ORDERDESCRIPTION:
                                                    <asp:TextBox Text='<%# Bind("ORDERDESCRIPTION") %>' runat="server" ID="ORDERDESCRIPTIONTextBox" /><br />
                                                    ORDERSTATUS:
                                                    <asp:TextBox Text='<%# Bind("ORDERSTATUS") %>' runat="server" ID="ORDERSTATUSTextBox" /><br />
                                                    ORDERTABLE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTABLE") %>' runat="server" ID="ORDERTABLETextBox" /><br />
                                                    ORDERTOTALPRICE:
                                                    <asp:TextBox Text='<%# Bind("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICETextBox" /><br />
                                                    MENUPRICE:
                                                    <asp:TextBox Text='<%# Bind("MENUPRICE") %>' runat="server" ID="MENUPRICETextBox" /><br />
                                                    MENUCATEGORY:
                                                    <asp:TextBox Text='<%# Bind("MENUCATEGORY") %>' runat="server" ID="MENUCATEGORYTextBox" /><br />
                                                    MENUPICTURE:
                                                    <asp:TextBox Text='<%# Bind("MENUPICTURE") %>' runat="server" ID="MENUPICTURETextBox" /><br />
                                                    MENUTYPE:
                                                    <asp:TextBox Text='<%# Bind("MENUTYPE") %>' runat="server" ID="MENUTYPETextBox" /><br />
                                                    MENUSETTYPE:
                                                    <asp:TextBox Text='<%# Bind("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPETextBox" /><br />
                                                    Expr1:
                                                    <asp:TextBox Text='<%# Bind("Expr1") %>' runat="server" ID="Expr1TextBox" /><br />
                                                    TOTALMENUORDER:
                                                    <asp:TextBox Text='<%# Bind("TOTALMENUORDER") %>' runat="server" ID="TOTALMENUORDERTextBox" /><br />
                                                    ORDERTAKEBY:
                                                    <asp:TextBox Text='<%# Bind("ORDERTAKEBY") %>' runat="server" ID="ORDERTAKEBYTextBox" /><br />
                                                    ORDERTAKETIME:
                                                    <asp:TextBox Text='<%# Bind("ORDERTAKETIME") %>' runat="server" ID="ORDERTAKETIMETextBox" /><br />
                                                    ORDERFINALNUM:
                                                    <asp:TextBox Text='<%# Bind("ORDERFINALNUM") %>' runat="server" ID="ORDERFINALNUMTextBox" /><br />
                                                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                    <br />
                                                </span>



                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <span style="">
                                                    <hr runat="server" ID="hr1" style="border-top: 5px solid rgba(0,0,0,.1);"/>
                                                    <div class="row" >
                                                        
                                                        <div class="col-md-3">
                                                           
                                                             <h2 class="font-weight-bold label label-inverse label-rounded" runat="server" id="ordernumttl" ><asp:Label Text='<%# Eval("ORDERFINALNUM")%>' runat="server" ID="orderNum" style="line-height: 1;font-size:40px;"/></h2>
                                                           <h5><asp:Label Text='<%# Eval("FINALORDERSTATUS") %>' runat="server" ID="FINALORDERSTATUSLabel" class="label label-warning font-weight-bold font-16"/> <div class="spinner-border text-danger" role="status" runat="server" id="finalstatusspinner" style="width:1.5rem; height:1.5rem"></div></h5>
                                                             
                                                                
                                                                
                                                            <h4 class="font-weight-bold" style="color:red"><asp:Label Text='<%# Eval("ORDERTAKETIME") %>' runat="server" ID="ORDERTAKETIMELabel" /></h4>

                                                           
                                                        
                                                   

                                                        </div>

                                                    

                                                    <div class="col-md-9">
                                                    
                                                        <div class="row">
                                                        <h5 class="label label-info" runat="server" ID="Tablelbl" style="line-height: 2;"><asp:Label Text='Table : ' runat="server" class="font-18" /><asp:Label Text='<%# Eval("ORDERTABLE") %>' runat="server" ID="ORDERTABLELabel" class="font-weight-bold font-18"/></h5>
                                                        <h5 class="label label-info" runat="server" ID="Totalqtylbl" style="line-height: 2;"><asp:Label Text='Total Quantity : ' runat="server" class="font-18"  /><asp:Label Text='<%# Eval("TOTALMENUORDER") %>' runat="server" ID="TOTALMENUORDERLabel" class="font-weight-bold font-18"/></h5>
                                                        <h5 class="label label-info" runat="server" ID="Takebylbl" style="line-height: 2;"><asp:Label Text='Take By : ' runat="server" class="font-18"  /><asp:Label Text='<%# Eval("ORDERTAKEBY") %>' runat="server" ID="ORDERTAKEBYLabel" class="font-weight-bold font-18"/></h5>
                                                        </div>

                                                    <div class="row">
                                                    <div class="col-md-6">
                                                    <h5 class="label label-inverse" style="line-height: 20px;"> <asp:Label Text='<%# Eval("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODELabel" class="font-16 font-weight-bold"/>&nbsp
                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" class="font-16 font-weight-bold"/>&nbsp</h5>
                                                    <asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel"  class="font-weight-bold"/>&nbsp
                                                    <asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" class="font-weight-bold"/><br />
                                                    <asp:Label Text='<%# Eval("ORDERSTATUS") %>' runat="server" ID="ORDERSTATUSLabel" class=""/>&nbsp&nbsp<div class="spinner-border text-danger" role="status" runat="server" id="eachstatusspinner" style="width:1rem; height:1rem"></div><br />
                                                    <asp:Label ID="Label2" runat="server" Text="Quantity : x " class="font-weight-bold"></asp:Label>
                                                    <asp:Label Text='<%# Eval("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYLabel" class="font-weight-bold label label-danger label-rounded font-20" style="line-height: 1;"/><br />
                                                    <asp:Label ID="Label1" runat="server" Text="Order Remarks : " class="font-weight-bold"></asp:Label>
                                                    <asp:Label Text='<%# Eval("ORDERDESCRIPTION") %>' runat="server" ID="ORDERDESCRIPTIONLabel" /><br />
                                                    </div>
                                                        <div class="col-md-3">
                                                           <div class="form-group">
                                                               <asp:Button ID="btnstartorder" runat="server" CommandName="STARTORDER" CommandArgument='<%# Container.DataItemIndex %>' Text="Start" class="font-weight-bold btn btn-success btn-lg btn-block" style="font-size: medium;"/> 
                                                               <asp:Button ID="btnrevertorder" runat="server" CommandName="REVERTORDER" CommandArgument='<%# Container.DataItemIndex %>' Text="Revert" class="font-weight-bold btn btn-warning btn-lg btn-block" style="font-size: medium;"/> 
                                                            </div>
                                                         </div>
                                                        <div class="col-md-3">
                                                           <div class="form-group">
                                                                <asp:Button ID="btnrejectorder" runat="server" CommandName="REJECTORDER" CommandArgument='<%# Container.DataItemIndex %>' Text="Reject" class="font-weight-bold btn btn-danger btn-lg btn-block" style="font-size: medium; display:none;"/> 
                                                               <asp:Button ID="btnfinishorder" runat="server" CommandName="FINISHORDER" CommandArgument='<%# Container.DataItemIndex %>' Text="Finish" class="font-weight-bold btn btn-success btn-lg btn-block" style="font-size: medium;"/> 
                                                            </div>
                                                         </div>
                                                        </div>
                                                        <asp:Label Text='<%# Eval("ORDERID") %>' runat="server" ID="ORDERIDLabel" Visible="false"/>
                                                  
                                                 <!--   ORDERTOTALPRICE:
                                                    <asp:Label Text='<%# Eval("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICELabel" /><br />
                                                    MENUPRICE:
                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br /> -->
                                                 
                                                    
                                                    
                                                    
                                                    
                                                    </div>
                                                    </div>
                                                     
                                                    <br />

                                                </span>



                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div runat="server" id="itemPlaceholderContainer" style="">
                                                    <span runat="server" id="itemPlaceholder" />

                                                </div>
                                                <div style="">
                                                </div>

                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <span style="">ORDERMENUCODE:
                                                    <asp:Label Text='<%# Eval("ORDERMENUCODE") %>' runat="server" ID="ORDERMENUCODELabel" /><br />
                                                    MENUNAME:
                                                    <asp:Label Text='<%# Eval("MENUNAME") %>' runat="server" ID="MENUNAMELabel" /><br />
                                                    ORDERQUANTITY:
                                                    <asp:Label Text='<%# Eval("ORDERQUANTITY") %>' runat="server" ID="ORDERQUANTITYLabel" /><br />
                                                    ORDERDESCRIPTION:
                                                    <asp:Label Text='<%# Eval("ORDERDESCRIPTION") %>' runat="server" ID="ORDERDESCRIPTIONLabel" /><br />
                                                    ORDERSTATUS:
                                                    <asp:Label Text='<%# Eval("ORDERSTATUS") %>' runat="server" ID="ORDERSTATUSLabel" /><br />
                                                    ORDERTABLE:
                                                    <asp:Label Text='<%# Eval("ORDERTABLE") %>' runat="server" ID="ORDERTABLELabel" /><br />
                                                    ORDERTOTALPRICE:
                                                    <asp:Label Text='<%# Eval("ORDERTOTALPRICE") %>' runat="server" ID="ORDERTOTALPRICELabel" /><br />
                                                    MENUPRICE:
                                                    <asp:Label Text='<%# Eval("MENUPRICE") %>' runat="server" ID="MENUPRICELabel" /><br />
                                                    MENUCATEGORY:
                                                    <asp:Label Text='<%# Eval("MENUCATEGORY") %>' runat="server" ID="MENUCATEGORYLabel" /><br />
                                                    MENUPICTURE:
                                                    <asp:Label Text='<%# Eval("MENUPICTURE") %>' runat="server" ID="MENUPICTURELabel" /><br />
                                                    MENUTYPE:
                                                    <asp:Label Text='<%# Eval("MENUTYPE") %>' runat="server" ID="MENUTYPELabel" /><br />
                                                    MENUSETTYPE:
                                                    <asp:Label Text='<%# Eval("MENUSETTYPE") %>' runat="server" ID="MENUSETTYPELabel" /><br />
                                                    Expr1:
                                                    <asp:Label Text='<%# Eval("Expr1") %>' runat="server" ID="Expr1Label" /><br />
                                                    TOTALMENUORDER:
                                                    <asp:Label Text='<%# Eval("TOTALMENUORDER") %>' runat="server" ID="TOTALMENUORDERLabel" /><br />
                                                    ORDERTAKEBY:
                                                    <asp:Label Text='<%# Eval("ORDERTAKEBY") %>' runat="server" ID="ORDERTAKEBYLabel" /><br />
                                                    ORDERTAKETIME:
                                                    <asp:Label Text='<%# Eval("ORDERTAKETIME") %>' runat="server" ID="ORDERTAKETIMELabel" /><br />
                                                    ORDERFINALNUM:
                                                    <asp:Label Text='<%# Eval("ORDERFINALNUM") %>' runat="server" ID="ORDERFINALNUMLabel" /><br />
                                                    <br />
                                                </span>



                                            </SelectedItemTemplate>
                                        </asp:ListView>

                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ShoplifyConnectionString %>' SelectCommand="SELECT SHOPLIFYORDER.ORDERID, SHOPLIFYORDER.ORDERMENUCODE, SHOPLIFYMENUMASTER.MENUNAME, SHOPLIFYORDER.ORDERQUANTITY, SHOPLIFYORDER.ORDERDESCRIPTION, SHOPLIFYORDERTOTAL.FINALORDERSTATUS,SHOPLIFYORDER.ORDERSTATUS, SHOPLIFYORDER.ORDERTABLE, SHOPLIFYORDER.ORDERTOTALPRICE, SHOPLIFYMENUMASTER.MENUPRICE, SHOPLIFYMENUMASTER.MENUCATEGORY, SHOPLIFYMENUMASTER.MENUPICTURE, SHOPLIFYMENUMASTER.MENUTYPE, SHOPLIFYMENUMASTER.MENUSETTYPE, SHOPLIFYORDERTOTAL.ORDERTOTALPRICE AS Expr1, SHOPLIFYORDERTOTAL.TOTALMENUORDER, SHOPLIFYORDERTOTAL.ORDERTAKEBY, SHOPLIFYORDERTOTAL.ORDERTAKETIME, SHOPLIFYORDERTOTAL.ORDERFINALNUM FROM SHOPLIFYORDER INNER JOIN SHOPLIFYMENUMASTER ON SHOPLIFYORDER.ORDERMENUCODE = SHOPLIFYMENUMASTER.MENUCODE INNER JOIN SHOPLIFYORDERTOTAL ON SHOPLIFYORDER.ORDERNUM = SHOPLIFYORDERTOTAL.ORDERNUM WHERE SHOPLIFYORDERTOTAL.FINALORDERSTATUS = @MENUSTATUS OR SHOPLIFYORDERTOTAL.FINALORDERSTATUS = @MENUSTATUS2 ORDER BY ORDERFINALNUM ASC">
                                            <SelectParameters>
                                                    <asp:Parameter DefaultValue="SUBMIT TO KITCHEN" Name="MENUSTATUS" Type="String"></asp:Parameter>
                                                    <asp:Parameter DefaultValue="PROCESSING" Name="MENUSTATUS2" Type="String"></asp:Parameter>
                                                </SelectParameters>
                                        </asp:SqlDataSource>
                                      </ContentTemplate>
                   </asp:UpdatePanel> 
                           </div>
                                    </div>
                            
                                </div>
           </div>
      

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">

  <!--  <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-database.js"></script>

    <script>
        // Initialize Firebase
        const config = {
        apiKey: "AIzaSyAtlu1prM5tDuQLazq-jsiKXVaDmurd1fY",
        authDomain: "shoplifymagicx.firebaseapp.com",
        databaseURL: "https://shoplifymagicx.firebaseio.com",
        projectId: "shoplifymagicx",
        storageBucket: "shoplifymagicx.appspot.com",
        messagingSenderId: "790497413880"
        };
        const db = firebase.initializeApp(config);
        const database = db.database();

        database.ref('kitchenmanagechange').on('value', function (snapshot) {
            const value = snapshot.val()
            const status2
            for (data in value) {
       
                status2 = value[data].status
       
            }
           
            if (status2 == "change") {
                document.getElementById("").click();
            }
        })

    </script> -->
</asp:Content>

