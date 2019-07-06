<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="../MasterPage/LoggedInHeader.Master" CodeBehind="Wishlist.aspx.cs" Inherits="WebAppAssignment.WebForm.Wishlist" %>

<asp:Content ID="Wishlist_Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="Wishlist.css">

    <div class="body">
        <div class="wishlistTitle">
            <h1>Your Wishlist</h1>
        </div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="wishlistItem">
                <div class="wishlistImg">
                    <img src="<%#Eval("artworkURL")%>" />
                </div>
                <div class="wishlistDesc">
                    ffffffffffffff
                </div>
                <div class="removeWishlist">
                    <asp:Button ID="Button1" runat="server" Text= CssClass="btnRemoveWishlist"/>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Wishlist]"></asp:SqlDataSource>
        

            
        
        </div>
</asp:Content>
