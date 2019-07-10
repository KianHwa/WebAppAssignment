<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppAssignment.WebForm.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="../Stylesheet/Login.css" type="text/css" />
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
        }
        .auto-style4 {
            font-size: xx-large;
        }
        .auto-style5 {
            height: 72px;
            text-align:center;
        }
        .auto-style6 {
            font-size: small;
        }
        html{
            height:100%;
        }
    </style>
</head>
<body style="height:100%;">
    <img src="../Images/oldcity.jpg" alt="background" style="height:100%; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px);"/>
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%; top:10%;">
        <div align="center">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick1" OnCreatedUser="CreateUserWizard1_CreatedUser1">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center" class="auto-style5"><span class="auto-style4">Create your account to join us!</span><br /></td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="auto-style6">User Name</asp:Label>
                                        <asp:TextBox style="margin-left:11%;" CssClass="txtBoxInput" placeholder="user name" ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="auto-style6">Password</asp:Label>
                                        <asp:TextBox style="margin-left:59px;" CssClass="txtBoxInput" placeholder="password" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="auto-style6">Confirm Password</asp:Label>
                                        <asp:TextBox style="margin-left:4px;" CssClass="txtBoxInput" placeholder="confirm password" ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="auto-style6">E-mail</asp:Label>
                                        <asp:TextBox style="margin-left:81px;" CssClass="txtBoxInput" placeholder="email" ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" CssClass="auto-style6"></asp:Label>
                                        <asp:TextBox style="margin-left:26px;" CssClass="txtBoxInput" placeholder="e.g. 0128345686" ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNo" ErrorMessage="Phone Number is required." ToolTip="Phone Number is required." ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">*</asp:RequiredFieldValidator> --%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="auto-style6 myStyle"></asp:Label>
                                        <asp:TextBox style="margin-left:-3px;" CssClass="txtBoxInput" placeholder="address" ID="txtAddress" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="Address" ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" CssClass="auto-style6">Security Question</asp:Label>
                                        <asp:TextBox style="margin-left:7px;" CssClass="txtBoxInput" placeholder="security question" ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" CssClass="auto-style6">Security Answer</asp:Label>
                                        <asp:TextBox style="margin-left:16px;" CssClass="txtBoxInput" placeholder="security answer" ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" align="center">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem CssClass="one">Member</asp:ListItem>
                                            <asp:ListItem CssClass="one">Artist</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <br />
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="color:Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <table border="0" cellspacing="5" style="width:100%;height:100%;">
                                <tr align="right">
                                    <td align="center" colspan="0">
                                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" OnClick="StepNextButton_Click" CssClass="myButton" Text="Create User" ValidationGroup="CreateUserWizard1" />
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
                                        <br> 
                                        <br></br>
                                        <span class="auto-style2">artworks by purchasing them.</span><br />
                                        <br />
                                        </br> </td>
                                </tr>
                                 <tr>
                                    <td><span class="auto-style2">Thanks for joining us. Have fun!</span><br /> 
                                        <br />
                                     </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" PostBackUrl="Registration2.aspx" />
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
