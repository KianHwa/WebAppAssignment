<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebAppAssignment.ArtistProfile" %>

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
          padding: 8px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 500px;
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
            font-size: 25px;
            text-align: left;
        }
</style>

    <h2 style="text-align:center">User Profile</h2>
    <div  style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 500px;
          margin: auto;
          text-align: center;
          font-family: arial;">
   <img style="width:100%;" 
                    src="../Images/artist-Scott.jpg" />
        
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ApplicationId,LoweredUserName" DataSourceID="SqlDataSource1">
        
        
            
                <EditItemTemplate>
                 
                  <p class="artProf">  User Name:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    <br />
                  </p>
                    <p class="artProf">
                    Mobile Phone:
                    <asp:TextBox ID="MobileAliasTextBox" runat="server" Text='<%# Bind("MobileAlias") %>' />
                    <br />
                    </p>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
               
                <InsertItemTemplate>
                   
                   
                    <p class="artProf">  User Name:
            <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    <br />
                  </p>
                    <p class="artProf">
                    Mobile Phone:
                    <asp:TextBox ID="MobileAliasTextBox" runat="server" Text='<%# Bind("MobileAlias") %>' />
                    <br />
                    </p>
                    
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
               
                <ItemTemplate>
                    
                   <p class="artProf" style="padding-left: 90px;">  User Name:
            <asp:Label ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                    <br />
                  </p>
                    <p class="artProf" style="padding-left: 90px;">
                    Mobile Phone:
                    <asp:Label ID="MobileAliasTextBox" runat="server" Text='<%# Bind("MobileAlias") %>' />
                    <br />
                    </p>
                    
                    <asp:Button ID="EditButton" class="button" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    
                </ItemTemplate>
            </asp:FormView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Users]"></asp:SqlDataSource>
   

</asp:Content>
