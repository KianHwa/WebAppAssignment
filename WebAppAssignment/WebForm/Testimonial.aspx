<%@ Page Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="WebAppAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .grid_image {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 400px;
          float: left;
       
          margin: 80px 0 0 120px;
          text-align: center;
          font-family: arial;
        }
        .price {
          color: grey;
          font-size: 22px;
        }
        .grid_image > div {
          background-color: rgba(255, 255, 255, 0.8);
          border: hidden;
          text-align: center;
        
        }
        
      .artistH img{
        
          margin-right: 20px;
          border-radius: 80%;
          height: 150px;
          
      }
        .justify {
            display: block;
            margin-left: 200px;
            margin-right:200px;
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


    <h1 style="font-size: 50px;">Artist Profile</h1>
    <div class="artistH">
    <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
        Scott Christensen Artist
        </div>
    <br /><br /><br /><br /><br />
    <h2 style="text-align: center;margin-bottom: 50px;">Testimonial</h2>
    <div class="text-justify lead">
        <p class="justify">
        I am a very very very interesting artist whom seek for motivation to draw an amazing drawings to amaze my customer. During my work, I do search through online to find the creative idea to 
        do my best drawing and presented it to my artwork.
        </p>
    </div>
    
  <br />
    <h2 style="text-align: center;">Below is the artist's artwork</h2>
        <div>
              <div  class="grid_image">
                  <img class="artistImage" style="width:340px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
               
                  <p>The art of ocean and sky together.</p>
                  
              </div>
              
               <div  class="grid_image">
                  <img class="artistImage" style="width:340px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                 
              </div>
               <div  class="grid_image">
                  <img class="artistImage" style="width:340px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                 
              </div>
             <div  class="grid_image">
                  <img class="artistImage" style="width:340px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                  
              </div>
             <div  class="grid_image">
                  <img class="artistImage" style="width:340px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                  
              </div>
        </div>
    
</asp:Content>