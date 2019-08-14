<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="BuyArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.BuyArtwork" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../CSS/BuyArtwork.css" type="text/css" runat="server"/>

    <div class="body" style="float:left;">
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
        <%}else if (status.Equals("noStock")) { %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center;color:red" id="msg">No enough stock for that item</p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}} %>

            <div class="categoryFilter">
                <h4>Find your favourite item here </h4>
                <asp:DropDownList ID="ddlCategory" runat="server" ForeColor="Gray" style="border-radius:8px;" BackColor="White" Font-Bold="True" DataSourceID="SqlDataSource1" DataTextField="artworkCategory" DataValueField="artworkCategory" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a category" Value="0" />
                </asp:DropDownList>
                <asp:DropDownList ID="ddlPrice" runat="server" ForeColor="Gray" style="border-radius:8px;" BackColor="White" Font-Bold="true" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a price range" Value="0" />
                    <asp:ListItem>Less than 100</asp:ListItem>
                    <asp:ListItem>Between 100 and 500</asp:ListItem>
                    <asp:ListItem>Between 501 and 1000</asp:ListItem>
                    <asp:ListItem>Above 1000</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlArtist" runat="server"  ForeColor="Gray" style="border-radius:8px;" BackColor="White" Font-Bold="true" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="UserName" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select an artist" Value="0" />
                </asp:DropDownList>
                <asp:TextBox ID="txtSearchArtwork" runat="server" OnTextChanged="txtSearchArtwork_TextChanged" CssClass="txtSearchArtwork" style="border-radius:8px;"></asp:TextBox>
                <asp:Button ID="btnSearchArtwork" runat="server" OnClick="txtSearch_Click" Text="Search" CssClass="myButton"/>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select aspnet_Users.Username from aspnet_Users inner join aspnet_UsersInRoles on aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner join aspnet_Roles on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId where aspnet_Roles.rolename = 'Artist'"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT DISTINCT [artworkCategory] FROM [Artwork]"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                
                <ItemTemplate>
                    <a href="Artwork.aspx?artworkID=<%# Eval("artworkID")%>">
                    <div class="artwork" style="width:300px;height:650px;">
                    <div class="artworkimg"><img src="<%# Eval("artworkURL")%>" /></div>
                    <div class="artworkdetails" style="padding:10px;">
                        <h1 style="color:#383838;height:130px;"><%#Eval("artworkName")%></h1>
                        <p style="color:#8c8c8c"></p>
                        <p class="price">RM <%# Eval("artworkPrice") %></p>
                        <p style="color:#383838">In stock: <%# Eval("artworkStock")%></p>
                        <asp:Button ID="btnAddToWishlist" runat="server" Text="Add To Wishlist" CssClass="btnAddToWishlist" CommandArgument='<%# Eval("artworkID")%>' OnClick="btnAddToWishlist_Click"/>
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btnAddToCart" CommandArgument='<%# Eval("artworkID")%>' OnClick="btnAddToCart_Click"/>
                    </div>
                    </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        <%
            String count = Repeater1.Items.Count.ToString();

            if (Convert.ToInt32(count) == 0){ %>
                    <div class="noResult">
                        <h2 style="text-align:center">No result was found</h2>
                    </div>

            <%}%>
        </div>
    
</asp:Content>

