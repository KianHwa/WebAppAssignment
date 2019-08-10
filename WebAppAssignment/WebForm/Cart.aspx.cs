using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

                SqlDataSource1.SelectCommand = "Select Artwork.artworkURL, Artwork.artworkName, Artwork.artworkPrice, Orders.orderStatus, Orders.orderDate, OrderDetails.orderQuantity, aspnet_Membership.UserId, Orders.orderID, Artwork.artworkID " +
                                               "from Orders inner join OrderDetails on Orders.orderID = OrderDetails.orderID " +
                                               "join Artwork on OrderDetails.artworkID = Artwork.artworkID join aspnet_Membership on aspnet_Membership.UserId = Orders.UserID " +
                                               "where Orders.UserId ='" + Session["UserID"].ToString() + "' and Orders.orderStatus='Pending'";
                SqlDataSource1.DataBind();
                GridView1.DataBind();

                SqlCommand cmd;
                SqlDataReader reader;
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
                String totalSql = "select Artwork.artworkPrice, OrderDetails.orderQuantity from Artwork inner join OrderDetails on Artwork.artworkID = OrderDetails.artworkID " +
                                     "inner join Orders on OrderDetails.orderID = Orders.OrderID inner " +
                                     "join aspnet_Users on Orders.UserID = aspnet_Users.UserId " +
                                     "where aspnet_Users.UserName ='" + Session["Username"].ToString() + "' and Orders.orderStatus='Pending'";

                double total = 0;
                conn.Open();
                cmd = new SqlCommand(totalSql, conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    total += ((double)reader.GetValue(0) * (int)reader.GetValue(1));
                }
                conn.Close();

                Session["subtotal"] = float.Parse(total.ToString());
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

        protected void RemoveOrderButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            Button btn = (Button)sender;

            String[] orderlistArg = new String[2];
            orderlistArg = btn.CommandArgument.ToString().Split(';');

            String orderID = orderlistArg[0];
            String artworkID = orderlistArg[1];

            String deleteOrderDetailsSql = "delete from OrderDetails where orderID='" + orderID + "' and artworkID ='" + artworkID + "'";
            String deleteOrderSql = "delete from Orders where orderID ='" + orderID + "'";

            conn.Open();
            SqlCommand cmd;
            SqlDataAdapter adapter = new SqlDataAdapter();

            //Delete Order Details Record
            cmd = new SqlCommand(deleteOrderDetailsSql, conn);
            adapter.DeleteCommand = new SqlCommand(deleteOrderDetailsSql, conn);
            adapter.DeleteCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            //Delete Orders Record
            conn.Open();
            cmd = new SqlCommand(deleteOrderSql, conn);
            adapter.DeleteCommand = new SqlCommand(deleteOrderSql, conn);
            adapter.DeleteCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            Response.Redirect("Cart.aspx");
        }

        protected void btnProceedPayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx?step=1");
        }
    }
}