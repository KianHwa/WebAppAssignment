using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class PaymentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                SqlDataSource1.SelectCommand = "select distinct Payment.paymentID, Payment.paymentDate, Payment.total from Payment inner join Orders " +
                                               "on Payment.paymentID = Orders.paymentID inner join aspnet_Users on " +
                                               "Orders.UserID = aspnet_Users.UserId where Orders.orderStatus = 'Paid' and " +
                                               "aspnet_Users.UserName = '" + Session["Username"].ToString() + "'";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
            }

        }

        protected void btnViewDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("PaymentHistoryDetails.aspx?paymentID=" + btn.CommandArgument);
        }
    }
}