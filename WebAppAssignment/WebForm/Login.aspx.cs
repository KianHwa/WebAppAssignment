using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            TextBox tbUsername = (TextBox)Login1.FindControl("UserName");
            //Session session = new Session();

            if (Session["username"] != null)
            {
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                Response.Redirect("Login");
                Login1.FindControl("lblNotExist");
            }

            // Check for the authentication
            // if(authenticated)
            // {
            //    // Save the user profile/userid in a session.
            //    // Session["loggedInUserId"] = someId;
            // }
        }

    }
}