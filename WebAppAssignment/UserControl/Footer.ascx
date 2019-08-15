<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WebAppAssignment.UserControl.Footer" %>
<style>
    .footer{
        width:100%;
        height:380px;
        background-color:#1a1a1a;
        padding-top:30px;
        padding-bottom:30px;
        color:white;
    }
    .footer div{
        padding:15px;
        word-wrap:break-word;
        font-size:14px;
    }
    .footer a{
        color:white;
        text-decoration:none;
    }
    .footer p{

    }
    .pads{
        padding-bottom:5px;
    }
</style>

    <div class="footer" style="float:left;">
        <div style="margin-left:80px;">ARTISTIC</div>
        <p style="border-bottom:1px solid white; width:5%; margin-left:90px;"></p>
        <div style="width:15%;height:250px;float:left; margin-left:80px;">
            <p style="color:white;font-size:20px; font-weight:bold;">For Member</p>
            <a href="../WebForm/BuyArtwork.aspx">Arts Catalog</a></br></br>
            <a href="../WebForm/FAQ.aspx">FAQ</a>
            <p>&copy;ARTISTIC. All rights reserved.</p>
        </div>
        <div style="width:15%;height:250px;float:left;">
            <p style="color:white;font-size:20px; font-weight:bold;">For Artist</p>
            <a href="../WebForm/whysell.aspx">Why Sell?</a>
        </div>
        <div style="width:35%;height:250px;float:left;">
            <p style="color:white;font-size:20px; font-weight:bold;">About Us</p>
            <a href="../WebForm/ContactUs.aspx">Contact US</a></br></br>
            <a href="../WebForm/TermsNCondition.aspx">Terms and Conditions</a>
        </div>
        <div style="width:15%;height:250px;float:left;background-color:red;">
            <div style="float:left;"> 
            <p style="color:white;font-size:20px; font-weight:bold;">Join us</p>
            <a href="https://www.facebook.com/Artistic-103362454361927/" target="_blank">
            <img style="height:30px; width:30px;" src="../Images/fb.png" />
        </a>
            </div>
            <p style="float:right; margin-top:36%; padding-right:50px;">FACEBOOK</p>
        </div>
    </div>