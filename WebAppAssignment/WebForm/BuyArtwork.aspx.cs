using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAppAssignment.Models;

namespace WebAppAssignment.WebForm
{
    public partial class BuyArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {

                SqlDataSource3.SelectCommand = "Select * from Artwork";
                SqlDataSource3.DataBind();
                Repeater1.DataBind();

            }
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

        protected void filter_SelectedIndexChanged(object sender, EventArgs e)
        {
            String query = "Select * from aspnet_Membership inner join aspnet_Users on aspnet_Membership.UserId = aspnet_Users.UserId inner join Artwork on aspnet_Membership.UserId = Artwork.artistID where ";
            int counter = 0;
            if (!ddlCategory.SelectedItem.Text.Equals("Select a category"))
            {
                if (counter == 0)
                {
                    query += "Artwork.artworkCategory ='" + ddlCategory.Text + "' ";
                    counter = 2;
                }
                else
                {
                    query += "and Artwork.artworkCategory ='" + ddlCategory.Text + "' ";
                }
            }
            if (!ddlPrice.SelectedItem.Text.Equals("Select a price range"))
            {
                if (counter == 0)
                {
                    if(ddlPrice.SelectedItem.Text.Equals("Less than 100"))
                    {
                        query += "Artwork.artworkPrice <100 ";
                        counter = 2;
                    }
                    else if(ddlPrice.SelectedItem.Text.Equals("Between 100 and 500"))
                    {
                        query += "Artwork.artworkPrice between 100 and 500 ";
                        counter = 2;
                    }
                    else if (ddlPrice.SelectedItem.Text.Equals("Between 501 and 1000"))
                    {
                        query += "Artwork.artworkPrice between 501 and 1000 ";
                        counter = 2;
                    }
                    else
                    {
                        query += "Artwork.artworkPrice >1000 ";
                        counter = 2;
                    }

                }
                else
                {
                    if (ddlPrice.SelectedItem.Text.Equals("Less than 100"))
                    {
                        query += "and Artwork.artworkPrice <100 ";
                        counter = 2;
                    }
                    else if (ddlPrice.SelectedItem.Text.Equals("Between 100 and 500"))
                    {
                        query += "and Artwork.artworkPrice between 100 and 500 ";
                        counter = 2;
                    }
                    else if (ddlPrice.SelectedItem.Text.Equals("Between 501 and 1000"))
                    {
                        query += "and Artwork.artworkPrice between 501 and 1000 ";
                        counter = 2;
                    }
                    else
                    {
                        query += "and Artwork.artworkPrice > 1000 ";
                        counter = 2;
                    }
                }
            }
            if (!ddlArtist.SelectedItem.Text.Equals("Select an artist"))
            {
                if (counter == 0)
                {
                    query += "aspnet_Users.UserName ='" + ddlArtist.Text + "' ";
                    counter = 2;
                }
                else
                {
                    query += "and aspnet_Users.UserName ='" + ddlArtist.Text + "' ";
                    counter = 2;
                }
            }
            if (counter == 0)
            {
                query = "Select * from Artwork ";
            }

            SqlDataSource3.SelectCommand = query;
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }

        protected void txtSearchArtwork_TextChanged(object sender, EventArgs e)
        {
            String search = txtSearchArtwork.Text;
            SqlDataSource3.SelectCommand = "Select * from Artwork where artworkName like '%" + search + "%' or lower(artworkName) like '%" + search + "%' or upper(artworkName) like '%" + search + "%'"; 
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }

