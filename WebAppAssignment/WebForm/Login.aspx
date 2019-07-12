<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppAssignment.WebForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Login.css" type="text/css" />
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

        /* Modal Content */
.modal-contents {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s;
}

#msg{
    padding:15px;
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {
        top: -300px;
        opacity: 0
    }

    to {
        top: 0;
        opacity: 1
    }
}

@keyframes animatetop {
    from {
        top: -300px;
        opacity: 0
    }

    to {
        top: 0;
        opacity: 1
    }
}

        /* The Close Button */
        .close {
            color: white;
            float: right;
            padding:30px;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: gray;
                text-decoration: none;
                cursor: pointer;
            }

        .modal-header {
            padding: 20px 16px;
            background: linear-gradient(to right,rgb(45, 45, 45),rgb(0,0,0));
            height: 70px;
            color: white;
            text-align: center;
        }

        .modal-body {
            padding: 2px 16px;
        }

        .modal-footer {
            padding: 2px 16px;
            background: linear-gradient(to right,rgb(45, 45, 45),rgb(0,0,0));
            height: 50px;
            color: white;
        }

        #myModal{
            background-color:rgba(89,89,89,0.3);
            height:50px;
            margin:10px;
            position:absolute;
            z-index:1;
            width:1000px;
            margin-left:270px;
            margin-top:40px;
            height:140px;
        }

       
        </style>
</head>
<body style="height:100%;">
   
    <% 
    String status = Request.QueryString["status"];
    if (status != null)
    {
        if (status.Equals("pleaseSignIn"))
        {
        %>
            <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p style="text-align:center;color:white;font-size:20px;" id="msg">Opps sorry, you need to sign in to access to certain part of the websites<br /><br />
                    <span style="font-size:14px;">Login as <strong>Artist/Member</strong> to buy artworks</span><br />
                    <span style="font-size:14px;">Login as <strong>Artist</strong> to sell artworks</span>
                </p>
            </div>
            <script src="HeaderFooter.js"></script>
            </div>
    <script src="HeaderFooter.js"></script>
        <%}}%>
    <div style="height:100%; width:100%; background-image:url('../Images/Moss-Artwork.png'); background-attachment:fixed;  background-repeat:no-repeat; background-size:cover;margin-left:auto; margin-right:auto; display:block; filter:blur(3px); "></div>
     
    <form id="form1" runat="server" style="position:fixed; right:30%; left:30%; top:30%;">
        <div align="center">
            <span class="auto-style1">Sign In</span><br />
            <br />
            <asp:Login ID="Login1" runat="server" Height="184px" Width="368px" DestinationPageUrl="Homepage.aspx?status=loggedIn" OnLoggedIn="Login1_LoggedIn">
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
