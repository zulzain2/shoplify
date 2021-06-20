<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ReportDaily.aspx.vb" Inherits="ReportDaily" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        #screenFiller {
    position: absolute;
    top: 70px; right: 0; bottom: 0; left: 0;
    border: 15px solid grey
}

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                     <h3 class="page-header"><i class="mdi mdi-account-multiple-plus"></i>&nbsp Daily Report</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                        <li class="breadcrumb-item">Report</li>
                            <li class="breadcrumb-item font-bold">Daily report</li>
                        
                    </ol>
                </div>
              
            </div>

    <div class="row">
        <div class="col-xl-6 col-lg-12">
            <div class="card"  style="background-color:#f4f6f9">
                
                    <div class="row">
              <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btndaily" runat="server" class="btn btn-inverse btn-block"> Daily</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnweekly" runat="server" class="btn btn-outline-secondary btn-block"> Weekly</asp:LinkButton>
             </div>
                    <div class="col-lg-3 col-6">
                 <asp:LinkButton ID="btnmonthly" runat="server" class="btn btn-outline-secondary btn-block"> Monthly</asp:LinkButton>
             </div>
                    </div>
                    
                
          
             </div>
        </div>
    </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <div style="height:100vh;background-color:white" >
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" Height="100%" ZoomMode="PageWidth">
        <LocalReport ReportPath="ReportDaily.rdlc">
            <DataSources>
                <rsweb:ReportDataSource Name="ReportDailyDataSet" DataSourceId="ObjectDataSource2"></rsweb:ReportDataSource>
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
       </div>



    <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ReportDailyDataSetTableAdapters.SHOPLIFYORDERTOTALTableAdapter" UpdateMethod="Update">
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
            <asp:Parameter Name="Original_ORDERTOTALID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="ReportDailyDataSetTableAdapters.SHOPLIFYORDERTOTALTableAdapter" ID="ObjectDataSource1"></asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

