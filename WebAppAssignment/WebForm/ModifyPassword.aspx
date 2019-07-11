<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyPassword.aspx.cs"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="../Stylesheet/Login.css" type="text/css" />
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style4 {
            height: 22px;
        }
        .auto-style5 {
            text-align:center;
            height: 31px;
        }
        html{
            height:100%;
        }
    </style>
</head>
<body style="height:100%;">
    <img src="../Images/city.jpg" alt="background" style="height:100%; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(2px);"/>
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%; top:20%;">
        <div>
            <div style="text-align:center;">
            <span class="auto-style2">Change your password</span><br />
            </div>
            <br />
            <br />
            Enter a new password for your account. We highly
            recommended you create a unique and easily remember password.<br />
            <br />
            <br />
            <br />
        </div>
            <div align="center">
                <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="Homepage.aspx" ContinueDestinationPageUrl="Homepage.aspx">
                    <ChangePasswordTemplate>
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <div>
                                    <table cellpadding="0">
                                        <tr align="center">
                                            <td align="left"; style="margin-left:10%">
                                                <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="CurrentPassword" style="width:80%;" runat="server" placeholder="Old Password" CssClass="txtBoxInput" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td align="left">
                                                <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="NewPassword" style="width:80%;" runat="server" placeholder="New Password" CssClass="txtBoxInput" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td align="left">
                                                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmNewPassword" style="width:80%;" runat="server" placeholder="Confirm Password" CssClass="txtBoxInput" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        </div>
                                        <tr align="center">

                                            <td align="center" colspan="2">
                                                <br />
                                                <br />
                                                <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;" class="auto-style4">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="auto-style5">
                                                <asp:Button ID="ChangePasswordPushButton" CssClass="myButton" runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" />
                                                <asp:Button ID="CancelPushButton" CssClass="myButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ChangePasswordTemplate>
                </asp:ChangePassword>
            </div>
    </form>
</body>
</html>
