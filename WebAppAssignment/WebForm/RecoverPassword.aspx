<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="WebAppAssignment.WebForm.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../CSS/Login.css" type="text/css" />
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
            <asp:PasswordRecovery ID="PasswordRecovery2" runat="server"></asp:PasswordRecovery>
        </div>
        
    </form>

</body>
</html>
