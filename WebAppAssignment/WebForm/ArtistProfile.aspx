<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebAppAssignment.WebForm.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
        

        .title {
          color: grey;
          font-size: 23px;

        }

        .button {
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

        a {
          text-decoration: none;
          font-size: 28px;
          color: black;
        }

        .button:hover, a:hover {
          opacity: 0.7;
        }
        .artProf{
            font-size: 23px;
            text-align: center;
            word-break: break-word;
        }
</style>

    <h2 style="text-align:center">Artist Profile</h2>
    <div  style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 400px;
          margin: auto;
          text-align: left;
          font-family: arial;
          ">
        <img style="width:100%;" src="<%#Eval("profilePicURL")%>" />
   <img style="width:100%;" src="../Images/artist-Scott.jpg" />
        
    <asp:FormView ID="fvArtistProf" runat="server" DataSourceID="SqlDataSource1" > 
            
                <EditItemTemplate>
                    <div>
                        <blockquote>
                    <p>
                    Name:
                    <asp:TextBox ID="usernameTxt" runat="server" Text='<%# Eval("UserName") %>' />
                    
                        </p>
                    <br />
                    <p>
                    Picture:
                    <asp:TextBox ID="pictureTxt" runat="server" Text='<%# Bind("profilePicURL") %>' />
                  
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
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="UpdateButton_Click" />

                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </blockquote>
                        </div>
                </EditItemTemplate>
        
                <ItemTemplate>
                    <div class="artProf">
                    <p>
                    Name:
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    </p>
                        <br />
                    <p>
                    Picture:
                    <asp:Label ID="profilePicURLLabel" runat="server" Text='<%# Eval("profilePicURL") %>' />
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
                    <asp:Button ID="EditButton" class="button" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     </div>   
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT U.UserName, Us.profilePicURL, Us.address, Us.phoneNumber,
            Us.quote, Us.biography FROM vw_aspnet_Users AS U INNER JOIN UserProfile AS Us ON U.UserId = Us.UserId"></asp:SqlDataSource>
        </asp:Content>
