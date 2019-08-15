<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebAppAssignment.WebForm.ContactUs" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .myButton {
            -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
            box-shadow: inset 0px 1px 0px 0px #ffffff;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
            background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
            background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
            background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
            background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
            background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
            background-color: #ffffff;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #dcdcdc;
            display: inline-block;
            cursor: pointer;
            color: #666666;
            font-family: Artist;
            font-size: 15px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #ffffff;
        }
        .myButton:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
            background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
            background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
            background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
            background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
            background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
            background-color: gray;
            opacity:0.8;
        }
        html{
            background-image:url("../Images/grey.jpg");
        }
    </style>
    <div style="padding-left:30px; float:left;">
        <div style="margin-top:10%;">Contact Us!</div>
        <p>We can't solve your problem if you don't tell us about it!</p>
        <div style="padding-bottom:2px;">
            <asp:TextBox style="height:30px; width:100%; border-radius:6px;" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
        </div>
        <div style="padding-bottom:2px;">
            <asp:TextBox style="height:30px; width:100%; border-radius:6px;" ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
        </div>
        <div style="padding-bottom:50px;">
            <textarea style="height:100px; width:100%; border-radius:6px;" id="TextArea1" cols="20" rows="2" placeholder="Message"></textarea>
        </div>
        <div style="margin-bottom:10%;">
            <asp:Button CssClass="myButton" ID="Button1" runat="server" Text="Button"/>
        </div>    
    </div>
    <div style="float:right; margin-top:6%; margin-right:50%;">
        <p>ARTISTIC</p></br>
        <p>Phone Number: (60)128448562</p></br>
        <p>Email: artisticsdnbhd@gmail.com</p>
    </div>
</asp:Content>
