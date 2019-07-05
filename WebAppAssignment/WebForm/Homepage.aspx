<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="WebAppAssignment.Homepage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="Homepage.css">
    <%--CSS PART HERE--%>

<%--Section 1--%>
<section>
<div>
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Four</div>
</div>

<div class="mySlides fade">
  <img src="../Images/download.jpg" style="width:100%; height:350px;">
  <div class="text">Caption Five</div>
</div>
</div>
<br/>

<%--The dot line in here--%>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>
</section>
<hr />

<%--Section 2--%>
<section>
    <h1>TEsting 123</h1>
<div>
    <p>jajfkosldkfjskgzzrh</p>
</div>
</section>


<%--Section 3--%>
<hr />
<section >
<h1>TEsting 123</h1>
<div class="background">
    <table>
        <tr>
            <td><div>safasfsfa</div></td>
            <td><div>safasfsfa</div></td>
            <td><div>safasfsfa</div></td>
        </tr>
        <br />
        <tr>
            <td><input type="button" /></td>
        </tr>
    </table>
</div>
</section>


<%--Section 4--%>
<hr />
<section>
    <h2>TEsting 123</h2>
<div>
<br />

    <p>jajfkosldkfjskgzzrh</p>
</div>
</section>


<%--Section 5--%>
<hr />
<section>
    <h2>TEsting 123</h2>
<div>
<br />

    <p>jajfkosldkfjskgzzrh</p>
</div>
</section>

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
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }</script>

</asp:Content>
