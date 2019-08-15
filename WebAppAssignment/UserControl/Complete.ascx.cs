using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Complete : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                SqlCommand cmd;
                SqlDataReader reader;
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                //Find payment ID
                conn.Open();
                int paymentid = 0;
                cmd = new SqlCommand("select top(1) paymentID from Payment order by paymentID desc", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    paymentid = (int)reader.GetValue(0);
                }
                conn.Close();

                SqlDataSource1.SelectCommand = "select Artwork.artworkName, Artwork.artworkprice, OrderDetails.orderQuantity from Artwork inner join OrderDetails on " +
                                               "Artwork.artworkID = OrderDetails.artworkID inner join Orders on " +
                                               "OrderDetails.orderID = Orders.orderID inner join aspnet_Users on " +
                                               "Orders.UserID = aspnet_Users.UserId inner join Payment on " +
                                               "Payment.paymentID = Orders.paymentID " +
                                               "where Payment.paymentID='" + paymentid + "'";
                SqlDataSource1.DataBind();
                Repeater1.DataBind();
            }
            

        }

        protected void btnGoToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm/Homepage.aspx");
        }
            
        protected void btnGoToShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm/BuyArtwork.aspx");
        }
    }
}