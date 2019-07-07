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
                            <%# Eval("artworkName") %>
                        </div>
                        <div class="artPrice">
                            RM <%# Eval("artworkPrice") %>
                        </div>
                        <div class="orderBtn">

                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <br />

        </div>
</asp:Content>