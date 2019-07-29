<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage/GuestHeader.Master" CodeBehind="CheckOut.aspx.cs" Inherits="WebAppAssignment.WebForm.CheckOut" %>
<%@ Register TagPrefix="CheckOut" TagName="Shipping" Src="~/UserControl/Shipping.ascx" %>
<%@ Register TagPrefix="CheckOut" TagName="Payment" Src="~/UserControl/Payment.ascx" %>

<asp:Content ID="CheckOut" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            margin-top:150px;
            background:url('../Images/grey.jpg');
        }

        .body{
            margin:100px;
        }

        .progressBar{
            counter-reset:step;
        }

        .progressBar li{
            list-style-type:none;
            float:left;
            width:25%;
            position:relative;
            text-align:center;
        }

        .progressBar li:before{
            content:counter(step);
            counter-increment:step;
            width:30px;
            height:30px;
            line-height:30px;
            border:1px solid #d9d9d9;
            display:block;
            text-align:center;
            margin:0 auto 10px auto;
            border-radius:50%;
            background-color:white;
        }

        .progressBar li:after{
            content:'';
            position:absolute;
            width:100%;
            height:1px;
            background-color:white;
            top:15px;
            left:-50%;
            z-index:-1;
        }

        .orderSummary{
        background-color:rgba(255,255,255,0.8);
        width:35%;
        float:left;
        margin:10px;
        padding:20px;
    }

    .orderSummaryInfo{
        width:100%;
    }

    .orderSummary td{
        height:20px;
        width:50%;
        font-size:18px;
    }

    .orderSummary td:nth-child(2){
        text-align:right;
    }

    .btnContinuePayment{
        width:80%;
        height:50px;
        background-color:green;
        color:white;
        border:none;
        margin-left:10%;
        font-size:14px;
        transition:0.3s;
    }

    .btnContinuePayment:hover{
        background-color:#00e600;
        transition:0.3s;
    }
    </style>
    
    
        <div class="body" style="background-color:rgba(89,89,89,0.3);z-index:-3;position:relative;">
           
            <CheckOut:Payment ID="ctlPayment" runat="server"/>
        </div>
</asp:Content>