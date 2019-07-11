using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Registration2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             }

        protected void btnConfirm_Click(object sender, EventArgs e)
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

            String quote = txtQuote.InnerText;
            String biography = txtBiography.InnerText;

            String userProfileSql = "update UserProfile set quote='" + quote + "',biography='" + biography + "' where userID='" + userID +"'";
            cmd = new SqlCommand(userProfileSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(userProfileSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            Response.Redirect("Login.aspx");
        }

        protected void btnSkip_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}