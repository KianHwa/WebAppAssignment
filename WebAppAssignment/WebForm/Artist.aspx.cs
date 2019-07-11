using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm

{
    public partial class Artist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           SqlDataSource1.SelectCommand = "SELECT aspnet_Users.UserName, UserProfile.profilePicURL, UserProfile.quote FROM aspnet_Users INNER JOIN UserProfile ON aspnet_Users.UserId = UserProfile.UserId inner join aspnet_UsersInRoles on aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner join aspnet_Roles on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId where aspnet_Roles.RoleName = 'Artist'";

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

        protected void btnArt_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect("Testimonial.aspx?name=" + btn.CommandArgument);
        }
    }
}