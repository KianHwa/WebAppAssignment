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
            if(IsPostBack == false)
            {
                if (!Roles.RoleExists("Member"))
                {
                    Roles.CreateRole("Member");
                }
                else if (!Roles.RoleExists("Artist"))
                {
                    Roles.CreateRole("Artist");
                }
            }
        }

        protected void CreateUserWizard1_ContinueButtonClick1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            SqlCommand cmd;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();

            conn.Open();
            Guid userID = new Guid();
            cmd = new SqlCommand("select top(1) UserId from aspnet_Membership order by UserId desc", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                userID = (Guid)reader.GetValue(0);
            }
            conn.Close();

            TextBox tbAddress = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtAddress");
            String userProfileSql = "insert into UserProfile (UserId,address) values ('" + userID + "','" + tbAddress.Text + "')";

            //Insert into UserProfile table
            cmd = new SqlCommand(userProfileSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(userProfileSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            /*TextBox txBox = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
            Roles.AddUserToRole(txBox.Text,"Member");*/
        }

        protected void CreateUserWizard1_CreatedUser1(object sender, EventArgs e)
        {

        }

        protected void StepNextButton_Click(object sender, EventArgs e)
        {

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

        }
    }
}