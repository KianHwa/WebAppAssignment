<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Shipping.ascx.cs" Inherits="WebAppAssignment.UserControl.Shipping" %>

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

    .progressBar li.active + li:after{
        background-color:green;
    }

    .progressBar li.current{
        color:green;
    }

    .progressBar li.current:before{
        border-color:green;
    }

    .shippingInfo{
        width:55%;
        margin:10px;
        background-color:rgba(255,255,255,0.8);
        float:left;
        padding:20px;
    }

    .personalInfo {
        width:100%;
        margin:10px;
    }

    .personalInfo td{
        height:20px;
        padding:20px;
        font-size:18px;
    }

    .personalInfo td:nth-child(1){
        text-align:right;
        width:30%;
    }

    .personalInfo td:nth-child(2){
        background-color:#d9d9d9;
        width:70%;
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
<div class="progressBarContainer" style="width:100%;display:inline-block;">
    <ul class="progressBar">
        <li class="current">Shipping</li>
        <li>Payment</li>
        <li>Review</li>
        <li>Completed</li>
    </ul>
</div>
<div class="shippingInfo">
    <asp:FormView ID="personalInfoFv" runat="server" DataSourceID="SqlDataSource1" style="width:100%;">
        <ItemTemplate>
            <table class="personalInfo">
                <div style="padding-left:30px;">
                    <h2>Your shipping address</h2>
                    <h4>Make sure your personal information is correct</h4>
                </div>
                <tr>
                    <td>Username:</td>
                    <td><asp:Label ID="UsernameLabel" runat="server" Text='<%# Bind("Username") %>' /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' /></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><asp:Label ID="phoneNumberLabel" runat="server" Text='<%# Bind("phoneNumber") %>' /></td>
                </tr>
            </table>
            <p style="padding-left:30px">Any information need to change? <a href="../WebForm/Profile.aspx">Click here</a></p>
        </ItemTemplate>
    </asp:FormView>
</div>
<div class="orderSummary">
        <h3>Order Summary</h3>
        <table class="orderSummaryInfo">
            <tr>
                <td>Artwork's subtotal</td>
                <td>RM 1010</td>
            </tr>
            <tr>
                <td>Shipping cost</td>
                <td>RM22</td>
            </tr>
            <tr>
                <td style="height:60px;font-size:20px;"><strong>Grand Total</strong></td>
                <td><strong>RM 1032 </strong></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnContinuePayment" runat="server" Text="Continue to Payment"  CssClass="btnContinuePayment"/></td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="Select  aspnet_Users.Username, aspnet_Membership.Email,UserProfile.address, UserProfile.phoneNumber from aspnet_Membership inner join aspnet_Users on aspnet_Membership.UserId = aspnet_Users.UserId inner join UserProfile on aspnet_Users.UserId = UserProfile.UserId"></asp:SqlDataSource>






