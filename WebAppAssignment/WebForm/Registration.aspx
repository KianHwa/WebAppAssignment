<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebAppAssignment.WebForm.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Login.css" type="text/css" />
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
        html{
            height:100%;
        }
        .marginleft{
            margin-left:10%;
        }
    </style>
</head>
<body style="height:100%;">
    <img src="../Images/oldcity.jpg" alt="background" style="height:100%; position:fixed; width:100%; background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px);"/>
    <form id="form1" runat="server" style="right:25%; left:25%; top:3%;">
        <div align="center">
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick1" OnCreatedUser="CreateUserWizard1_CreatedUser1">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server">
                        <ContentTemplate>
                            <table>
                                <tr align="center;">
                                    <td style="text-align:center;" class="auto-style5"><span class="auto-style4">Create your account to join us!</span><br /></td>
                                </tr>
                            </table>
                            <table class="tablesclass">
                                <div style="border-bottom:1.5px solid gray;">Account</div>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="auto-style6">User Name</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="user name" ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ForeColor="Red" ToolTip="User Name is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="auto-style6">Password</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="password" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red" ToolTip="Password is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="auto-style6">Confirm Password</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="confirm password" ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm password is required." ForeColor="Red" ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" CssClass="auto-style6">E-mail</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="email" ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Email Address is invalid." ValidationGroup="CreateUserWizard1" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" CssClass="auto-style6">Security Question</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="security question" ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ForeColor="Red" ToolTip="Security question is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" CssClass="auto-style6">Security Answer</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput marginleft" placeholder="security answer" ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ForeColor="Red" ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                </table>
                                <table style="margin-left:6%;">
                                <div style="border-bottom:1.5px solid gray;">Contact</div>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" CssClass="auto-style6"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput" style="margin-left:8%;" placeholder="e.g. 0128345686" ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required." ToolTip="Phone Number is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Phone Number is not valid!" ControlToValidate="txtPhoneNumber" ValidationExpression="^(01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="text-align:right;">
                                        <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="auto-style6"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="txtBoxInput" style="margin-left:8%;" placeholder="address" ID="txtAddress" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." ForeColor="Red" ToolTip="Address is required." ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                </table>
                                <table style="margin-left:33%;">
                                <tr>
                                    <td class="auto-style3">
                                        <div style="padding-bottom:10px; padding-top:15px;">What do you want to do?</div>
                                        <asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Collect, Buy your favourite arts." CssClass="one">Buy Art</asp:ListItem>
                                            <asp:ListItem CssClass="one">Sell Art</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <br /><br /><asp:RequiredFieldValidator ID="RoleRequired" runat="server" ErrorMessage="Role is required" ControlToValidate="rblRole" ForeColor="Red" ToolTip="Role is required" style="padding-left:60px;" ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                </table>
                                <table>
                                <tr>
                                    <td>
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
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
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
                                      
                                        <span class="auto-style2">artworks by purchasing them.</span><br />
                                        
                                        <br>
                                        
                                        </br> </td>
                                </tr>
                                 <tr>
                                    <td><span class="auto-style2">Thanks for joining us. Have fun!</span><br /> 
                                        <br />
                                     </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                            <asp:ValidationSummary style="position:absolute;" ID="ValidationSummary2" runat="server" />
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
