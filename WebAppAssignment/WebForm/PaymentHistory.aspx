<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/LoggedInHeader.Master" CodeBehind="PaymentHistory.aspx.cs" Inherits="WebAppAssignment.WebForm.PaymentHistory" %>

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

    table.historyGridView {
        text-align:center;
        width:100%;
    }

    table.historyGridView th:first-child{
        padding:10px;
        width:20%;
    
    }

    table.historyGridView th:nth-child(2) {
        width: 30%;
        border-right: none;
    }

    .divHistoryGridView {
        border: 0;
    }

    table.historyGridView {
        border-bottom:1px solid #bfbfbf;
    }

    table.historyGridView th{
        background-color:black;
        color:white;
    }

    table.historyGridView tr:nth-child(even){
        background-color:rgba(242, 242, 242,0.5);
    }

    table.historyGridView tr:hover{
        background-color:#d9d9d9;
        transition:0.2s;
    }

    table.historyGridView td{
        width:30%;
        padding:10px;
    }

    .btnViewDetails{
        width:150px;
        background-color:white;
        border:1px solid #d9d9d9;
        height:30px;
        color:black;
    }

    .btnViewDetails:hover{
        transition:0.3s;
        background-color:black;
        color:white;
    }

    .oopsMsg{
        width:100%;
        padding:50px;
        text-align:center;
    }
    </style>
<div class="body">
    <div style="padding:20px;">
        <h1>Your Payment History</h1>
    </div>
    <div class="divHistoryGridView">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="historyGridView">
        <Columns>
            <asp:BoundField DataField="paymentDate" HeaderText="Payment Date" SortExpression="paymentDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="total" HeaderText="Total (RM)" SortExpression="total" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button runat="server" ID="btnViewDetails" Text="View Details" OnClick="btnViewDetails_Click"  CommandArgument='<%# Eval("paymentID") %>' CssClass="btnViewDetails"/>
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    <%
                String count = GridView1.Rows.Count.ToString();

                if (Convert.ToInt32(count) == 0)
                { %>
                    <div class="oopsMsg">
                        <h2>You haven't made any purchase</h2>
                    </div>

            <%}%>
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="select Payment.paymentDate, Payment.total from Payment inner join Orders on Payment.paymentID = Orders.paymentID inner join aspnet_Users on Orders.UserID = aspnet_Users.UserId "></asp:SqlDataSource>   
    
</asp:Content>
