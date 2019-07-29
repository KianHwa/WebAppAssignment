<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master"  AutoEventWireup="true" CodeBehind="GalleryStock.aspx.cs" Inherits="WebAppAssignment.WebForm.GalleryStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
     <link rel="stylesheet" type="text/css" href="../CSS/BuyArtwork.css">

    <h2 style="text-align:center"> Art Gallery</h2>
        <asp:ListView ID="lvGallery" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="artworkID">
             <EditItemTemplate>
               <div class="artwork">
                        <div class="artworkimg">
                            <img src="<%# Eval("artworkURL")%>"" />
                        </div>
                        <div class="artworkdetails" style="padding: 10px;">
                            <p>
                                 <asp:TextBox ID="txtArtworkName"  Width="80%" runat="server" Text='<%# Bind("artworkName") %>' />
                            </p>
                            <p>RM
                                <asp:TextBox ID="txtPrice"  Width="80%" runat="server" Text='<%# Bind("artworkPrice") %>' />
                            </p>
                            <p>
                                <asp:Label ID="lblQty" runat="server" Text="Quantity : " CssClass="lblQty"></asp:Label>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="txtQty" Text='<%# Bind("artworkStock") %>'></asp:TextBox>
                            </p>
                            <p>
                                <asp:TextBox ID="txtDesc" runat="server" CssClass="txtQty" Text='<%# Bind("artworkDesc") %>'></asp:TextBox>
                            </p>
                              <asp:Button ID="UpdateButtons" class="btnEditCancel"  runat="server" CausesValidation="True" CommandName="Update" Text="Edit" />

                    <asp:Button ID="UpdateCancelButtons" class="btnEditCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
  
                    </div>  
            </EditItemTemplate>
            <ItemTemplate>
                    <div class="artwork">
                        <div class="artworkimg">
                            <img src="<%# Eval("artworkURL")%>"" />
                        </div>
                        <div class="artworkdetails" style="padding:10px;">
                            <p><%# Eval("artworkName") %></p>
                       
                            <p>RM
                                <asp:Label ID="txtPrice" class="price" runat="server" Text='<%# Eval("artworkPrice") %>' />
                            </p>
                            <p>
                                <asp:Label ID="lblQty" runat="server" Text="Quantity : " CssClass="lblQty"></asp:Label>
                                <asp:Label ID="lblStockQty" runat="server" Text='<%# Eval("artworkStock") %>' CssClass="lblQty"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lblArtDesc" runat="server" Text='<%# Eval("artworkDesc") %>' CssClass="lblQty"></asp:Label>
                            </p>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="btnEditStock" runat="server" Text="Edit" CommandName="Edit" />
                        </div>
                        
                    </div>
                

            </ItemTemplate>
        </asp:ListView>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Artwork]" UpdateCommand="UPDATE Artwork SET artworkName = @artworkName, artworkPrice = @artworkPrice, artworkStock = @artworkStock, artworkDesc = @artworkDesc WHERE (artworkID = @artworkID)" DeleteCommand="DELETE FROM Artwork WHERE (artworkID = @artworkID)">
        <DeleteParameters>
            <asp:Parameter Name="artworkID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="artworkName" />
            <asp:Parameter Name="artworkPrice" />
            <asp:Parameter Name="artworkStock" />
            <asp:Parameter Name="artworkDesc" />
            <asp:Parameter Name="artworkID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
