using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * from aspnet_Users inner join UserProfile on aspnet_Users.UserId = UserProfile.UserId inner " +
                                            "join aspnet_UsersInRoles on aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner " +
                                            "join aspnet_Roles on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId where aspnet_Roles.RoleName = '" + Session["Role"].ToString() + "' and aspnet_Users.UserName = '" + Session["UserName"].ToString() + "'";

            SqlDataSource1.DataBind();
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

        protected void UpdateButton_Click(object sender, EventArgs e)
        {


            SqlCommand cmd;
    

            TextBox address = (TextBox)fvCustomerProf.FindControl("addressTxt");
            TextBox phoneNo = (TextBox)fvCustomerProf.FindControl("phoneTxt");
          
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            


            String profileSql = "Update UserProfile set address = '" + address.Text + "', phoneNumber = '" + phoneNo.Text + "' where UserID='" + Session["UserID"].ToString() + "'";
            //update UserProfile
            conn.Open();
            cmd = new SqlCommand(profileSql, conn);
            adapter.UpdateCommand = new SqlCommand(profileSql, conn);
            adapter.UpdateCommand.ExecuteNonQuery();

            cmd.Dispose();
            conn.Close();
            Response.Redirect("CustomerProfile.aspx");

        }

        protected void UpdatePicButton_Click(object sender, EventArgs e)
        {
            FileUpload fp = (FileUpload)fvCustomerProf.FindControl("artistUpload");
            if (fp.PostedFile != null)
            {
                String imageArtistFile = Path.GetFileName(fp.PostedFile.FileName);
                fp.SaveAs(HttpContext.Current.Server.MapPath("../Images/" + imageArtistFile));
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                conn.Open();
                String artistImg = "Update UserProfile set profilePicURL = '../Images/" + imageArtistFile + "'";
                SqlCommand cmd = new SqlCommand(artistImg, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("CustomerProfile.aspx");
            }
        }
    }
}