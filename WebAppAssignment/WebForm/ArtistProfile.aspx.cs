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
    public partial class ArtistProfile : System.Web.UI.Page
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
            
            
            TextBox address = (TextBox)fvArtistProf.FindControl("addressTxt");
            TextBox phoneNo = (TextBox)fvArtistProf.FindControl("phoneTxt");
            TextBox quote = (TextBox)fvArtistProf.FindControl("quoteTxt");
            TextBox bio = (TextBox)fvArtistProf.FindControl("bioTxt");
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
           

            String profileSql = "Update UserProfile set address = '" + address.Text + "', phoneNumber = '" + phoneNo.Text + "', quote = '" + quote.Text + "', biography = '" + bio.Text + "' where UserID='" + Session["UserID"].ToString() + "'";
            //update UserProfile
            conn.Open();
            cmd = new SqlCommand(profileSql, conn);
            adapter.UpdateCommand = new SqlCommand(profileSql, conn);
            adapter.UpdateCommand.ExecuteNonQuery();

            cmd.Dispose();
            conn.Close();
            Response.Redirect("ArtistProfile.aspx");

        }

        protected void UpdatePicButton_Click(object sender, EventArgs e)
        {
            FileUpload fp = (FileUpload)fvArtistProf.FindControl("artistUpload");
            if (fp.PostedFile != null)
            {
                String imageArtistFile = Path.GetFileName(fp.PostedFile.FileName);
                fp.SaveAs(HttpContext.Current.Server.MapPath("../Images/" + imageArtistFile));
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                conn.Open();
                String artistImg = "Update UserProfile set UserProfile.profilePicURL = '../Images/" + imageArtistFile + "' from UserProfile inner join aspnet_Users on UserProfile.UserId = aspnet_Users.UserId where aspnet_Users.Username='" + Session["Username"] + "'";
                SqlCommand cmd = new SqlCommand(artistImg, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("ArtistProfile.aspx");
            }
        }
    }
}