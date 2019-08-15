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
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box;
            width: 50%;
            opacity:0.6;
        }
        .nameBox{
            margin-left: 48px;
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box;
            width: 50%;
            opacity:0.6;
        }
        .qtyBox{
            margin-left: 49px;
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box;
            width: 50%;
            opacity:0.6;

        }
        .descBox{
            margin-left: 10px;
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box;
            width: 50%;
            opacity:0.6;
        }

        .oopsMsg{
            width:95%;
            padding:50px;
            text-align:center;
            margin-bottom:200px;
        }
        #style1{
            color:black;
            text-decoration:none;
        }

        #style1:hover{
            transition:0.3s;
            color:gray;
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
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="Name field is required." Class="field-adjust" ForeColor="red" Font-Size="Small" ControlToValidate="txtArtworkName"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ErrorMessage="Please enter alphabet with/without space only." Display="Dynamic" ForeColor="Red" Font-Size="Small" ControlToValidate="txtArtworkName" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                            </p>
                            <p class="justifyTextbox">Description :
                                <asp:TextBox ID="txtDesc" class="descBox" runat="server" Text='<%# Bind("artworkDesc") %>'></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Description field is required." Class="field-adjust" ForeColor="red" Font-Size="Small" ControlToValidate="txtDesc"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="Please enter only alphabet with/without space or comma only." Display="Dynamic" ForeColor="Red" Font-Size="Small" ControlToValidate="txtDesc" ValidationExpression="^[a-zA-Z, ]*$"></asp:RegularExpressionValidator>
                            </p>
                            <p class="justifyTextbox">Price : 
                                <asp:TextBox ID="txtPrice" class="priceBox"  Width="30%" runat="server" Text='<%# Bind("artworkPrice") %>' />  
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="Price field is required." Class="field-adjust" ForeColor="red" Font-Size="Small" Display="Dynamic" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" MaximumValue="99999" MinimumValue="1" Type="Double" ErrorMessage="Price value must between 1-99999."></asp:RangeValidator>
                            </p>
                            <p class="justifyTextbox">
                                <asp:Label ID="lblQty" runat="server" Text="Stock : " CssClass="lblQty"></asp:Label>
                                <asp:TextBox ID="txtQty" class="qtyBox" runat="server" Text='<%# Bind("artworkStock") %>'></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="Stock field is required." Class="field-adjust" ForeColor="red" Font-Size="Small" Display="Dynamic" ControlToValidate="txtQty"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" Type="Integer" ControlToValidate="txtQty" Display="Dynamic" MaximumValue="300" MinimumValue="1" ErrorMessage="Stock value must between 1-300."></asp:RangeValidator>
                            </p>
                            
                              <asp:Button ID="UpdateButtons" class="btnEdit"  runat="server" CausesValidation="True" CommandName="Update" Text="Edit" />

                    <asp:Button ID="UpdateCancelButtons" class="btnEditCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            <br /><br /><br />
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
                            <p>
                                <asp:Label ID="lblArtDesc" runat="server" Text='<%# Eval("artworkDesc") %>' CssClass="lblQty"></asp:Label>
                            </p>
                            <p>RM
                                <asp:Label ID="txtPrice" class="price" runat="server" Text='<%# Eval("artworkPrice") %>' />
                            </p>
                            <p>
                                <asp:Label ID="lblQty" runat="server" Text="Stock : " CssClass="lblQty"></asp:Label>
                                <asp:Label ID="lblStockQty" runat="server" Text='<%# Eval("artworkStock") %>' CssClass="lblQty"></asp:Label>
                            </p>    
                            
                            <asp:Button ID="btnEditStock" class="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                            <asp:Button ID="DeleteButton" class="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
                            
                        </div>
                        <br /><br /><br />
                    </div>
                

            </ItemTemplate>
        </asp:ListView>

    <%
                String count = lvGallery.Items.Count.ToString();

                if (Convert.ToInt32(count) == 0)
                { %>
                    <div class="oopsMsg">
                        <h1>Your gallery is empty</h1>
                        <h2><a href="SellArtwork.aspx" id="style1">Post your favourite art now</a></h2>
                    </div>

            <%}%>
    
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
