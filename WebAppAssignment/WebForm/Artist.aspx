<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="WebAppAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
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
            margin: 20px 300px 500px 300px; 
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
          height: 150px;
         
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
    
        
      
  
           
      
  
    
         <asp:Repeater ID="artistRepeater" runat="server" DataSourceID="artistHomeSqlDataSource">
            
        <ItemTemplate>
            <div class="artistH">
            <img class="artistImage" style="width:90px;" 
            src="<%# Eval("profilePicURL") %>" /><p class="p1" style="">
                <asp:Button ID="btnArt" class="btnArts" runat="server" PostBackUrl="~/WebForm/Testimonial.aspx" Text="View Profile" />
                <%# Eval("UserName") %>
                        <br /> <br />
                  <em>
                      <span class="fa fa-quote-left">
                  
                      </span>
                      <%# Eval("quote") %>
                      <span class="fa fa-quote-right">
                  
                      </span>
                  </em>
                </p>
           
        </div>
            
        </ItemTemplate>
             </asp:Repeater>
 

    <asp:SqlDataSource ID="artistHomeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserName, UserProfile.profilePicURL, UserProfile.quote FROM aspnet_Users INNER JOIN UserProfile ON aspnet_Users.UserId = UserProfile.UserId"></asp:SqlDataSource>
      
  
</asp:Content>