<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppAssignment.WebForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="../Stylesheet/Login.css" type="text/css" />
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 80px;
        }
        html{
            height:100%;
        }
        .auto-style4 {
            height: 184px;
            width: 368px;
        }
        </style>
</head>
<body style="height:100%;">
    <img src="../Images/Moss-Artwork.png" alt="background" style="height:100%; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px);"/>
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%;">
        <div align="center">
            <span class="auto-style1">Sign In</span><br />
            <br />
            <asp:Login ID="Login1" runat="server" Height="184px" Width="368px" DestinationPageUrl="Homepage.aspx?status=loggedIn">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" class="auto-style4">
                                    <tr align="center">
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name </asp:Label>
                                        <br /><br />
                                        </td>
                                        <td style="padding-left:5px;">
                                            <asp:TextBox ID="UserName" runat="server" placeholder="User Name" CssClass="txtBoxInput txtBoxwid"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <br /><br />
                                        </td>
                                    </tr>

                                    <tr align="center">
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password </asp:Label>
                                        </td>
                                        <td style="padding-left:5px;">
                                            <asp:TextBox ID="Password" runat="server" placeholder="Password" TextMode="Password" CssClass="txtBoxInput txtBoxwid" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td class="auto-style3" colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" CssClass="chkBox" Text=" " />
                                            <asp:Label CssClass="lbl" runat="server">Keep me signed in</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            <br />
                                            <asp:Label ID="lblNotExist" runat="server"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="auto-style2">
                                            <asp:Button CssClass="myButton" ID="LoginButton" runat="server" CommandName="Login" Text="Sign In" ValidationGroup="Login1" />
                                            <asp:Button CssClass="myButton" ID="btnForgotPassword" runat="server" Text="Forgot Password?" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </div>
            <br />  
    </form>
</body>
</html>
