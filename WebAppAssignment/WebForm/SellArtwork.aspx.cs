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
    public partial class SellArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (artworkUpload.PostedFile != null)
            {
                String artworkName = txtArtworkName.Text;
                String artworkCategory = ddlArtworkCat.SelectedItem.Text;
                float artworkPrice = float.Parse(txtArtworkPrice.Text);


                String imageFile = Path.GetFileName(artworkUpload.PostedFile.FileName);
                artworkUpload.SaveAs(HttpContext.Current.Server.MapPath("../Images/" + imageFile));
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                conn.Open();
                String imageQuery = "insert into Artwork (artworkName, artistID, artworkPrice, artworkCategory, artworkURL) values ('" + artworkName + "','" + Session["UserId"].ToString() + "'," + artworkPrice + ",'" + artworkCategory +  "','../Images/" + imageFile + "')";
                SqlCommand cmd = new SqlCommand(imageQuery, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

            }
        }
    }
}