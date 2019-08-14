<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/LoggedInHeader.Master" CodeBehind="PaymentHistoryDetails.aspx.cs" Inherits="WebAppAssignment.WebForm.PaymentHistoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .body {
        margin: 150px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        margin-left:100px;
        margin-right:100px;
    }

    body {
        background: url('../Images/grey.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment:fixed;
    }

    table.historyDetailsGridView {
        text-align:center;
        width:100%;
    }

    table.historyDetailsGridView th:first-child{
        padding:10px;
        width:20%;
    
    }

    table.historyDetailsGridView th:nth-child(2) {
        width: 30%;
        border-right: none;
    }

    .divHistoryDetailsGridView {
        border: 0;
    }

    table.historyDetailsGridView {
        border-bottom:1px solid #bfbfbf;
    }

    table.historyDetailsGridView th{
        background-color:black;
        color:white;
    }

    table.historyDetailsGridView tr:nth-child(even){
        background-color:rgba(242, 242, 242,0.5);
    }

    table.historyDetailsGridView tr:hover{
        background-color:#d9d9d9;
        transition:0.2s;
    }

    table.historyDetailsGridView td{
        width:30%;
        padding:10px;
    }
</style>

<div class="body">
    <div style="padding:20px;">
        <h1>Your Payment History</h1>
    </div>
    <div class="divHistoryDetailsView">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CssClass="historyDetailsGridView" DataSourceID="SqlDataSource1">
            <Columns>
            <asp:BoundField DataField="artworkName" HeaderText="Artwork Name" SortExpression="artworkName" />
                <asp:BoundField DataField="orderQuantity" HeaderText="Quantity" SortExpression="orderQuantity" />
            <asp:BoundField DataField="artworkPrice" HeaderText="Artwork price (RM)" SortExpression="artworkPrice" />
        </Columns>
        </asp:GridView>
    </div>
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="select Artwork.artworkName, Artwork.artworkprice, OrderDetails.orderQuantity from Artwork inner join OrderDetails on Artwork.artworkID = OrderDetails.artworkID inner join Orders on OrderDetails.orderID = Orders.orderID inner join aspnet_Users on Orders.UserID = aspnet_Users.UserId inner join Payment on Payment.paymentID = Orders.paymentID "></asp:SqlDataSource>
</asp:Content>