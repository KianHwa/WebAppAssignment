<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="WebAppAssignment.WebForm.Testimonial" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
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
          border-radius: 4px;
          margin: 80px 0 0 120px;
          text-align: center;
          font-family: arial;
          background-color:white;
        }
      
        .artistImage{
            border-radius:80%;
        }
      
       
    </style>


       <asp:FormView ID="FormView1" runat="server"  DataSourceID="SqlDataSource1" Width="100%">
                          
                          <ItemTemplate>
                          <div style="width:80%;height:400px;margin-left:10%;">
                              <div style="width:100%;height:80px;float:left;">
                                  <h1><%# Eval("UserName") %></h1>
                              </div>
                              
                              <div style="width:25%;float:left;height:320px;">
                                  <img class="artistImage" style="width:260px; height:250px;width:250px;" 
                                    src="<%# Eval("profilePicURL")%>" />
                              </div>

                              <div style="width:55%;height:50px;float:left;text-align:center;">
                                  <h2>Testimonial</h2>
                              </div>
                              
                            <div style="height:350px;width:55%;float:left;">
                                <blockquote>
                                    <p style="word-break: break-word;padding:30px;font-size:18px;">
                                        <%# Eval("biography") %>
                                    </p>
                               </blockquote>
                            </div>
                          </div>
                              <div style="width:100%;height:50px;float:left;">
                                <h2 style="text-align: center;">Below is the artist's artwork display</h2>
                            </div>
                            
                      
                          </ItemTemplate>
                 
                      </asp:FormView>
       
                        <div style="background-color:rgba(179,179,179,0.3);display:inline-block;width:100%;">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" >
                            <ItemTemplate>
                                        <a href="Artwork.aspx?artworkID=<%# Eval("artworkID")%>" style="color:black">    
                                        <div  class="grid_image" style="margin-bottom: 30px;">
                                             <img class="artistImage" style="width:340px;height:250px; border-radius: 4px;" 
                                              src="<%# Eval("artworkURL")%>" />
                                              <h1><%# Eval("artworkName") %></h1>
                                              <p><%# Eval("artworkCategory") %></p>
                                         </div>                
                                        </a>

                                </ItemTemplate>
                        </asp:Repeater>
                            </div>
                    
                    <%
                            String count = Repeater1.Items.Count.ToString();

                            if (Convert.ToInt32(count) == 0){ %>
                                    <div class="noResult" style="background-color:rgba(179,179,179,0.3);display:inline-block;width:100%;">
                                        <h2 style="text-align:center;padding:200px;">Currently this artist doesn't have any artwork post</h2>
                                    </div>

                            <%}%>

                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="select * from Artwork inner join UserProfile on
                    Artwork.artistID = aspnet_Users.UserId inner join UserProfile on
                    aspnet_Users.UserId = UserProfile.UserId"></asp:SqlDataSource>
               
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
</asp:Content>
