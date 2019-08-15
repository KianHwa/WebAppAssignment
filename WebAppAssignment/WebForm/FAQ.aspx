<%@ Page Language="C#" MasterPageFile="~/MasterPage/GuestHeader.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="WebAppAssignment.WebForm.FAQ" %>
<%@ Register TagPrefix="Artwork" TagName="Footer" Src="~/UserControl/Footer.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .pads{
            padding-bottom:30px;
        }
        html{
            background-image:url("../Images/grey.jpg");
        }
    </style>
    <div style="margin-left:9%; margin-right:9%; margin-top:10%;">
        <h1 style="text-align:center;">FAQ</h1>
        <div>
            <div>
                <h2>Q. Can you sell my artwork(s) at a lower value than my new asking price?</h2>
            </div>
            <div class="pads">
                <p>Only with you prior written consent. In the case of a reasonable offer, we contact you to discuss options. You are always entitiled to reject an offer.</p>
            </div>
        </div>
        <div>
            <div>
                <h2>Q. How do I remove items from my shopping cart?</h2>
            </div>
            <div class="pads">
                You can always remove items by choosing the Remove option in the shopping cart page.
            </div>
        </div>
        <div>
            <div>
                <h2>Q. How will my artworks be shipped?</h2>
            </div>
            <div class="pads">
                <p>Your artwork will arrive rolled in a dent-resistant tube.This method is especially safe for oversized works, and provides lower shipping costs as well. Rolled works can be easily stretched (for canvas works, i.e. placed onto wooden stretcher bars) and/or framed by a local framer upon arrival. Upon immediate delivery, we highly recommend you send any works on paper directly to your framer for cautious, professional unrolling of the artwork.</p>
            </div>
        </div>
        <div>
            <div>
                <h2>Q. Do I need to create an account to purchase?</h2>
            </div>
            <div class="pads">
                <p>Yes, at this time we require all users to </p><a href="Registration.aspx">create an account</a> first before purchasing original artwork and prints on our site. Through your Saatchi Art account, you can: track your purchases; create collections; follow artists and receive updates when they upload new work; select your favorite works; and connect with other members of the ARTISTIC community.</p>
            </div>
        </div>
        <div>
            <div>
                <h2>Q. How long will it take to receive my order?</h2>
            </div>
            <div class="pads">
                <p>Artwork usually arrive within eleven (11) to fourteen (14) business days from time of order, depending on the origin and destination of the artwork as well as the time it takes to clear customs if the work is shipped internationally. From time of shipping, the artwork will usually arrive at the buyer’s destination between seven (7) to ten (10) business days, barring any delays due to customs clearance.</p>
            </div>
        </div>
        <div>
            <div>
                <h2>Q. How do I upload a profile picture?</h2>
            </div>
            <div class="pads">
                <p>Although you don’t have to include a photo of yourself in your profile, we highly recommend that you do, as many collectors are curious to get a glimpse of the artist behind the work. You needn’t, however, provide a headshot. Photos of artists in studio look great on our profile pages and they are especially of interest to collectors, critics, and the general public.</p>
                <p>You can always upload your profile picture in you profile page.</p>
            </div>
        </div>
        <div>
            <div>
                <h2>Q. What are the site's browser requirements?</h2>
            </div>
            <div class="pads">
                <p>To ensure an optimal user experience on our site, please use the latest version of Google Chrome, Firefox, Safari, or Internet Explorer.</p>
                <p>In order to upload images, you’ll need to have the latest version of Adobe Flash Player installed on your system.</p>
            </div>
        </div>
    </div>
</asp:Content>   