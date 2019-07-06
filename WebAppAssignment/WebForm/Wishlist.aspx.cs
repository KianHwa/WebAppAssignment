using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            if (IsPostBack == false)
            {
                Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
                SqlDataSource1.SelectCommand = "select * from Artwork inner join WishlistDetails on Artwork.artworkID = WishlistDetails.artworkID join " +
                                               "Wishlist on WishlistDetails.wishlistID = Wishlist.wishlistID join " +
                                               "aspnet_Membership on aspnet_Membership.UserId = Wishlist.UserId where aspnet_Membership.UserId ='" + Session["UserId"].ToString() + "'";
                SqlDataSource1.DataBind();
                Repeater1.DataBind();
            }
            
            
        }

        protected void deleteWishlistBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            Button btn = (Button)sender;

            String[] wishlistArg = new string[2];
            wishlistArg = btn.CommandArgument.ToString().Split(';');

            String wishlistID = wishlistArg[0];
            String artworkID = wishlistArg[1];
            String deleteWishlistDetailsSql = "delete from WishlistDetails where wishlistID ='" + wishlistID + "' and artworkID ='" + artworkID + "'";
            String deleteWishlistSql = "delete from Wishlist where wishlistID ='" + wishlistID + "'";

            conn.Open();
            SqlCommand cmd;
            SqlDataAdapter adapter = new SqlDataAdapter();

            //Delete Wishlist Details Record
            cmd = new SqlCommand(deleteWishlistDetailsSql, conn);
            adapter.DeleteCommand = new SqlCommand(deleteWishlistDetailsSql, conn);
            adapter.DeleteCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            //Delete Wishlist Record
            conn.Open();
            cmd = new SqlCommand(deleteWishlistSql, conn);
            adapter.DeleteCommand = new SqlCommand(deleteWishlistSql, conn);
            adapter.DeleteCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            Response.Redirect("Wishlist.aspx");
        }
    }
}