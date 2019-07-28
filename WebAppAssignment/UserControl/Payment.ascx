<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Payment.ascx.cs" Inherits="WebAppAssignment.UserControl.Payment" %>
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

    .paymentInfo{
        width:55%;
        margin:10px;
        background-color:rgba(255,255,255,0.8);
        float:left;
        padding:20px;
    }

    .paymentDetails{
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
    }

    .ddlDate{
        width:100%;
        height:35px;
    }
    
</style>

<div class="progressBarContainer" style="width:100%;display:inline-block;">
    <ul class="progressBar">
        <li class="finished">Shipping</li>
        <li class="active">Payment</li>
        <li>Review</li>
        <li>Completed</li>
    </ul>
</div>

    <%float total = float.Parse("1"); %>
<div class="paymentInfo">
    <table class="paymentDetails">
        <tr>
            <td style="padding-bottom:0px;" colspan="3" class="auto-style1">Cardholder&#39;s Name *  <asp:RequiredFieldValidator ID="cardHolderNameRequired" runat="server" ControlToValidate="txtCardHolderName" ErrorMessage="CardHolder's Name is required" ToolTip="CardHolder's Name is required" CssClass="validationMsg"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="padding-top:10px;" colspan="3" class="auto-style1"><asp:TextBox ID="txtCardHolderName" runat="server" CssClass="txtCardHolderName" placeholder="  As shown on card"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="padding-bottom:0px;" colspan="3">Card Number * <asp:RequiredFieldValidator ID="cardNumberRequired" runat="server" ControlToValidate="txtCardNumber" ErrorMessage="Card Number is required" ToolTip="Card Number is required" CssClass="validationMsg"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td  style="padding-top:10px;" colspan="3" class="auto-style1">
                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="txtCardNumber" placeholder="  16-digit code on card" MaxLength="16"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="padding-bottom:0px;">Expiry Month *  <asp:RequiredFieldValidator ID="monthRequired" runat="server" ControlToValidate="ddlMonth" ErrorMessage="Required" ToolTip="Expiry Month is required" CssClass="validationMsg" ></asp:RequiredFieldValidator>
            </td>
            <td style="padding-bottom:0px;">Expiry Year *  <asp:RequiredFieldValidator ID="yearRequired" runat="server" ControlToValidate="ddlYear" ErrorMessage="Required" ToolTip="Expiry Year is required" CssClass="validationMsg"></asp:RequiredFieldValidator>
            </td>
            <td style="padding-bottom:0px;">Security Code / CVV *   <asp:RequiredFieldValidator ID="cvvRequired" runat="server" ControlToValidate="txtCVV" ErrorMessage="Required" ToolTip="CVV is required" CssClass="validationMsg"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="padding-top:10px;">
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="ddlDate">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td style="padding-top:10px;">
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="ddlDate">
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2025</asp:ListItem>
                    <asp:ListItem>2026</asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                    <asp:ListItem>2030</asp:ListItem>
                    <asp:ListItem>2031</asp:ListItem>
                    <asp:ListItem>2032</asp:ListItem>
                    <asp:ListItem>2033</asp:ListItem>
                    <asp:ListItem>2034</asp:ListItem>
                    <asp:ListItem>2035</asp:ListItem>
                    <asp:ListItem>2036</asp:ListItem>
                    <asp:ListItem>2037</asp:ListItem>
                    <asp:ListItem>2038</asp:ListItem>
                    <asp:ListItem>2039</asp:ListItem>
                    <asp:ListItem>2040</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td style="padding-top:10px;">
                <asp:TextBox ID="txtCVV" runat="server" CssClass="txtCVV" MaxLength="4"></asp:TextBox>
            </td>
        </tr>
    </table>
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
                <td colspan="2"><asp:Button ID="btnContinuePayment" runat="server" Text="Continue to Payment"  CssClass="btnContinuePayment"  OnClick="btnContinuePayment_Click"/></td>
            </tr>
        </table>
    </div>