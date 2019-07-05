<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="WebAppAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../CSS/ArtistHomepage.css"/>
    <style>
        
        .artistH{
            border: 2px solid #ccc;
            background-color: #eee;
            border-radius: 5px;
            margin: 20px 300px 0 300px; 
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
     @media (max-width: 500px){
         .artistH{
             text-align: center;
         }
         .artistH img{
             margin: auto;
             float: none;

         }
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
       .btnArt{
           background-color: black;
           border: none;
           color: white;
           padding: 16px 32px;
           text-align: center;
           font-size: 16px;
           margin: 40px 130px 0 0;
           transition: 0.3s;
           float: right;
       }
       .btnArt:hover{
           background-color: gray;
           color: white;
       }
    </style>
    
        
        <div class="artistH">
            <img class="artistImage" style="width:90px;" 
            src="../Images/artist-Scott.jpg" />
       <button class="btnArt">Click Me!</button>
                <p class="p1" style="">Scott Christensen
                        <br /> <br />
                  <em>
                      <span class="fa fa-quote-left">
                  
                      </span>
                      I love ocean. HEHEHEHEHEHEHEHEHEHEHEHEHEHEHEHEHEHEHEHHEHEHEHEHEHHEHE
                      <span class="fa fa-quote-right">
                  
                      </span>
                  </em>
                </p>
                
            
        </div>
      <div class="artistH">
            <img class="artistImage" style="width:90px;" 
            src="../Images/artist-Scott.jpg" />
        <button class="btnArt">Click Me!</button>
                <p class="p1" style="">Scott Christensen
                        <br /> <br />
                  <em>
                      <span class="fa fa-quote-left">
                  
                      </span>
                      I love ocean.
                      <span class="fa fa-quote-right">
                  
                      </span>
                  </em>
                </p>
            
        </div>
     <div class="artistH">
            <img class="artistImage" style="width:90px;" 
            src="../Images/artist-Scott.jpg" />
       <button class="btnArt">Click Me!</button>
                <p class="p1" style="">Scott Christensen
                        <br /> <br />
                  <em>
                      <span class="fa fa-quote-left">
                  
                      </span>
                      I love ocean. HEHEHEHEHEHEHEHEHEHHEE
                      <span class="fa fa-quote-right">
                  
                      </span>
                  </em>
                </p>
            
        </div>
  
</asp:Content>