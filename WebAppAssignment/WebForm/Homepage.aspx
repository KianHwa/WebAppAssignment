 <%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master"  AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebAppAssignment.Homepage"%> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--CSS PART HERE-->

    <div class="margins">
       
       
<section>
<div>
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:500px;">
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
<h1><b>Category</b></h1>
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
                  <img class="artistImage" style="width:200px; border-radius:20px; height:270px;" src="../Images/leonardo.jpg" />
                   <label>Leonardo da Vinci</label>
              </div>
            <!--Part 2-->
               <div  class="grid_image">
                  <a href="#"><img class="artistImage" style="width:200px; border-radius:20px; height:270px;"src="../Images/salvadordali.jpg" /></a>
                   <label>Salvaldor Dali</label>
              </div>
            <!--Part 3-->
            <div  class="grid_image">
                  <img class="artistImage" style="width:200px; border-radius:20px; height:270px; "src="../Images/edgardegas.jpg" />
                  <label>Edgar Degas</label>
              </div>
             <!--Part 4-->
               <div  class="grid_image">
                  <img class="artistImage" style="width:200px; border-radius:20px; height:270px; " src="../Images/pikaso.jpg" />
                   <label>Pablo Picasso</label>
              </div>

             <div  class="grid_image">
                  <img class="artistImage" style="width:200px; border-radius:20px; height:270px; " src="../Images/raphael.jpg" />
                   <label>Raphael</label>
              </div>
    </div>
    </div>


<!-- Clarity Section -->
<div class="container" style="background-color:rgba(255,255,255,0.5)">
  <div class="row">
    <div class="innerColumn">
      <img src="../Images/lion.gif" alt="App" width="335" height="471" style="border-radius:15px;">
    </div>
    <div class="column">
      <h1 class="largefont"><b>Artist</b></h1>
      <h1 class="bigfont" style="color:red;"><b>Looking for the best artist artwork?</b></h1>
      <p><span style="font-size:24px">Best artist create </span>best art. Art enable us find ourselves and lost ourselves at the same time.</p>
      <button class="button">Find more</button>
    </div>
     
  </div>
</div>

        <div class="section">
<h1>Famous Artwork</h1>
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
<br /><br />

        <!-- ZIG ZAG PART START HERE-->
    <div class="container">
  <div class="row">
    <div class="column">
      <h1 class="largefont"><b>Buy or Sell art with confidence</b></h1>
      <span style="font-size:20px">Manage your art acquisitions and sales  with unlimited scalability, total privacy, and full mobility Leading platform dedicated to sourcing art on buy and sell-side. Our gallery is carefully curated with blue-chip fine
          art owned by us or by our tightly knit community. We help you buy and sell art via a network of trusted private and public partners.
      </span>
    </div>
    <div class="innerColumn">
        <img src="../Images/mornalisa.jpg" width="335" height="471" style="border-radius:15px;">
    </div>
  </div>
</div>

<!-- Clarity Section -->
<div class="container" style="background-color:rgba(255,255,255,0.4)">
  <div class="row">
    <div class="innerColumn">
      <img src="../Images/yaesakura.jpg" alt="App" width="380" height="471" style="border-radius:15px;">
    </div>
    <div class="column">
      <h1 class="largefont"><b>Wanna Show & Sell Your Artwork?</b></h1>
      <h1 class="bigfont" style="color:red;"><b>Join Us</b></h1>
      <p><span style="font-size:24px">Show your skill and creativity.</span>Creativity is contagious. Pass it on and earn money from your artwork.</p>
      <button class="button">Join Now</button>
    </div>
  </div>
</div>

<!-- The App Section -->
<div class="container">
  <div class="row">
    <div class="column">
      <h1 class="largefont"><b>Discover and collect the perfect art</b></h1>
      <h1 class="bigfont" style="color:red;"><b>Looking for art?</b></h1>
      <p><span style="font-size:36px"></span> The leading gallery for original art online.</p>
      <a href="#"><button class="button">Shop Now</button></a>
    </div>
    <div>
        <img src="../Images/scream.gif" width="335" height="471" style="border-radius:15px; background-size:cover;" >
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
