using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Review : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select Artwork.artworkURL, Artwork.artworkName, Artwork.artworkPrice, Orders.orderStatus, Orders.orderDate, OrderDetails.orderQuantity, aspnet_Membership.UserId, Orders.orderID, Artwork.artworkID " +
                                               "from Orders inner join OrderDetails on Orders.orderID = OrderDetails.orderID " +
                                               "join Artwork on OrderDetails.artworkID = Artwork.artworkID join aspnet_Membership on aspnet_Membership.UserId = Orders.UserID " +
                                               "where Orders.UserId ='" + Session["UserId"].ToString() + "' and Orders.orderStatus='Pending'";
            SqlDataSource1.DataBind();
            Repeater1.DataBind();
        }

        protected void btnContinuePayment_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

            String paymentSql = "insert into Payment(paymentDate,total) values('" + DateTime.Now.ToString("MM/dd/yyyy") + "','" + float.Parse(Session["subtotal"].ToString()) + "')";
            cmd = new SqlCommand(paymentSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(paymentSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            //find paymentID
            conn.Open();
            int paymentid = 0;
            cmd = new SqlCommand("select top(1) paymentID from Payment order by paymentID desc", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                paymentid = (int)reader.GetValue(0);
            }
            conn.Close();

            //find orderID
            conn.Open();
            int i = 0;
            int[] orderids = new int[100];
            cmd = new SqlCommand("select Orders.orderID from Orders inner join aspnet_Membership on Orders.UserId = aspnet_Membership.UserId where Orders.UserId='" + Session["UserId"].ToString() + "' and Orders.orderStatus='Pending'", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //orderid = 
                orderids[i] = (int)reader.GetValue(0);
                i++;
            }
            conn.Close();


            for(int j=0; j<=i; j++)
            {
                //update paymentID to order table
                String orderPaymentID = "update Orders set paymentID ='" + paymentid + "',orderStatus='Paid' " + "where orderID ='" + orderids[j] + "'";

                conn.Open();
                cmd = new SqlCommand(orderPaymentID, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                //Decrease artwork quantity after purchased
                String updateQty = "update Artwork set Artwork.artworkStock = (Artwork.artworkStock - OrderDetails.orderQuantity) " +
                                       "from Artwork inner join OrderDetails on Artwork.artworkID = OrderDetails.artworkID " +
                                       "inner join Orders on Orders.orderID = OrderDetails.orderID " + 
                                       "where OrderDetails.orderID ='" + orderids[j] + "' and Orders.orderStatus='Paid'";
                conn.Open();
                cmd = new SqlCommand(updateQty, conn);
                adapter.UpdateCommand = new SqlCommand(updateQty, conn);
                adapter.UpdateCommand.ExecuteNonQuery();

                cmd.Dispose();
                conn.Close();
            }


            Session.Remove("subtotal");

            Response.Redirect("CheckOut.aspx?step=4");
        }
    }
}