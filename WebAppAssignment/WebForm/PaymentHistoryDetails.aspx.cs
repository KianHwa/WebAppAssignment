using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class PaymentHistoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                SqlDataSource1.SelectCommand = "select Artwork.artworkName, Artwork.artworkprice, OrderDetails.orderQuantity from Artwork inner join OrderDetails on " +
                                   "Artwork.artworkID = OrderDetails.artworkID inner join Orders on " +
                                   "OrderDetails.orderID = Orders.orderID inner join aspnet_Users on " +
                                   "Orders.UserID = aspnet_Users.UserId inner join Payment on " +
                                   "Payment.paymentID = Orders.paymentID " +
                                   "where Payment.paymentID='" + Request.QueryString["paymentID"].ToString() + "'";

                SqlDataSource1.DataBind();
                GridView1.DataBind();
            }
        }
    }
}