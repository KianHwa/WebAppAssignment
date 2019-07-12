<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="SellArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.SellArtwork" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
    <link rel="stylesheet" type="text/css" href="../CSS/SellArtwork.css">
    
    <div class="body">
        <h1 style="border-left:2px solid #d9d9d9;margin-top:150px;text-align:center">Upload your artwork here</h1>
        <div class="uploadForm">
            <table class="auto-style3">
                <tr>
                    <td class="auto-style4">Artwork Name</td>
                    <td class="auto-style2"><asp:TextBox ID="txtArtworkName" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Image</td>
                    <td class="auto-style5">
            <asp:FileUpload ID="artworkUpload" runat="server" CssClass="uploadFill"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Category</td>
                    <td class="auto-style2">
            <asp:DropDownList ID="ddlArtworkCat" runat="server" CssClass="uploadFill">
                <asp:ListItem>Painting</asp:ListItem>
                <asp:ListItem>Portrait</asp:ListItem>
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Description</td>
                    <td class="auto-style2"> <asp:TextBox ID="txtArtworkDesc" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Price</td>
                    <td class="auto-style2"><asp:TextBox ID="txtArtworkPrice" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Stock</td>
                    <td class="auto-style2">
            <asp:TextBox ID="txtStock" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" CssClass="btnUpload"/>
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
        </div>
        </div>
        </asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2 {
            width: 161px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 127px;
            text-align:right;
            padding-right:10px;
        }
        .auto-style5 {
            width: 161px;
            margin-left: 40px;
        }
        .auto-style6 {
            width: 127px;
            text-align: right;
            padding-right: 10px;
            margin-left: 40px;
        }
    </style>
</asp:Content>

