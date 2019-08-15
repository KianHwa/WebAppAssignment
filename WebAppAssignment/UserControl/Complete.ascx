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
        background-color:rgba(255,255,255,0.3);
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
    .paymentSummary{
        width:100%;
    }
    .tablePaymentSummary{
        width:60%;
        margin-left:20%;
        margin-right:20%;
        background-color:rgba(128,128,128,0.1);
        padding:20px;
        margin-top:20px;
        margin-bottom:20px;
        color:#666666;
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

<%float total = (float)Session["subtotal"]; %>

<div class="completePayment">
    <div style="width:100%;">
        <img src="../Images/tick.png" style="height:100px;width:100px;margin-left:45%;margin-right:45%;"/>
    </div>
    <div style="width:100%;">
        <h2 style="text-align:center;color:gray">Thank you for purchasing our product</h2>
        <h3 style="text-align:center;color:gray">Your purchase has been processed</h3>
    </div>
    <div class="paymentSummary">
        <table class="tablePaymentSummary">
            <tr>
                <td colspan="3" style="text-align:center"><h2>Summary</h2></td>
            </tr>
            <tr>
                <th style="width:30%;">Order Item</th>
                <th style="width:30%;">Quantity</th>
                <th style="width:40%;">Price (RM)</th>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <tr style="text-align:center;">
                        <td><%# Eval("artworkName")%></td>
                        <td><%# Eval("orderQuantity")%></td>
                        <td><%# Convert.ToSingle(Eval("artworkPrice")) * Convert.ToInt32(Eval("orderQuantity"))%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="text-align:center;"><h3>Total</h3></td>
                <td></td>
                <td style="text-align:center;"><b><%= total %></b></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="select Artwork.artworkName, Artwork.artworkprice, OrderDetails.orderQuantity from Artwork inner join OrderDetails on Artwork.artworkID = OrderDetails.artworkID inner join Orders on OrderDetails.orderID = Orders.orderID inner join aspnet_Users on Orders.UserID = aspnet_Users.UserId inner join Payment on Payment.paymentID = Orders.paymentID "></asp:SqlDataSource>
    <div style="width:47%;float:left;text-align:right;padding-right:20px">
        <asp:Button ID="btnGoToHome" runat="server" Text="Back to Home" OnClick="btnGoToHome_Click" CssClass="btnGoToHome"/>
    </div>
    <div style="width:47%;float:left;padding-left:20px;">
        <asp:Button ID="btnGoToShopping" runat="server" Text="Continue to shopping" OnClick="btnGoToShopping_Click" CssClass="btnGoToShopping"/>
    </div>
</div>