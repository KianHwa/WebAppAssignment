using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.MasterPage
{
    public partial class LoggedInHeader : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from UserProfile inner join aspnet_Users on UserProfile.UserId = aspnet_Users.UserId where aspnet_Users.Username='" + Session["Username"].ToString() + "'";
            SqlDataSource1.DataBind();
            Repeater1.DataBind();

        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}