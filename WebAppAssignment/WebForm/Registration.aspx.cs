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

        protected void StepNextButton_Click(object sender, EventArgs e)
        {
           
        }

        protected void CreateUserWizard1_ContinueButtonClick1(object sender, EventArgs e)
        {
            
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            TextBox txBox = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
            Roles.AddUserToRole(txBox.Text,"Member");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}