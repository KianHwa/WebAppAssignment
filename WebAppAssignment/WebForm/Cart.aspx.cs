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
                Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
                SqlDataSource1.SelectCommand = "Select Artwork.artworkURL, Artwork.artworkName, Artwork.artworkPrice, Orders.orderStatus, Orders.orderDate, OrderDetails.orderQuantity, aspnet_Membership.UserId, Orders.orderID, Artwork.artworkID " +
                                               "from Orders inner join OrderDetails on Orders.orderID = OrderDetails.orderID " +
                                               "join Artwork on OrderDetails.artworkID = Artwork.artworkID join aspnet_Membership on aspnet_Membership.UserId = Orders.UserID " +
                                               "where Orders.UserId ='" + Session["UserID"].ToString() + "'";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
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
    }
}