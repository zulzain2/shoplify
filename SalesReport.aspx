<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SalesReport.aspx.vb" Inherits="SalesReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-format-list-numbers"></i>&nbsp Sales Report</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">Home</li>
                        <li class="breadcrumb-item">Reports</li>
                        <li class="breadcrumb-item font-bold">Sales Report</li>
                        
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
                                <h4 class="m-b-0 text-white">Sales Reports</h4>
                            </div>
                            <div class="card-body">

                                <div class="row">
                   
                    <div class="col-lg-12">
                        <div class="card">
                            
                               
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs customtab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#overview" role="tab"><span class="hidden-sm-up"><i class="ti-home"></i></span> <span class="hidden-xs-down">Overview</span></a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#daily" role="tab">Daily</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#weekly" role="tab">Weekly</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#monthly" role="tab">Monthly</a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="overview" role="tabpanel">
                                    <div class="p-20">
                                       
                                        <div style="height:100vh;background-color:white" >
                                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" Height="100%" ZoomMode="PageWidth" ShowToolBar="False" ShowWaitControlCancelLink="True">
                                            <LocalReport ReportPath="ReportOverview.rdlc">
                                                <DataSources>
                                                    <rsweb:ReportDataSource Name="ReportOverviewDataSet" DataSourceId="ObjectDataSource2"></rsweb:ReportDataSource>
                                                </DataSources>
                                            </LocalReport>
                                        </rsweb:ReportViewer>
                                            </div>

                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ReportOverviewDataSetTableAdapters.SHOPLIFYORDERTOTALTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_ORDERTOTALID" Type="Int32"></asp:Parameter>
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ORDERTOTALPRICE" Type="Decimal"></asp:Parameter>
                                                <asp:Parameter Name="TOTALMENUORDER" Type="Int32"></asp:Parameter>
                                                <asp:Parameter Name="ORDERTAKEBY" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="ORDERTAKETIME" Type="DateTime"></asp:Parameter>
                                                <asp:Parameter Name="ORDERFINALNUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="ORDERNUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="FINALORDERSTATUS" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="TOTALMENUREJECT" Type="Int32"></asp:Parameter>
                                                <asp:Parameter Name="TABLENUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENT" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="CURRENTTABLESTATUS" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENTTYPE" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENTMADEUSING" Type="String"></asp:Parameter>
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ORDERTOTALPRICE" Type="Decimal"></asp:Parameter>
                                                <asp:Parameter Name="TOTALMENUORDER" Type="Int32"></asp:Parameter>
                                                <asp:Parameter Name="ORDERTAKEBY" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="ORDERTAKETIME" Type="DateTime"></asp:Parameter>
                                                <asp:Parameter Name="ORDERFINALNUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="ORDERNUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="FINALORDERSTATUS" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="TOTALMENUREJECT" Type="Int32"></asp:Parameter>
                                                <asp:Parameter Name="TABLENUM" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENT" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="CURRENTTABLESTATUS" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENTTYPE" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="PAYMENTMADEUSING" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="Original_ORDERTOTALID" Type="Int32"></asp:Parameter>
                                            </UpdateParameters>
                                        </asp:ObjectDataSource>
                                        <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="ReportOverviewDataSetTableAdapters.SHOPLIFYORDERTOTALTableAdapter" ID="ObjectDataSource1"></asp:ObjectDataSource>
                                    </div>
                                </div>
                                <div class="tab-pane  p-20" id="daily" role="tabpanel">
                                   <div class="row">
                              <div class="col-lg-4"></div>
                                    <div class="col-lg-4">
                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-outline-info btn-lg btn-block" style="padding: 10% 0"><i class="mdi mdi-eye"></i><p class="text-center">Daily Report</p></asp:LinkButton>

                                    </div>

                                   

                           
                                </div>
  
                                </div>
                                <div class="tab-pane p-20" id="weekly" role="tabpanel">
                                  <div class="row">
                              
                                   
                                      <div class="col-lg-4"></div>
                                    <div class="col-lg-4">

                                        <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-outline-info btn-lg btn-block" style="padding: 10% 0"><i class="mdi mdi-eye"></i><p class="text-center">Weekly Report</p></asp:LinkButton>
                                    </div>

                                    

                           
                                </div>
                                </div>
                                <div class="tab-pane p-20" id="monthly" role="tabpanel">
                                  <div class="row">
                              
                                   
                                      <div class="col-lg-4"></div>
                                    <div class="col-lg-4">
                                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-outline-info btn-lg btn-block" style="padding: 10% 0"><i class="mdi mdi-eye"></i><p class="text-center">Monthly Report</p></asp:LinkButton>

                                    </div>

                           
                                </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>




                                </div>
                            </div>
                        </div>
                 </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

