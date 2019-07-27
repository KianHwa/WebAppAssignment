<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebAppAssignment.WebForm.Profile" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>
<%@ Register TagPrefix="Artwork" TagName="ArtistProfile" Src="~/UserControl/ArtistProfile.ascx" %>
<%@ Register TagPrefix="Artwork" TagName="MemberProfile" Src="~/UserControl/MemberProfile.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div><%
                            String url = "";
                            if (Session["Role"] != null)
                            {
                                if (Session["Role"].Equals("Artist"))
                                {%>
                                    <Artwork:ArtistProfile ID="ctlArtist" runat="server"></Artwork:ArtistProfile>
                                <%}
                                else if (Session["Role"].Equals("Member"))
                                {%>
                                    <Artwork:MemberProfile ID="ctlMember" runat="server"></Artwork:MemberProfile>
                                <%}
                            } %>
            
        </div>

</asp:Content>