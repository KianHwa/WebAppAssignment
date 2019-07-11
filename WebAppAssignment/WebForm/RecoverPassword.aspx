<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="WebAppAssignment.WebForm.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Stylesheet/Login.css" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            width: 295px;
        }
        html{
            height:100%;
        }
        .auto-style4 {
            font-size: small;
        }
    </style>
</head>
<body style="height:100%;">
    <img src="../Images/moon.jpg" alt="background" style="height:100%; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px);"/>
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%;">
        <div align="center">
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" OnSendingMail="PasswordRecovery1_SendingMail">
                <QuestionTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">Identity Yourself<br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2"><span class="auto-style4">Answer the following question to receive your password.</span><br class="auto-style4" /> <br /> </td>
                                    </tr>
                                    <tr>
                                        <td align="right">User Name:</td>
                                        <td class="auto-style3">
                                            <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">Question:</td>
                                        <td class="auto-style3">
                                            <asp:Literal ID="Question" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Answer:</asp:Label>
                                        </td>
                                        <td class="auto-style3">
                                            <asp:TextBox ID="Answer" runat="server" CssClass="txtBoxInput"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Answer is required." ToolTip="Answer is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <br />
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="PasswordRecovery1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </QuestionTemplate>
                <SuccessTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td>Your password has been sent to you.<br />
                                            <br />
                                            <asp:Button ID="btnHome" runat="server" CssClass="myButton" PostBackUrl="Homepage.aspx" Text="Return to Home" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </SuccessTemplate>
                <UserNameTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" class="auto-style1" colspan="2"><span class="auto-style2">Forgot Your Password?</span><br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2"><span class="auto-style4">Enter your User Name to receive your password</span>.<br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                        </td>
                                        <td style="padding-left:5px;">
                                            <asp:TextBox ID="UserName" runat="server" placeholder="user name" CssClass="txtBoxInput" style="width:80%;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <br />
                                            <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" CssClass="myButton" Text="Continue" ValidationGroup="PasswordRecovery1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </UserNameTemplate>
            </asp:PasswordRecovery>
            <br />
        </div>
    </form>
</body>
</html>
