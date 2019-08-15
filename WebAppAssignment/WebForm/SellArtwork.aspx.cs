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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (artworkUpload.PostedFile != null)
                {
                    String artworkName = txtArtworkName.Text;
                    String artworkCategory = ddlArtworkCat.SelectedItem.Text;
                    String artworkDesc = txtArtworkDesc.Text;
                    float artworkPrice = float.Parse(txtArtworkPrice.Text);
                    int artworkStock = int.Parse(txtStock.Text);

                    try
                    {
                        String imageFile = Path.GetFileName(artworkUpload.PostedFile.FileName);
                        artworkUpload.SaveAs(HttpContext.Current.Server.MapPath("../Images/" + imageFile));
                        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                        conn.Open();
                        String imageQuery = "insert into Artwork (artworkName, artistID, artworkPrice, artworkCategory, artworkURL, artworkStock, artworkDesc) values ('" + artworkName + "','" + Session["UserId"].ToString() + "'," + artworkPrice + ",'" + artworkCategory + "','../Images/" + imageFile + "','" + artworkStock + "','" + artworkDesc + "')";
                        SqlCommand cmd = new SqlCommand(imageQuery, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    Response.Redirect("SellArtwork.aspx?status=success");
                    }
                    catch (DirectoryNotFoundException)
                    {
                        noImage.Text = "  No artwork is uploaded, please select your artwork";
                        
                        
                    }
                    
            }
                
            }
            
        }
    }