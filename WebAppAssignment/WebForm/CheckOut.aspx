<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPage/GuestHeader.Master" CodeBehind="CheckOut.aspx.cs" Inherits="WebAppAssignment.WebForm.CheckOut" %>
<%@ Register TagPrefix="CheckOut" TagName="Shipping" Src="~/UserControl/Shipping.ascx" %>

<asp:Content ID="CheckOut" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            margin-top:150px;
            background:url('../Images/grey.jpg');
        }

        .body{
            margin:100px;
        }

        .progressBar{
            counter-reset:step;
        }

        .progressBar li{
            list-style-type:none;
            float:left;
            width:25%;
            position:relative;
            text-align:center;
        }

        .progressBar li:before{
            content:counter(step);
            counter-increment:step;
            width:30px;
            height:30px;
            line-height:30px;
            border:1px solid #d9d9d9;
            display:block;
            text-align:center;
            margin:0 auto 10px auto;
            border-radius:50%;
            background-color:white;
        }

        .progressBar li:after{
            content:'';
            position:absolute;
            width:100%;
            height:1px;
            background-color:#d9d9d9;
            top:15px;
            left:-50%;
            z-index:-1;
        }
    </style>
        <div class="body" style="background-color:rgba(89,89,89,0.3);">
            <CheckOut:Shipping ID="ctlShipping" runat="server"/>
        </div>
</asp:Content>