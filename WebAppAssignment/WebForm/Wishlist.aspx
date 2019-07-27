<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../MasterPage/LoggedInHeader.Master" CodeBehind="Wishlist.aspx.cs" Inherits="WebAppAssignment.WebForm.Wishlist" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="Wishlist_Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/Wishlist.css">
    <div class="body">
        <div class="wishlistTitle">
            <h1>Your Wishlist<asp:Label ID="Label1" runat="server"></asp:Label>
            </h1>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <a href="Artwork.aspx?artworkID=<%# Eval("artworkID")%>">
                <div class="wishlistItem">
                <div class="wishlistImg">
                    <img src="<%#Eval("artworkURL")%>" />
                </div>
                <div class="wishlistDesc">
                    <p><%#Eval("artworkName")%></p>
                </div>
                <div class="removeWishlist">
                    <asp:Button ID="deleteWishlistBtn" runat="server" Text="Remove" CssClass="btnRemoveWishlist" OnClick="deleteWishlistBtn_Click" CommandArgument='<%#Eval("wishlistID")+";"+ Eval("artworkID")%>'/>
                </div>
                </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Wishlist]"></asp:SqlDataSource>
        
        <%
            String count = Repeater1.Items.Count.ToString();

            if (Convert.ToInt32(count) == 0){ %>
                    <div class="noResult">
                        <h2 style="text-align:center">Currently you dont have any wishlist</h2>
                    </div>

            <%}%>
        </div>
</asp:Content>
