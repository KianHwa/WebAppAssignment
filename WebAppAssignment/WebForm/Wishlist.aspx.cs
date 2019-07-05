using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
                SqlDataSource1.SelectCommand = "select * from Artwork inner join WishlistDetails on Artwork.artworkID = WishlistDetails.artworkID join " +
                                               "Wishlist on WishlistDetails.wishlistID = Wishlist.wishlistID join " +
                                               "aspnet_Membership on aspnet_Membership.UserId = Wishlist.UserId where aspnet_Membership.UserId ='" + Session["UserId"].ToString() + "'";
                SqlDataSource1.DataBind();
                Repeater1.DataBind();
            }
        }
    }
}