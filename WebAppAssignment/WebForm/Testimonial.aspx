<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="WebAppAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        .grid_image {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          max-width: 400px;
          float: left;
       
          margin: 50px 0 0 50px;
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
        
</style>


    <br /><br /><br /> <br /><br /><br /><br />
        <div>
              <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
               
                  <p>The art of ocean and sky together.</p>
                  
              </div>
              <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
           
                  <p></p>
                 
              </div>
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                 
              </div>
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                 
              </div>
             <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                  
              </div>
             <div  class="grid_image">
                  <img class="artistImage" style="width:240px;" 
            src="../Images/artist-Scott.jpg" />
                  <h1>Arteuresz</h1>
                  
                  <p>The art of ocean and sky together.</p>
                  
              </div>
        </div>
    
</asp:Content>