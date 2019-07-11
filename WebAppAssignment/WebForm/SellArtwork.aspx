<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="SellArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.SellArtwork" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
        <div>
            Artwork Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtArtworkName" runat="server"></asp:TextBox>
            <br />
            Artwork Image:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="artworkUpload" runat="server" />
            <br />
            Artwork Category:&nbsp;&nbsp;
            <asp:DropDownList ID="ddlArtworkCat" runat="server">
                <asp:ListItem>Painting</asp:ListItem>
                <asp:ListItem>Portrait</asp:ListItem>
            </asp:DropDownList>
            <br />
            Artwork Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtArtworkPrice" runat="server"></asp:TextBox>
            <br />
            Artwork Description<asp:TextBox ID="txtArtworkDesc" runat="server"></asp:TextBox>
            <br />
            Artwork Stock:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" />
            <br />
            <br />
        </div>
        </asp:Content>
