<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebAppAssignment.WebForm.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
   
   
<style>
        
    body {
            background: url('../Images/grey.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            overflow: auto;
        }
        .title {
          color: grey;
          font-size: 23px;

        }
        
        .btnEdit {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 5px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 400px;
          font-size: 18px;
        }

        .btnEditCancel{
            background-color: #000;
            border: none;
            color: white;
            width:199px;
            padding: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            float:left;
            outline: 0;
            cursor: pointer;
        }
        .btnEditCancel:hover{
            opacity: 0.7;
        }
        .btnEdit:hover, a:hover {
          opacity: 0.7;
        }
        .artProf{
            font-size: 23px;
            text-align: center;
            word-break: break-word;
        }
        .overlay {
          position: absolute;
          top: 126px;
          bottom: 0;
          left: 560px;
          right: 0;
          height: 310px;
          width: 401px;
          opacity: 0;
          transition: .5s ease;
          background-color: darkgray;
          
        }

        .containerArtist:hover .overlay {
          opacity: 1;
        }

        .text {
          color: white;
          font-size: 20px;
          position: absolute;
          top: 50%;
          left: 50%;
          -webkit-transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
          text-align: center;
          
        }
        .updatePic{
           
            border: none;
              color: white;
             
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
              margin-top: 50px;
              margin-right: 20px;
              padding: 8px 30px 8px 30px;
              transition-duration: 0.4s;
              cursor: pointer;
        }
        .updatePic:hover {
              background-color: black;
              color: white;
        }
        .uploadArtist{
              border: none;
              color: white;
             
              font-size: 16px;
             
              margin-top: 40px;
             
              
        }
       
</style>

    <h2 style="text-align:center">Artist Profile</h2>
    <div style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 400px;
          margin: auto;
          text-align: center;
          font-family: arial;
          
          ">
       
        
    <asp:FormView ID="fvArtistProf" runat="server" DataSourceID="SqlDataSource1" > 
            
                <EditItemTemplate>
                    <div class="containerArtist" style="width: 100%;">
            
                        <img style="width:400px;" src="<%# Eval("profilePicURL")%>" />
       
                    </div>
                    <div class="artProf">
                    
                    <blockquote>
                    <p>
                        Name:
                        <asp:TextBox ID="usernameTxt" runat="server" Text='<%# Eval("UserName") %>' />
                    </p>
                    <br />
                    <p>
                    Address:
                    <asp:TextBox ID="addressTxt" runat="server" Text='<%# Bind("address") %>' />
                    </p>
                      <br />
                    <p>
                        Mobile Phone:
                        <asp:TextBox ID="phoneTxt" runat="server" Text='<%# Bind("phoneNumber") %>' />
                    
                    </p>
                    <br />
                    <p>
                        Quote:
                        <asp:TextBox ID="quoteTxt" runat="server" Text='<%# Bind("quote") %>' />
                   
                    </p>
                    <br />
                    <p>
                        Biography:
                        <asp:TextBox ID="biotxt" runat="server" Text='<%# Bind("biography") %>' />
                    
                    </p>
                    <br />
                    </blockquote>
                       
                    <asp:Button ID="UpdateButton" class="btnEditCancel"  runat="server" CausesValidation="True" CommandName="Update" Text="Update   " OnClick="UpdateButton_Click" />

                    <asp:Button ID="UpdateCancelButton" class="btnEditCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                       
                            
                        </div>
                </EditItemTemplate>
       
                <ItemTemplate>
                    <div class="containerArtist" style="width: 100%;">
            
            <img style="width:400px; height: 307px;" src="<%# Eval("profilePicURL")%>" />
       
        <div class="overlay">
            <div class="text">
                <asp:FileUpload  ID="artistUpload" class="uploadArtist"  runat="server" />
                <asp:Button ID="UpdatePicButton" class="updatePic" runat="server" CausesValidation="True" CommandName="Update" Text="Edit" OnClick="UpdatePicButton_Click" />
            </div>
            
        </div>
        </div>
                    <div class="artProf">
                    <p>
                    Name:
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </p>
                        <br />
                  
                    <p>
                    Address:
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                    </p>
                        <br />
                    <p>
                    Mobile Phone:
                    <asp:Label ID="phoneNumberLabel" runat="server" Text='<%# Eval("phoneNumber") %>' />
                    </p>
                        <br />
                    <p>
                    Quote:
                        <blockquote>
                            <q>
                                <asp:Label ID="quoteLabel" runat="server" Text='<%# Eval("quote") %>' />
                            </q>
                        </blockquote>
                    
                    </p>
                        <br />
                    <p>
                    Biography:
                        <blockquote>
                    <asp:Label ID="biographyLabel" runat="server" Text='<%# Bind("biography") %>' />
                            </blockquote>
                    </p>
                        <br />
                    <asp:Button ID="EditButton" class="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     </div>   
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT U.UserName, Us.profilePicURL, Us.address, Us.phoneNumber,
            Us.quote, Us.biography FROM vw_aspnet_Users AS U INNER JOIN UserProfile AS Us ON U.UserId = Us.UserId"></asp:SqlDataSource>
        </asp:Content>
