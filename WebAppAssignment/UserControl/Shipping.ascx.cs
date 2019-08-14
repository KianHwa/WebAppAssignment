using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Shipping : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select aspnet_Membership.Email, aspnet_Users.Username, UserProfile.address, UserProfile.phoneNumber from aspnet_Membership inner join aspnet_Users on aspnet_Membership.UserId = aspnet_Users.UserId inner join " +
                                           "UserProfile on aspnet_Users.UserId = UserProfile.UserId where aspnet_Users.UserName='" + "Ali" + "'";

            SqlDataSource1.DataBind();
            personalInfoFv.DataBind();
        }

        protected void btnContinuePayment_Click(object sender, EventArgs e)
        {
            float total = float.Parse(Request.QueryString["total"].ToString());
            Response.Redirect("CheckOut.aspx?total=" + total + "&step=2");
        }
    }
}