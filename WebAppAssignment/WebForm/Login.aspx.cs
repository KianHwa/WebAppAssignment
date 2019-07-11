using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            SqlCommand cmd;
            SqlDataReader reader;

            TextBox tbName = (TextBox)Login1.FindControl("UserName");

            conn.Open();
            Guid userID = new Guid();
            String role = "";
            cmd = new SqlCommand("select aspnet_Users.UserId, aspnet_Roles.RoleName from aspnet_Users inner join aspnet_UsersInRoles on " +
                                 "aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner join aspnet_Roles on " +
                                 "aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId where aspnet_Users.UserName='" + tbName.Text + "'", conn) ;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                userID = (Guid)reader.GetValue(0);
                role = (String)reader.GetValue(1);
            }
            conn.Close();

            Session["UserID"] = userID.ToString();
            Session["Username"] = tbName.Text;
            Session["Role"] = role;

        }
    }
}