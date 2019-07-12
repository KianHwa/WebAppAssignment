 <%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master"  AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebAppAssignment.Homepage"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--CSS PART HERE-->

    <div name="margins">
       
       
<section>
<div>
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <a href="#"><img src="../Images/background1.jpg" style="width:100%; height:500px;"></a>
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <a href="#"><img src="../Images/artist-Scott.jpg" style="width:100%; height:500px;"></a>
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">
  <a href="#"><img src="../Images/background1.jpg" style="width:100%; height:500px;"></a>
  <div class="text">Caption Four</div>
</div>

<div class="mySlides">
  <a href="Wishlist.aspx"><img src="../Images/artist-Scott.jpg" style="width:100%; height:500px;"></a>
  <div class="text">Caption Five</div>
</div>
</div>
<br/>

<!--The dot line in here-->
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>
</section>
<br />
<hr />

<!--Section 2 the Ul part-->
<div class="ulside">
<div>
<ul class="filter-wrapper">
        <li><a href="#"">All</a></li>
        <li><a href="#">Graphic</a></li>
        <li><a href="#">Artist</a></li>
        <li><a href="#">Photoshop</a></li>
        <li><a href="#"">Art</a></li>
</ul>

</div>
</div>

<!--Section 3-->
<hr />
<div class="section">
<h1>Famous Artist</h1>
<div class="background">
            <!--Part 1-->
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;" src="../Images/artist-Scott.jpg" />
              </div>
            <!--Part 2-->
               <div  class="grid_image">
                  <a href="#"><img class="artistImage" style="width:240px; border-radius:20px;"src="../Images/artist-Scott.jpg" /></a>

              </div>
            <!--Part 3-->
            <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;"src="../Images/artist-Scott.jpg" />
                 
              </div>
             <!--Part 4-->
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;" src="../Images/artist-Scott.jpg" />

              </div>
            <!--Part 5-->
        <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;" src="../Images/artist-Scott.jpg" />

              </div>
    </div>
    </div>


<!-- Clarity Section -->
<div class="container" style="background-color:#f1f1f1">
  <div class="row">
    <div class="innerColumn">
      <img src="../Images/background1.jpg" alt="App" width="335" height="471">
    </div>
    <div class="column">
      <h1 class="largefont"><b>Artist</b></h1>
      <h1 class="bigfont" style="color:red;"><b>Pixels, who?</b></h1>
      <p><span style="font-size:24px">A revolution in resolution.</span> Sharp and clear photos with the world's best photo engine, incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquipex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      <button class="button">Read More</button>
    </div>
     
  </div>
</div>

        <div class="section">
<h1>Famous Artist</h1>
<div class="background">
            <!--Part 1-->
     <%--<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
         <ItemTemplate>
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;" src=" <%# Eval("artworkURL") %>" />
                  <h1><%# Eval("artworkName") %></h1>
                  <p><%# Eval("artworkCategory") %></p>
              </div>
        </ItemTemplate>
         
      </asp:Repeater>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtworkGalleryConnectionString %>" SelectCommand="SELECT artworkURL, artworkName, artworkCategory FROM Artwork"></asp:SqlDataSource>--%>

</div>
</div>
<br /><br /><br />

        <!-- ZIG ZAG PART START HERE-->
    <div class="container">
  <div class="row">
    <div class="column">
      <h1 class="largefont"><b>What is Art?</b></h1>
      <h1 class="bigfont" style="color:MediumSeaGreen;"><b>How it Comes out</b></h1>
      <p><span style="font-size:36px">Take photos like a pro.</span> You should buy this app because lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <button class="button">Download Application</button>
    </div>
    <div class="innerColumn">
        <img src="../Images/background1.jpg" width="335" height="471">
    </div>
  </div>
</div>

<!-- Clarity Section -->
<div class="container" style="background-color:#f1f1f1">
  <div class="row">
    <div class="innerColumn">
      <img src="../Images/background1.jpg" alt="App" width="335" height="471">
    </div>
    <div class="column">
      <h1 class="largefont"><b>Clarity</b></h1>
      <h1 class="bigfont" style="color:red;"><b>Pixels, who?</b></h1>
      <p><span style="font-size:24px">A revolution in resolution.</span> Sharp and clear photos with the world's best photo engine, incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquipex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      <button class="button">Read More</button>
    </div>
  </div>
</div>

<!-- The App Section -->
<div class="container">
  <div class="row">
    <div class="column">
      <h1 class="largefont"><b>The App</b></h1>
      <h1 class="bigfont" style="color:MediumSeaGreen;"><b>Why buy it?</b></h1>
      <p><span style="font-size:36px">Draw a pro.</span> You should buy this app because lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
      <button class="button">Download Application</button>
    </div>
    <div class="column-33">
        <img src="../Images/background1.jpg" width="335" height="471" >
    </div>
  </div>
</div>

    </div>

    <!-- The App Section -->
<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 3500); // Change image every 2 seconds
    }

    </script>

 </asp:Content>
