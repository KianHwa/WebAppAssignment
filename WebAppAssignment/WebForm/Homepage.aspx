<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master"  AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebAppAssignment.WebForm.Homepage"%> 
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
   
    <link rel="stylesheet" href="Home.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!--CSS PART HERE-->
  
    
  
    <div class="margins">
       
        
       
<div>
<div class="slideshow-container" >
    
<div class="mySlides">
  <a href="#"><img src="../Images/honkaiFireYae.jpg" style="width:100%; height:500px;"></a>
  <div class="text"></div>
</div>

<div class="mySlides">
  <a href="#"><img src="../Images/deadpool.jpg" style="width:100%; height:500px;"></a>
  <div class="text"></div>
</div>

<div class="mySlides">
  <a href="#"><img src="../Images/miku art.jpg" style="width:100%; height:500px;"></a>
  <div class="text"></div>
</div>

<div class="mySlides">
  <a href="#"><img src="../Images/rainbowSix.jpg" style="width:100%; height:500px;"></a>
  <div class="text"></div>
</div>

<div class="mySlides">
  <a href="Wishlist.aspx"><img src="../Images/dark dragon.jpg" style="width:100%; height:500px;"></a>
  <div class="text"></div>
</div>
</div>
<br/>


<!--The dot line in here-->
<div style="text-align:center; visibility:hidden;">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>
<br />
   
<hr />

<!--Section 2 the Ul part-->
<h1><b>Category</b></h1>
<div class="ulside">   
         <asp:Repeater ID="Repeater1"  runat="server" DataSourceID="SqlDataSource1">
        
        <ItemTemplate>
            
               <asp:Button ID="BtnGoCat" CssClass="filter-wrapper" runat="server" CommandArgument='<%# Eval("artworkCategory") %>' OnClick="BtnGoCat_Click" Text='<%# Eval("artworkCategory") %>' />
            
        </ItemTemplate>
    </asp:Repeater>
</div>
   
<%--<ul class="filter-wrapper">
        <li><a href="BuyArtwork.aspx"">Painting</a></li>
        <li><a href="BuyArtwork.aspx">Portrait</a></li>
        <li><a href="BuyArtwork.aspx">Color</a></li>
        <li><a href="BuyArtwork.aspx">Photoshop</a></li>g
        <li><a href="BuyArtwork.aspx">Poster</a></li>
</ul>

</div>
</div>--%>

<!--Section 3-->
<hr />
<div class="section">
<h1>Famous Artist</h1>
<div class="background">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server">

    </asp:SqlDataSource>
    
            <!--Part 1-->
               <div  class="grid_image">
                  <a href="BuyArtwork.aspx"><img class="artistImage" style="width:200px; border-radius:20px; height:270px;" src="../Images/leonardo.jpg" /></a>
                   <label>Leonardo da Vinci</label>
              </div>
            <!--Part 2-->
               <div  class="grid_image">
                  <a href="BuyArtwork.aspx"><img class="artistImage" style="width:200px; border-radius:20px; height:270px;"src="../Images/salvadordali.jpg" /></a>
                   <label>Salvaldor Dali</label>
              </div>
            <!--Part 3-->
            <div  class="grid_image">
                  <a href="BuyArtwork.aspx"><img class="artistImage" style="width:200px; border-radius:20px; height:270px; "src="../Images/edgardegas.jpg" /></a>
                  <label>Edgar Degas</label>
              </div>
             <!--Part 4-->
               <div  class="grid_image">
                  <a href="BuyArtwork.aspx"><img class="artistImage" style="width:200px; border-radius:20px; height:270px; " src="../Images/pikaso.jpg" /></a>
                   <label>Pablo Picasso</label>
              </div>

             <div  class="grid_image">
                  <a href="BuyArtwork.aspx"><img class="artistImage" style="width:200px; border-radius:20px; height:270px; " src="../Images/raphael.jpg" /></a>
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
      <button class="button"><a href="BuyArtwork.aspx">Find More</a></button>
    </div>
     
  </div>
</div>

        <%--<div class="section">
<h1>Famous Artwork</h1>
<div class="background">
            <!--Part 1-->
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
         <ItemTemplate>
               <div  class="grid_image">
                  <img class="artistImage" style="width:240px; border-radius:20px;" src=" <%# Eval("artworkURL") %>" />
                  <h1><%# Eval("artworkName") %></h1>
                  <p><%# Eval("artworkCategory") %></p>
              </div>
        </ItemTemplate>
         
      </asp:Repeater>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ArtworkGalleryConnectionString %>" SelectCommand="SELECT artworkURL, artworkName, artworkCategory FROM Artwork"></asp:SqlDataSource>

</div>
</div>--%>
<br /><br />

        <!-- ZIG ZAG PART START HERE-->
    <div class="container" style="background-image:url('../Images/background3.jpg')">
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
      <button class="button"><a href="Registration.aspx">Join Now</a></button>
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
      <button class="button"><a href="BuyArtwork.aspx"><a href="BuyArtwork.aspx">Shop Now</a></button>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT DISTINCT [artworkCategory] FROM [Artwork]"></asp:SqlDataSource>
 </asp:Content>
