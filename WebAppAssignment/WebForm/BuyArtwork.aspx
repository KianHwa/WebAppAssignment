<%@ Page Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="BuyArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.BuyArtwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="BuyArtwork.css" type="text/css" runat="server"/>

    <div class="body">
            <div class="categoryFilter">
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="artworkCategory" DataValueField="artworkCategory" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a category" Value="0" />
                    <asp:ListItem>Painting</asp:ListItem>
                    <asp:ListItem>Potrait</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlPrice" runat="server" AppendDataBoundItems="True" CssClass="categoryFilterDdl" AutoPostBack="True" OnSelectedIndexChanged="filter_SelectedIndexChanged">
                    <asp:ListItem Text="Select a price range" Value="0" />
                    <asp:ListItem>Less than 100</asp:ListItem>
                    <asp:ListItem>Between 100 and 500</asp:ListItem>
                    <asp:ListItem>Between 500 and 1000</asp:ListItem>
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
                    <div class="artworkimg"></div>
                        <div class="artworkdetails">
                        <h1><%#Eval("artworkName")%></h1>
                        <p class="price"><%# Eval("artworkPrice") %></p>
                        <p>msun denim lorem jeansum.</p>
                        <p><button>Add to Cart</button></p>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
        

        </div>
</asp:Content>
