﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberProfile.ascx.cs" Inherits="WebAppAssignment.UserControl.MemberProfile" %>
<link rel="stylesheet" type="text/css" href="../CSS/HeaderFooter.css">
    
   
<style>
        
    body {
            background: url('../Images/grey.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            overflow: auto;
        }
        .title {
          color: grey;
          font-size: 23px;

        }
        
        .btnEdit {
          border: none;
          outline: 0;
          display: inline-block;
          padding: 5px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 400px;
          font-size: 18px;
          border-radius: 4px;
        }

        .btnEditCancel{
            background-color: #000;
            border: none;
            color: white;
            width:199px;
            padding: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            float:left;
            outline: 0;
            cursor: pointer;
            border-radius: 4px;
        }
        .btnEditCancel:hover{
            opacity: 0.7;
        }
        .btnEdit:hover, a:hover {
          opacity: 0.7;
        }
        .artProf{
            font-size: 23px;
            text-align: center;
            word-break: break-word;
            border-radius: 4px;
        }
        .overlayPic {
          position: absolute;
          top: 126px;
          bottom: 0;
          left: 560px;
          right: 0;
          height: 310px;
          width: 401px;
          opacity: 0;
          transition: .5s ease;
          background-color: darkgray;
           border-radius: 4px;
          
        }

        .containerArtist:hover .overlayPic {
          opacity: 1;
          transition:0.3s;
        }

        .text {
          color: white;
          font-size: 20px;
          position: absolute;
          top: 50%;
          left: 50%;
          -webkit-transform: translate(-50%, -50%);
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
          text-align: center;
          
        }
        .updatePic{
           
            border: none;
              color: white;
              text-align: center;
              text-decoration: none;
              display: inline-block;
              font-size: 16px;
              margin-top: 50px;
              margin-right: 20px;
              padding: 8px 30px 8px 30px;
              transition-duration: 0.4s;
              cursor: pointer;
        }
        .updatePic:hover {
              background-color: black;
              color: white;
              transition:0.3s;
        }
        .uploadArtist{
              border: none;
              color: white;
             
              font-size: 16px;
             
              margin-top: 40px;
             
              
        }
       .profileTxt{
            padding: 4px 10px;
            margin:8px 0;
            display: inline-block;
            border:1px solid #ccc;
            border-radius: 4px;
            box-sizing:border-box;
            width:50%;
            opacity:0.6;
            margin-left: 10px;

        }


        .profileTxt:hover{
            opacity:0.8;
            transition:0.3s;
        }

        .btnHistory{
            border: none;
          outline: 0;
          display: inline-block;
          padding : 6px;
          margin-left: 43%;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 200px;
          padding-top: 20px;
          padding-bottom: 20px;
          font-size: 18px;
          border-radius: 4px;
          margin-top: 10px;
          margin-bottom: 10px;
        }
        .btnHistory:hover{
            opacity: 0.7;
            transition:0.3s;
        }
        .noImageLbls{
            font-size: small;
            color: red;
        }
</style>

    <h2 style="text-align:center">Customer Profile</h2>
    <div style="box-shadow: 0 4px 50px 0 rgba(0, 0, 0, 0.2);
        max-width: 400px;
        text-align: center;
        margin:auto;
        border-radius: 4px;
        margin-bottom: 40px;
        font-family: arial;">
       
        
    <asp:FormView ID="fvCustomerProf" runat="server" DataSourceID="SqlDataSource1"> 
            
                <EditItemTemplate>
                    <div class="containerArtist" style="width: 100%;">
            
                        <img style="width:400px; height:307px; border-radius: 4px;" src="<%# Eval("profilePicURL")%>" />
       
                    </div>
                    <div class="artProf">
                    
                        <blockquote>
                            <p>
                                Name:
                            </p>
                            <p>
                                <asp:Label ID="usernameTxt" runat="server" Text='<%# Eval("UserName") %>' />
                            </p>
                            <br />
                            <p>
                                Address:
                            </p>
                            <p>
                                <blockquote>
                                    <asp:TextBox ID="addressTxt" class="profileTxt" Width="80%"  runat="server" Text='<%# Bind("address") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="addressTxt" ErrorMessage="Address field is required" Display="Dynamic" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="addressTxt"
                                 ForeColor="Red"  Font-Size="Small" ValidationExpression="^[a-zA-Z0-9+\\s(),-]+$" ErrorMessage="Please enter correct address format"></asp:RegularExpressionValidator>
                                </blockquote>    
                            </p>
                            <br />
                            <p>
                                Mobile Phone
                            </p>
                            <p>
                                <asp:TextBox ID="phoneTxt" class="profileTxt" Width="80%" runat="server" Text='<%# Bind("phoneNumber") %>' />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red"
                                ControlToValidate="phoneTxt" ErrorMessage="Please enter only number without (-) and number not more than 11 digits."
                            ValidationExpression="^\d{10,11}$" Display="Dynamic" Font-Size="Small"></asp:RegularExpressionValidator> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="phoneTxt" ErrorMessage="Mobile Phone field is required" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>   
                            </p>
                            <br />
                    
                        </blockquote>
                       
                    <asp:Button ID="UpdateButton" class="btnEditCancel"  runat="server" CausesValidation="True" CommandName="Update" Text="Update   " OnClick="UpdateButton_Click" />

                    <asp:Button ID="UpdateCancelButton" class="btnEditCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                       
                            
                        </div>
                </EditItemTemplate>
       
                <ItemTemplate>
                    <div class="containerArtist" style="width: 100%;">
            
            <img style="width:400px; height: 307px; border-radius: 4px;" src="<%# Eval("profilePicURL")%>" />
       
        <div class="overlayPic">
            <div class="text">
                <asp:FileUpload  ID="memberUpload" class="uploadCustomer"  runat="server" />
                <asp:Label ID="noImageLbl" class="noImageLbls" runat="server" ></asp:Label>
                <br />
                <asp:Button ID="UpdatePicButton1" class="updatePic" runat="server" CausesValidation="True"  Text="Edit" OnClick="UpdatePicButton1_Click" />
            </div>
            
        </div>
        </div>
                    <div class="artProf">
                    <p>
                         Name:
                    </p>
                    <p style="color:darkgray;">
                        <asp:Label ID="UserNameLabel" Font-Size="Medium"  runat="server" Text='<%# Bind("UserName") %>' />
                    </p>
                    <br />
                  
                    <p>
                        Address:
                    </p>
                        <blockquote>
                    <p style="color:darkgray;">
                        <asp:Label ID="addressLabel" Font-Size="Medium" runat="server" Text='<%# Eval("address") %>' />
                    </p>
                            </blockquote>
                    <br />
                    <p>
                        Mobile Phone:
                    </p>
                    <p style="color:darkgray;">
                        <asp:Label ID="phoneNumberLabel" Font-Size="Medium" runat="server" Text='<%# Eval("phoneNumber") %>' />
                    </p>
                    <br />
                   
                   
                    <asp:Button ID="EditButton" class="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                     </div>   
                </ItemTemplate>
            </asp:FormView>
        </div>
<asp:Button ID="btnChgPassword" CssClass="btnHistory" runat="server" Text="Change Password" PostBackUrl="~/WebForm/ModifyPassword.aspx" />
    
        <asp:Button ID="btnHistory" CssClass="btnHistory" runat="server" Text="Payment History" PostBackUrl="~/WebForm/PaymentHistory.aspx" />
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT U.UserName, Us.profilePicURL, Us.address, Us.phoneNumber,
             FROM vw_aspnet_Users AS U INNER JOIN UserProfile AS Us ON U.UserId = Us.UserId"></asp:SqlDataSource>
