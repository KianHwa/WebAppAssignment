using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class MemberProfile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * from aspnet_Users inner join UserProfile on aspnet_Users.UserId = UserProfile.UserId inner " +
                                           "join aspnet_UsersInRoles on aspnet_Users.UserId = aspnet_UsersInRoles.UserId inner " +
                                           "join aspnet_Roles on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId where aspnet_Roles.RoleName = '" + Session["Role"].ToString() + "' and aspnet_Users.UserName = '" + Session["UserName"].ToString() + "'";

           
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
            Response.Redirect("Profile.aspx");

        }

        protected void UpdatePicButton1_Click(object sender, EventArgs e)
        {
            FileUpload fp = (FileUpload)fvCustomerProf.FindControl("memberUpload");
            
            if (fp.PostedFile != null)
            {
                
                try
                {
                    String imageMemberFile = Path.GetFileName(fp.PostedFile.FileName);
                    fp.SaveAs(HttpContext.Current.Server.MapPath("../Images/" + imageMemberFile));
                    SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                    conn.Open();
                    String memberImg = "Update UserProfile set UserProfile.profilePicURL = '../Images/" + imageMemberFile + "' from UserProfile inner join aspnet_Users on UserProfile.UserId = aspnet_Users.UserId where aspnet_Users.Username='" + Session["Username"] + "'";
                    SqlCommand cmd = new SqlCommand(memberImg, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("Profile.aspx");
                }
                catch (DirectoryNotFoundException)
                {
                    Label imglbl = (Label)fvCustomerProf.FindControl("noImageLbl");
                    imglbl.Text = "Please select an image to edit.";
                }
            }
            
        }
    }
}