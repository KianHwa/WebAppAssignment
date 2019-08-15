<%@ Page Language="C#" MasterPageFile="~/MasterPage/LoggedInHeader.Master" AutoEventWireup="true" CodeBehind="SellArtwork.aspx.cs" Inherits="WebAppAssignment.WebForm.SellArtwork" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
    <link rel="stylesheet" type="text/css" href="../CSS/SellArtwork.css">
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
        .uploadForm{
            height:550px;
        }
        .validationMsg{
            color:red;
            position:absolute;
            margin-left:10px;   
        }
        .errMsg{
            height:10px;
        }
    </style>
    <div class="body">
        <% 
    String status = Request.QueryString["status"];
    if (status != null)
    {
        if (status.Equals("success"))
        {
        %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center;color:green" id="msg">Successfully uploaded your artwork</p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
        <%}
    }%>
        <h1 style="border-left:2px solid #d9d9d9;margin-top:150px;text-align:center">Upload your artwork here</h1>
        <div class="uploadForm">
            <table class="auto-style3">
                <tr>
                    <td>Artwork Name</td>
                    <td><asp:TextBox ID="txtArtworkName" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="vertical-align:top"><asp:RequiredFieldValidator ID="nameRequired" runat="server" CssClass="validationMsg" ErrorMessage="Give your artwork a name" ControlToValidate="txtArtworkName"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Image</td>
                    <td class="auto-style5">
            <asp:FileUpload ID="artworkUpload" runat="server" CssClass="uploadFill"/>
                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td style="vertical-align:top""><asp:Label ID="noImage" runat="server" Text="" style="color:red;"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Category</td>
                    <td class="auto-style2">
            <asp:DropDownList ID="ddlArtworkCat" runat="server" CssClass="uploadFill">
                <asp:ListItem>Collages</asp:ListItem>
                <asp:ListItem>Digital Arts</asp:ListItem>
                <asp:ListItem>Drawing</asp:ListItem>
                <asp:ListItem>Mosaic Art</asp:ListItem>
                <asp:ListItem>Painting</asp:ListItem>
                <asp:ListItem>Photography</asp:ListItem>
                <asp:ListItem>Portrait</asp:ListItem>
                <asp:ListItem>Printmaking</asp:ListItem>
                <asp:ListItem>Sculpture</asp:ListItem>
            </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Description</td>
                    <td class="auto-style2"> <asp:TextBox ID="txtArtworkDesc" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td style="vertical-align:top""><asp:RequiredFieldValidator ID="descRequired" runat="server" ErrorMessage="Please write an description for your artwork" ControlToValidate="txtArtworkDesc" CssClass="validationMsg"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style4">Artwork Price</td>
                    <td class="auto-style2"><asp:TextBox ID="txtArtworkPrice" runat="server" CssClass="uploadFill"></asp:TextBox>
                        
                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td style="vertical-align:top"">
                        <asp:RequiredFieldValidator ID="priceRequired" runat="server" ErrorMessage="Set a price for your artwork" ControlToValidate="txtArtworkPrice" CssClass="validationMsg"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="wrongPriceFormat" runat="server" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Must be an Integer" CssClass="validationMsg" ControlToValidate="txtArtworkPrice"></asp:CompareValidator>
                    </td>
                 </tr>
                <tr>
                    <td class="auto-style4">Artwork Stock</td>
                    <td class="auto-style2">
            <asp:TextBox ID="txtStock" runat="server" CssClass="uploadFill"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td style="vertical-align:top"">
                        <asp:RequiredFieldValidator ID="stockRequired" CssClass="validationMsg" runat ="server" ErrorMessage="Set a number for your artwork stock" ControlToValidate="txtStock"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="wrongStockFormat" Type="Integer" Operator="DataTypeCheck" runat="server" ErrorMessage="Must Be an Integer" CssClass="validationMsg" ControlToValidate="txtStock"></asp:CompareValidator>
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
    
    
</asp:Content>

