using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Testimonial : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            String username = Request.QueryString["name"];
            
            SqlDataSource1.SelectCommand = "select aspnet_Users.UserName,UserProfile.profilePicURL, UserProfile.biography from UserProfile inner join aspnet_Users on aspnet_Users.UserId = UserProfile.UserId where aspnet_Users.UserName ='" + username + "'";
            SqlDataSource1.DataBind();

            SqlDataSource2.SelectCommand = "select Artwork.artworkName, Artwork.artworkURL, Artwork.artworkCategory, Artwork.artworkID from Artwork inner join aspnet_Users on Artwork.artistID = aspnet_Users.UserId inner join UserProfile on aspnet_Users.UserId = UserProfile.UserId where aspnet_Users.UserName ='" + username + "'";
            SqlDataSource2.DataBind();
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                MasterPageFile = "~/MasterPage/LoggedInHeader.Master";
            }
            else
            {
                MasterPageFile = "~/MasterPage/GuestHeader.Master";
            }


        }
    }

    
}