        protected void txtSearch_Click(object sender, EventArgs e)
        {
            String search = txtSearchArtwork.Text;
            SqlDataSource3.SelectCommand = "Select * from Artwork where artworkName like '%" + search + "%'";
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Button btn = (Button)sender;

                SqlCommand cmd;
                SqlDataReader reader;
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                //check duplicate order
                conn.Open();
                int duplicateOrder = 0;
                int orderID = 0;
                int orderQty = 0;
                int artworkStock = 0;
                cmd = new SqlCommand("select OrderDetails.artworkID, OrderDetails.OrderID, OrderDetails.orderQuantity from OrderDetails inner join Orders on OrderDetails.orderID = Orders.orderID " +
                                     " inner join aspnet_Users on Orders.UserId = aspnet_Users.UserId where OrderDetails.artworkID=" + btn.CommandArgument + " and aspnet_Users.Username='" + Session["Username"].ToString() + "' and Orders.orderStatus='Pending'", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    orderID = (int)reader.GetValue(1);
                    orderQty = (int)reader.GetValue(2);
                    duplicateOrder++;
                }
                conn.Close();

                //check quantity
                conn.Open();
                cmd = new SqlCommand("Select artworkStock from Artwork where artworkID ='" + btn.CommandArgument + "'", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    artworkStock = (int)reader.GetValue(0);
                }
                conn.Close();

                if (artworkStock > 0)
                {
                    if (duplicateOrder == 0)
                    {

                        String ordersSql = "insert into Orders (orderStatus,UserId,orderDate) values('Pending','" + Session["UserId"].ToString() + "','" + DateTime.Now.ToString("MM/dd/yyyy")  + "')";
                        
                        //Insert into Order table
                        cmd = new SqlCommand(ordersSql, conn);
                        conn.Open();
                        adapter.InsertCommand = new SqlCommand(ordersSql, conn);
                        adapter.InsertCommand.ExecuteNonQuery();
                        cmd.Dispose();
                        conn.Close();

                        //Find order ID
                        conn.Open();
                        int orderid = 0;
                        cmd = new SqlCommand("select top(1) orderID from Orders order by orderID desc", conn);
                        reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            orderid = (int)reader.GetValue(0);
                        }
                        conn.Close();

                        //Insert into Associative Table (OrderDetails Table)
                        String orderDetailsSql = "insert into OrderDetails (orderID, artworkID,orderQuantity) select o.orderID, a.artworkID,1 from Orders o cross join Artwork a where o.orderID ='" + orderid + "' and a.artworkID = " + btn.CommandArgument;
                        cmd = new SqlCommand(orderDetailsSql, conn);
                        conn.Open();
                        adapter.InsertCommand = new SqlCommand(orderDetailsSql, conn);
                        adapter.InsertCommand.ExecuteNonQuery();
                        cmd.Dispose();
                        conn.Close();
                        Response.Redirect("BuyArtwork.aspx?status=orderAdded");
                    }
                    else
                    {
                        orderQty++;
                        String updateQtySql = "update OrderDetails set OrderQuantity =" + orderQty + " where orderID ='" + orderID + "'";
                        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                        conn.Open();
                        cmd = new SqlCommand(updateQtySql, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();



                        Response.Redirect("BuyArtwork.aspx?status=orderAdded");
                    }
                }
                else
                {
                    Response.Redirect("BuyArtwork.aspx?status=noStock");
                }
            }
            else
            {
                Response.Redirect("Login.aspx?status=pleaseSignIn");
            }
        }

        protected void btnAddToWishlist_Click(object sender, EventArgs e)
        {
            if (Session["Username"] !=null) {
                Button btn = (Button)sender;
                Boolean wishlistDuplication = false;
                SqlCommand cmd;
                SqlDataReader reader;
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
                String wishlistSql = "insert into Wishlist (UserId) values ('" + Session["UserId"].ToString() + "')";

                //Check duplicate wishlist item
                conn.Open();
                cmd = new SqlCommand("select Wishlist.UserId, WishlistDetails.artworkID from Wishlist inner join WishlistDetails on Wishlist.wishlistID = WishlistDetails.wishlistID join aspnet_Membership on Wishlist.UserId = aspnet_Membership.UserId where aspnet_Membership.UserId='" + Session["UserId"].ToString() + "' and WishlistDetails.artworkID ='" + btn.CommandArgument + "'", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.GetValue(0).ToString().Equals(Session["UserId"].ToString()) && (int)reader.GetValue(1) == Convert.ToInt32(btn.CommandArgument))
                    {
                        wishlistDuplication = true;
                        Response.Redirect("BuyArtwork.aspx?status=duplicate");
                    }
                }
                conn.Close();


                if (wishlistDuplication == false)
                {
                    //Insert into Wishlist table
                    cmd = new SqlCommand(wishlistSql, conn);
                    conn.Open();
                    adapter.InsertCommand = new SqlCommand(wishlistSql, conn);
                    adapter.InsertCommand.ExecuteNonQuery();
                    cmd.Dispose();
                    conn.Close();

                    //Find wishlist ID
                    conn.Open();
                    int wishlistID = 0;
                    cmd = new SqlCommand("select top(1) wishlistID from Wishlist order by wishlistID desc", conn);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        wishlistID = (int)reader.GetValue(0);
                    }
                    conn.Close();

                    //Insert into Associative Table (Wishlist Details table)
                    String wishlistDetailsSql = "insert into WishlistDetails (wishlistID, artworkID) select w.wishlistID, a.artworkID from Wishlist w cross join Artwork a where w.wishlistID ='" + wishlistID + "' and a.artworkID = '" + btn.CommandArgument + "'";
                    cmd = new SqlCommand(wishlistDetailsSql, conn);
                    conn.Open();
                    adapter.InsertCommand = new SqlCommand(wishlistDetailsSql, conn);
                    adapter.InsertCommand.ExecuteNonQuery();
                    cmd.Dispose();
                    conn.Close();
                }
                Response.Redirect("BuyArtwork.aspx?status=wishlistAdded");
            }
            else
            {
                Response.Redirect("Login.aspx?status=pleaseSignIn");
            }
        }

    }
}