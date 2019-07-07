<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="BuyArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.BuyArtwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../Stylesheet/BuyArtwork.css" type="text/css" runat="server"/>
    

    <div class="body">
        <% 
    String status = Request.QueryString["status"];
    if (status != null)
    {
        if (status.Equals("duplicate"))
        {
        %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center;color:red" id="msg">Item already in your wishlist</p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}else if (status.Equals("wishlistAdded")) { %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center" id="msg">Item Added to Wishlist</p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}else if (status.Equals("orderAdded")) { %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center" id="msg">Item added to your <a href="Cart.aspx">cart</a></p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}} %>
            <div class="categoryFilter">
                <h4>Filter your search here </h4>
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="artworkCategory" DataValueField="artworkCategory" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a category" Value="0" />
                    <asp:ListItem>Painting</asp:ListItem>
                    <asp:ListItem>Portrait</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlPrice" runat="server" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a price range" Value="0" />
                    <asp:ListItem>Less than 100</asp:ListItem>
                    <asp:ListItem>Between 100 and 500</asp:ListItem>
                    <asp:ListItem>Between 501 and 1000</asp:ListItem>
                    <asp:ListItem>Above 1000</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlArtist" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select an artist" Value="0" />
                </asp:DropDownList>
                <asp:TextBox ID="txtSearchArtwork" runat="server" OnTextChanged="txtSearchArtwork_TextChanged" CssClass="txtSearchArtwork"></asp:TextBox>
                <asp:Button ID="btnSearchArtwork" runat="server" OnClick="txtSearch_Click" Text="Search" CssClass="btnSearchArtwork"/>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                <ItemTemplate>
                    <div class="artwork">
                    <div class="artworkimg"><img src="<%# Eval("artworkURL")%>" /></div>
                        <div class="artworkdetails">
                        <h1><%#Eval("artworkName")%></h1>
                        <p class="price"><%# Eval("artworkPrice") %></p>
                        <p>msun denim lorem jeansum.</p>
                        <asp:Button ID="btnAddToWishlist" runat="server" Text="Add To Wishlist" CssClass="btnAddToWishlist" CommandArgument='<%# Eval("artworkID")%>' OnClick="btnAddToWishlist_Click"/>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btnAddToCart" CommandArgument='<%# Eval("artworkID")%>' OnClick="btnAddToCart_Click"/>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
</asp:Content>
