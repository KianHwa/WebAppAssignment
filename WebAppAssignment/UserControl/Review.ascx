<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Review.ascx.cs" Inherits="WebAppAssignment.UserControl.Review" %>
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

    .reviewInfo{
        width:55%;
        margin:10px;
        background-color:rgba(255,255,255,0.8);
        float:left;
        padding:20px;
    }

    .reviewDetails{
        width:100%;
    }
    .auto-style1 {
        height: 26px;
    }

    .paymentInfo td{
        height:20px;
        padding:20px;
        font-size:18px;
    }

    .txtCardHolderName, .txtCardNumber, .txtCVV{
        height:35px;
        width:100%;
        border:1px solid #d9d9d9;
    }

    

    .validationMsg{
        color:red;
        position:absolute;
        margin-left:10px;   
    }

    .ddlDate{
        width:100%;
        height:35px;
    }

    .cardimg td{
        width:25%;
    }

    .cardimg img{
        width:60px;
        height:45px;
        vertical-align:middle;
    }
    
</style>

<div class="progressBarContainer" style="width:100%;display:inline-block;">
    <ul class="progressBar">
        <li class="finished">Shipping</li>
        <li class="finished">Payment</li>
        <li class="active">Review</li>
        <li>Complete</li>
    </ul>
</div>

 <%float total = (float)Session["subtotal"]; %>

<div class="reviewInfo">
    <h2 style="padding:10px;">Order Confirmation</h2>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="reviewDetails">
                    <tr>
                    <td rowspan="3" style="width:30%;height:100px;"><img src="<%# Eval("artworkURL")%>" style="width:100%;height:100px;" /></td>
                    <td style="padding-left:20px;font-size:25px;"><%# Eval("artworkName") %></td>
                </tr>
                <tr>
                    <td style="padding-left:20px;color:gray">RM <%# Eval("artworkPrice") %></td>
                </tr>
                <tr>
                    <td style="padding-left:20px;color:gray">Quantity : <%# Eval("orderQuantity") %></td>
                </tr>
                </table>
            </ItemTemplate>
    </asp:Repeater>  
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
</div>

<div class="orderSummary">
        <h3>Order Summary</h3>
        <table class="orderSummaryInfo">
            <tr>
                <td>Artwork's subtotal</td>
                <td>RM <%= total %></td>
            </tr>
            <tr>
                <td>Shipping cost</td>
                <td>RM <%= total*0.02 %></td>
            </tr>
            <tr>
                <td style="height:60px;font-size:20px;"><strong>Grand Total</strong></td>
                <td><strong>RM <%= total + (total*0.02) %></strong></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnContinuePayment" runat="server" Text="Continue to Payment"  CssClass="btnContinuePayment" OnClick="btnContinuePayment_Click"/></td>
            </tr>
        </table>
    </div>

