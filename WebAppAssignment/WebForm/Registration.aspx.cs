using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CreateUserWizard1_ContinueButtonClick1(object sender, EventArgs e)
        {
            

            

        }


        protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
        {
            if (!Roles.RoleExists("Member"))
            {
                Roles.CreateRole("Member");
            }
            else if (!Roles.RoleExists("Artist"))
            {
                Roles.CreateRole("Artist");
            }


            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            SqlCommand cmd;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();


            TextBox tbName = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
            conn.Open();
            Guid userID = new Guid();
            cmd = new SqlCommand("select aspnet_Membership.UserId from aspnet_Membership inner join aspnet_Users on aspnet_Membership.UserId = aspnet_Users.UserId where aspnet_Users.Username='" + tbName.Text + "'", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                userID = (Guid)reader.GetValue(0);
            }
            conn.Close();

            TextBox tbAddress = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtAddress");
            TextBox tbPhone = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtPhoneNumber");
            RadioButtonList rblRole = (RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("rblRole");

            String userProfileSql = "insert into UserProfile (UserId,address,phonenumber) values ('" + userID + "','" + tbAddress.Text + "','" + tbPhone.Text + "')";

            //Insert into UserProfile table
            cmd = new SqlCommand(userProfileSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(userProfileSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            if (rblRole.SelectedItem.Text.Equals("Member"))
            {
                Roles.AddUserToRole(tbName.Text, "Member");
            }
            else
            {
                Roles.AddUserToRole(tbName.Text, "Artist");
            }
        }

        protected void StepNextButton_Click(object sender, EventArgs e)
        {

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

        }
    }
}