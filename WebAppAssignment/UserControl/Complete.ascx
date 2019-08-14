<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Complete.ascx.cs" Inherits="WebAppAssignment.UserControl.Complete" %>
<style>
    .progressBar li:first-child:after{
        content:none;
    }

    .progressBar li.active{
        color:green;
        
    }

    .progressBar li.active:before{
        border-color:green;
    }

    .progressBar li.finished + li:after{
        background-color:green;
    }

    .progressBar li.finished:before{
        border-color:green;
        background-color:green;
        color:white;
    }

    .completePayment{
        width:95%;
        margin:10px;
        background-color:rgba(255,255,255,0.8);
        float:left;
        padding:20px;
    }
    .auto-style1 {
        height: 26px;
    }

    .btnGoToShopping, .btnGoToHome{
        width:150px;
        height:40px;
        color:black;
        background-color:white;
        border:1px solid #d9d9d9;
    }

    .btnGoToShopping:hover, .btnGoToHome:hover{
        transition:0.3s;
        color:white;
        background-color:black;
    }
    
</style>

<div class="progressBarContainer" style="width:100%;display:inline-block;">
    <ul class="progressBar">
        <li class="finished">Shipping</li>
        <li class="finished">Payment</li>
        <li class="finished">Review</li>
        <li class="active">Complete</li>
    </ul>
</div>

<div class="completePayment">
    <div style="width:100%;">
        <img src="../Images/tick.png" style="height:200px;width:200px;margin-left:42%;margin-right:42%;"/>
    </div>
    <div style="width:100%;">
        <h2 style="text-align:center;color:gray">Thank you for purchasing our product</h2>
        <h3 style="text-align:center;color:gray">Your purchase has been processed</h3>
    </div>
    <div style="width:47%;float:left;text-align:right;padding-right:20px">
        <asp:Button ID="btnGoToHome" runat="server" Text="Back to Home" OnClick="btnGoToHome_Click" CssClass="btnGoToHome"/>
    </div>
    <div style="width:47%;float:left;padding-left:20px;">
        <asp:Button ID="btnGoToShopping" runat="server" Text="Continue to shopping" OnClick="btnGoToShopping_Click" CssClass="btnGoToShopping"/>
    </div>
</div>