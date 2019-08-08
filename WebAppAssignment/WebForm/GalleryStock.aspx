<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master"  AutoEventWireup="true" CodeBehind="GalleryStock.aspx.cs" Inherits="WebAppAssignment.WebForm.GalleryStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
     <link rel="stylesheet" type="text/css" href="../CSS/BuyArtwork.css">
    <style>
        .btnEdit {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 6px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 70px;
          font-size: 18px;
          border-radius: 4px;
        }
        .btnEdit:hover {
          opacity: 0.7;
        }
        .btnDelete, .btnEditCancel {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 6px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 70px;
          font-size: 18px;
          border-radius: 4px;
        }
        .btnDelete:hover, .btnEditCancel:hover {
          opacity: 0.7;
        }
        .artworkDetails{
            float: left;
        }
        .justifyTextbox{
            text-align: justify;   
        }
        .priceBox{
            margin-left: 53px;
        }
        .nameBox{
            margin-left: 48px;
        }
        .qtyBox{
            margin-left: 29px;

        }
        .descBox{
            margin-left: 10px;
        }
    </style>
    <h2 style="text-align:center"> Art Gallery</h2>
        
        <asp:ListView ID="lvGallery" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="artworkID">
             <EditItemTemplate>
               <div class="artwork">
                        <div class="artworkimg">
                            <img src="<%# Eval("artworkURL")%>"" />
                        </div>
                        <div class="artworkdetails" style="padding: 10px;">
                            <p class="justifyTextbox">             Name : 
                                 <asp:TextBox ID="txtArtworkName" class="nameBox"   Width="50%" runat="server" Text='<%# Bind("artworkName") %>' />
                            </p>
                            <p class="justifyTextbox">Description :
                                <asp:TextBox ID="txtDesc" class="descBox" runat="server" Text='<%# Bind("artworkDesc") %>'></asp:TextBox>
                            </p>
                            <p class="justifyTextbox">Price : 
                                <asp:TextBox ID="txtPrice" class="priceBox"  Width="30%" runat="server" Text='<%# Bind("artworkPrice") %>' />
                            </p>
                            <p class="justifyTextbox">
                                <asp:Label ID="lblQty" runat="server" Text="Quantity : " CssClass="lblQty"></asp:Label>
                                <asp:TextBox ID="txtQty" class="qtyBox" runat="server" Text='<%# Bind("artworkStock") %>'></asp:TextBox>
                            </p>
                            
                              <asp:Button ID="UpdateButtons" class="btnEdit"  runat="server" CausesValidation="True" CommandName="Update" Text="Edit" />

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
                            <b><p style="font-size: 18px;"><%# Eval("artworkName") %></p></b>
                       
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
                            <asp:Button ID="btnEditStock" class="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                            <asp:Button ID="DeleteButton" class="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
                            
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
