<%@ Page Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="WebAppAssignment.WebForm2" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    
    <style>
        body {
            background: url('../Images/grey.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            overflow: auto;
        }
        .grid_image {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 400px;
          float:left;
          
          margin: 80px 0 0 120px;
          text-align: center;
          font-family: arial;
        }
        
        .grid_image div {
          
          border: hidden;
          text-align: left;
        
        }
        
      .artistH img{
        
          margin-right: 40px;
          border-radius: 80%;
          height: 150px;
          
      }
        .justify {
            display: block;
           margin-right: 400px;
           margin-left: 400px;
            
        }
        .lead {
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: 300;
            line-height: 1.4;
        }
        .text-justify{
            text-align: justify!important;
        }
       
      
       
    </style>


       <asp:FormView ID="FormView1" runat="server" DataKeyNames="artworkID,UserId,ApplicationId,LoweredUserName" DataSourceID="SqlDataSource1" Width="100%">
                          
                          <ItemTemplate>
                          
                            <div class="artistH" style="float:left;">
                                <h1 style="margin-left: 110px;"><%# Eval("UserName") %></h1>
                            <img class="artistImage" style="width:260px; height:200px; margin-left:50px;" 
                                    src="<%# Eval("profilePicURL")%>" />
                               
                                
                                </div>
                            
                            <h2 style="text-align: center;margin-right:340px;margin-bottom: 50px;">Testimonial</h2>
                            <div class="text-justify lead">
                                <blockquote>
                                    <p class="justify" style="word-break: break-word;">
                                        <%# Eval("biography") %>
                                    </p>
                               </blockquote>
                            </div>
    
                          <br /><br /><br /><br /><br /><br /><br /><br />
                            <h2 style="text-align: center;">Below is the artist's artwork</h2>
                      
                          </ItemTemplate>
                 
                      </asp:FormView>
       
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                            
                                        <div  class="grid_image">
                                             <img class="artistImage" style="width:340px;height:250px;" 
                                              src="<%# Eval("artworkURL")%>" />
                                              <h1><%# Eval("artworkName") %></h1>
                                              <p><%# Eval("artworkCategory") %></p>
                            
                                         </div>                
                                       
                                </ItemTemplate>
                        </asp:Repeater>

                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select * from Artwork inner join UserProfile on
                    Artwork.artistID = UserProfile.UserId inner join aspnet_Users on
                    UserProfile.UserId = aspnet_Users.UserId"></asp:SqlDataSource>
               
    
               
</asp:Content>
