<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="PaymentSuccessfull.aspx.vb" Inherits="PaymentSuccessfull" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
.lds-heart {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 64px;
  transform: rotate(45deg);
  transform-origin: 32px 32px;
}
.lds-heart div {
  top: 23px;
  left: 19px;
  position: absolute;
  width: 26px;
  height: 26px;
  background: #ff0000;
  animation: lds-heart 1.2s infinite cubic-bezier(0.215, 0.61, 0.355, 1);
}
.lds-heart div:after,
.lds-heart div:before {
  content: " ";
  position: absolute;
  display: block;
  width: 26px;
  height: 26px;
  background: #ff0000;
}
.lds-heart div:before {
  left: -17px;
  border-radius: 50% 0 0 50%;
}
.lds-heart div:after {
  top: -17px;
  border-radius: 50% 50% 0 0;
}
@keyframes lds-heart {
  0% {
    transform: scale(0.95);
  }
  5% {
    transform: scale(1.1);
  }
  39% {
    transform: scale(0.85);
  }
  45% {
    transform: scale(1);
  }
  60% {
    transform: scale(0.95);
  }
  100% {
    transform: scale(0.9);
  }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

     
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
                        <li class="breadcrumb-item">Order Status</li>
             
                    </ol>
                </div>
              
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

        <div class="row">
                   
              <asp:Timer ID="Timer1" runat="server" Interval="3000"></asp:Timer> 

            <% If Session("paypalstatus") = "SUCCESS" %>
            
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-body text-center">
                                        <h1>PAYMENT SUCCESSFULL</h1>
                                       <div class="lds-heart"><div></div></div>
                                        <h6>You will be redirect in few seconds.</h6>
                                        </div>
                                    </div>
                                </div>

            <%Else If Session("paypalstatus") = "FAIL" %>

           
                            <div class="col-lg-12">
                                <div class="card ">
                                    <div class="card-body text-center">
                                        <h1>PAYMENT FAIL</h1>
                                        <h6>You will be redirect in few seconds.</h6>
                                        </div>
                                    </div>
                                </div>
            <%End If %>

            </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" Runat="Server">
</asp:Content>

