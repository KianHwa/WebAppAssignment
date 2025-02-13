﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/LoggedInHeader.Master" CodeBehind="Cart.aspx.cs" Inherits="WebAppAssignment.WebForm.Cart" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="CartContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../CSS/Cart.css" type="text/css" runat="server"/>

    <div class="body">
        <h1>Your Order Cart</h1>
        <div class="divCartGridView">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="CartGridView" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="Artwork.aspx?artworkID=<%# Eval("artworkID")%>">
                            <img src="<%# Eval("artworkURL")%>" style="width:100%;height:200px"/>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="artworkName" HeaderText="Artwork Name" SortExpression="artworkName" />
                    <asp:BoundField DataField="artworkPrice" HeaderText="Artwork Price" SortExpression="artworkPrice" />
                    <asp:BoundField DataField="orderQuantity" HeaderText="Quantity" SortExpression="orderQuantity" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="RemoveOrderButton" runat="server" Text="Remove"  OnClick="RemoveOrderButton_Click"  CssClass="btnRemoveOrder" CommandArgument='<%#Eval("orderID")+";"+ Eval("artworkID")%>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <%
                String count = GridView1.Rows.Count.ToString();

                if (Convert.ToInt32(count) == 0)
                { %>
                    <div class="noResultMsg">
                    <div class="oops">
                        <img src="../Images/oops.png" />
                    </div>
                    <div class="oopsMsg">
                        <h1>You don't have any item in your cart</h1>
                    </div>
                    </div>

            <%}
    else
    {%>
        <table class="totalTable" style="width:100%;font-size:25px;padding:10px;">
                <tr>
                    <td style="width:80%; text-align:right; ">Total</td>
                    <td style="width:20%; text-align:right">
                        RM <%= Session["subtotal"].ToString() %></td>
                </tr>
                <tr>
                    <td style="text-align:right;" colspan="2">
                        <asp:Button ID="btnProceedPayment" runat="server" Text="Check Out" CssClass="btnProceedPayment" OnClick="btnProceedPayment_Click"/>
                    </td>
                </tr>
            </table>
        <%} %>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select Artwork.artworkURL, Artwork.artworkName, Artwork.artworkPrice, Orders.orderStatus, Orders.orderDate, OrderDetails.orderQuantity from Orders inner join OrderDetails on Orders.orderID = OrderDetails.orderID 
join Artwork on OrderDetails.artworkID = Artwork.artworkID 
join aspnet_Membership on aspnet_Membership.UserId = Orders.UserID where Orders.orderID = 1"></asp:SqlDataSource>
        </div>
</asp:Content>
