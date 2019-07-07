<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppAssignment.WebForm.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: smaller;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            font-size: xx-large;
        }
        .auto-style5 {
            height: 72px;
        }
        .auto-style6 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick1">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center" colspan="2" class="auto-style5"><span class="auto-style4">Create your account to join us!</span><br /> </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="auto-style6">User Name</asp:Label>
                                        <br />
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="auto-style6">Password:</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="auto-style6">Confirm Password:</asp:Label>
                                        <br />
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="auto-style6">E-mail:</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" CssClass="auto-style6">Security Question:</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" CssClass="auto-style6">Security Answer:</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <br />
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <table border="0" cellspacing="5" style="width:100%;height:100%;">
                                <tr align="right">
                                    <td align="right" colspan="0">
                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" OnClick="StepNextButton_Click" Text="Create User" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                        </CustomNavigationTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server" >
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td><span class="auto-style1">Welcome! </span>
                                        <asp:Label ID="username" runat="server"></asp:Label>
                                        <br /> <br /> </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3"><span class="auto-style2">Now you&#39;re ready to view, browse, and collecting your favourite </span> 
                                        <br> </br> <span class="auto-style2">artworks by purchasing them.</span><br /> <br /> </td>
                                </tr>
                                 <tr>
                                    <td><span class="auto-style2">Thanks for joining us. Have fun!</span><br /> 
                                        <br />
                                     </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" PostBackUrl="Homepage.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </div>
    </form>
</body>
</html>
