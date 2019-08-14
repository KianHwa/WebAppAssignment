<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="WebAppAssignment.UserControl.Footer" %>
<style>
    .footer{
        width:100%;
        height:300px;
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

    .footer p{
    }
</style>

    <div class="footer" style="float:left;">
        <div style="width:15%;height:250px;float:left;margin-left:150px;">
            <p style="color:white;font-size:20px;">About Us</p>
            <p>Know more about us</p>
        </div>
        <div style="width:15%;height:250px;float:left">
            <p style="color:white;font-size:20px;">Contact Us</p>
        </div>
        <div style="width:20%;height:250px;float:left">
            <p style="color:white;font-size:20px;font-size:20px;">FAQ</p>
        </div>
        <div style="width:25%;height:250px;float:left;background-color:red;">
            <p style="color:white;font-size:20px;">Join us</p>
        </div>
    </div>