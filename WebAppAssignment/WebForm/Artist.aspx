<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="WebAppAssignment.WebForm.Artist" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
    <style>
        body {
            background: url('../Images/grey.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            overflow:auto;
        }
        .artistH{
            border: 2px solid #ccc;
            background-color: #eee;
            border-radius: 5px;
            margin: 20px 300px 100px 300px; 
            padding: 30px;
            
        }
        .artistH::after{
            content: "";
            clear: both;
            display: table;
        }
      .artistH img{
          float:left;
          margin-right: 20px;
          border-radius: 80%;
         
      }
     .artistH span{
         font-size: 20px;
         margin-right: 15px;
     }
     
       
       .fa-quote-left:before{
           content: "\201C";
       }
       .fa-quote-right:before{
           content: "\201D";
       }
       .fa{
           display: inline-block;
           font-size: inherit;
       }
       .btnArts{
           background-color: black;
           border: none;
           color: white;
           padding: 16px 32px;
           text-align: center;
           font-size: 16px;
           margin: 40px 130px 0 0;
           transition: 0.3s;
           float: right;
           cursor:pointer;
       }
       .btnArts:hover{
           background-color: gray;
           color: white;
       }
    </style>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT aspnet_Users.UserName, UserProfile.profilePicURL, UserProfile.quote FROM aspnet_Users INNER JOIN UserProfile ON aspnet_Users.UserId = UserProfile.UserId INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId"></asp:SqlDataSource>
    
    <div class="body">
         <asp:Repeater ID="artistRepeater" runat="server" DataSourceID="SqlDataSource1" >
            
        <ItemTemplate>
            <div class="artistH">
            <img class="artistImage" style="width:150px;height:150px;" 
            src="<%# Eval("profilePicURL") %>" /><p class="p1" style="">
                
                <asp:Button ID="btnArt" class="btnArts" runat="server" Text="View Profile" CommandArgument='<%# Eval("UserName") %>' OnClick="btnArt_Click"/>
      
                <%# Eval("UserName") %>
                        <br /> <br />
                  <em>
                      <q>
                      <%# Eval("quote") %>
                    </q>
                  
                      </span>
                  </em>
                </p>
           
        </div>
            
        </ItemTemplate>
             </asp:Repeater>
    </div>
    
</asp:Content>
