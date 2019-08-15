<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="whysell.aspx.cs" Inherits="WebAppAssignment.WebForm.whysell" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .create-account-step{
            margin-top:60px;
            margin-right:0px;
            margin-bottom:60px;
            margin-left:0px;
            width:100%;
            display:flex;
            justify-content:center;
        }
        .create-account-steps{
            max-width:370px;
            text-align:center;
            padding-top:16px;
            padding-right:16px;
            padding-bottom:16px;
            padding-left:16px;
            width:100%;
        }
        *{
            box-sizing:border-box;
        }
        .centered{
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
        }
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

    </style>
    <img style="height:600px; width:100%; font-family:'Times New Roman';" src="../Images/whysellmain.jpg" />
    <div style="color:white; font-size:3.75rem;" class="centered">Sell your arts to art lovers</div>
    <h2 style="text-align:center;">
        Create your account and start selling your art today</h2>
    <asp:Button CssClass="centered myButton" style="margin-top:10%;" ID="Button1" runat="server" Text="Start Sell" Onclick="Button1_Click"/>
    <div class="create-account-step">
        <div class="create-account-steps">
            <img src="../Images/step1.png" />
            <h3>Step 1:</h3>
            <h3>Create Your Account</h3>
        </div>
        <div class="create-account-steps">
            <img src="../Images/step2.png" />
            <h3>Step 2:</h3>
            <h3>Photograph Your Artwork</h3>
        </div>
        <div class="create-account-steps">
            <img src="../Images/step3.png" />
            <h3>Step 3:</h3>
            <h3>Upload Your Artwork</h3>
        </div>
        <div class="create-account-steps">
            <img src="../Images/step4.png" />
            <h3>Step 4:</h3>
            <h3>Complete Your Profile</h3>
        </div>
    </div>
    <asp:Button style="margin-top:45%;" CssClass="centered myButton" ID="Button2" runat="server" Text="Start Sell" onclick="Button2_Click"/>
</asp:Content>
