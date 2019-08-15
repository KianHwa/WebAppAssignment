<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" Inherits="WebAppAssignment.WebForm1" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../CSS/Artwork.css" type="text/css" runat="server"/>
        <div class="body">
            <% 
                String status = Request.QueryString["status"];
                if (status != null)
                {
                    if (status.Equals("noStock"))
                    {
        %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center;color:red" id="msg">Not enough stock for that item.</p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}
    }%>

            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="artItem" style="height:600px;">
                        <div class="artImg">
                            <img src="<%# Eval("artworkURL")%>"" style="height:400px;"/>
                        </div>
                        <div class="artName">
                            <p><%# Eval("artworkName") %></p>
                        </div>
                        <div class="artPrice">
                            <p>RM <%# Eval("artworkPrice") %></p>
                        </div>
                        <div class="artStock">
                            <p>In Stock: <%# Eval("artworkStock") %></p>
                        </div>
                        <div class="artDesc">
                            <p><%# Eval("artworkDesc") %></p>
                        </div>
                        <div class="orderBtn">
                            <asp:Label ID="lblQty" runat="server" Text="Quantity : " CssClass="lblQty"></asp:Label>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="txtQty" Text="1"></asp:TextBox><asp:Label ID="errorMsg" runat="server" Text="" style="color:red;"></asp:Label>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btnAddToCart" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("artworkID") %>'/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <br />

        </div>
</asp:Content>