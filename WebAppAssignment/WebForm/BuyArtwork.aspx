<%@ Page Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="BuyArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.BuyArtwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../WebForm/BuyArtwork.css" type="text/css" runat="server"/>
    <div class="body">
        
            
            <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artist]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
                <ItemTemplate>
                    <div class="artwork">
                    <div class="artworkimg"></div>
                        <div class="artworkdetails">
                        <h1><%#Eval("ArtworkName")%></h1>
                        <p class="price"><%# Eval("ArtworkPrice") %></p>
                        <p>msun denim lorem jeansum.</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
        

        </div>
</asp:Content>
