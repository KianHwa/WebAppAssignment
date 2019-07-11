<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration2.aspx.cs" Inherits="WebAppAssignment.WebForm.Registration2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="../CSS/Login.css" type="text/css" />
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        html{
            height:100%;
        }
        .auto-style2 {
            width: 175px;
            margin-left:5%;
        }
        .auto-style3 {
            font-size: large;
        }
    </style>
</head>
<body style="height:100%;">
    <img src="../Images/drytree.jpg" alt="background" style="height:100%; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px);"/>
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%;">
        <div style="text-align:center; margin-left:25%;">
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td colspan="2"><span class="auto-style3">Let Us Know You More</span><br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="lblQuote" runat="server">Quote</asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <textarea id="txtQuote" style="width:90%;" class="txtBoxInput" cols="20" name="S1" rows="2" runat="server"></textarea></td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="lblBiography" runat="server">Biography</asp:Label>
                                </td>
                                <td class="auto-style2">
                                    <textarea id="txtBiography" style="width:90%;" class="txtBoxInput" cols="20" name="S2" rows="2" runat="server"></textarea></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="auto-style1">
                                    <asp:Button ID="btnConfirm" CssClass="myButton" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
                                    <asp:Button ID="btnSkip" CssClass="myButton" runat="server" Text="Skip" PostBackUrl="Login.aspx" OnClick="btnSkip_Click" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
