using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            if (IsPostBack == false)
            {
                Session["Username"] = "Ali";
                Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            

            SqlCommand cmd;
            TextBox username = (TextBox)fvArtistProf.FindControl("usernameTxt");
            TextBox pic = (TextBox)fvArtistProf.FindControl("pictureTxt");
            TextBox address = (TextBox)fvArtistProf.FindControl("addressTxt");
            TextBox phoneNo = (TextBox)fvArtistProf.FindControl("phoneTxt");
            TextBox quote = (TextBox)fvArtistProf.FindControl("quoteTxt");
            TextBox bio = (TextBox)fvArtistProf.FindControl("bioTxt");
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            String userSql = "Update aspnet_Users set UserName = '" + username.Text + "' where UserID = '" + Session["UserID"].ToString() + "'";
            SqlDataSource1.DataBind();
            fvArtistProf.DataBind();
            //update aspnet_Users
            conn.Open();
            cmd = new SqlCommand(userSql, conn);
            adapter.UpdateCommand = new SqlCommand(userSql, conn);
            adapter.UpdateCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();


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

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object FormView1_GetItem(int id)
        {
            return null;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void FormView1_UpdateItem(int id)
        {

        }
    }
}