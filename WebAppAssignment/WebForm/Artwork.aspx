<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="WebAppAssignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Stylesheet/Artwork.css" type="text/css" runat="server"/>
        <div class="body">

            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="artItem">
                        <div class="artImg">
                            <img src="<%# Eval("artworkURL")%>"" />
                        </div>
                        <div class="artName">
                            <p><%# Eval("artworkName") %></p>
                        </div>
                        <div class="artPrice">
                            <p>RM <%# Eval("artworkPrice") %></p>
                        </div>
                        <div class="orderBtn">
                            <asp:Label ID="lblQty" runat="server" Text="Quantity : " CssClass="lblQty"></asp:Label>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="txtQty" Text="1"></asp:TextBox>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btnAddToCart" OnClick="btnAddToCart_Click"/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <br />

        </div>
</asp:Content>