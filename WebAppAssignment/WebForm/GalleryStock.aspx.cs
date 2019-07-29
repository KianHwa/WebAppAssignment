using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class GalleryStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "SELECT * from Artwork inner join aspnet_Users on Artwork.artistID = aspnet_Users.UserId inner join UserProfile on aspnet_Users.UserId = UserProfile.UserId inner " +
                                 "join aspnet_UsersInRoles on aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner " +
                                 "join aspnet_Roles on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId where aspnet_Roles.RoleName = '" + Session["Role"].ToString() + "' and aspnet_Users.UserName = '" + Session["UserName"].ToString() + "'";
        }

    }
}