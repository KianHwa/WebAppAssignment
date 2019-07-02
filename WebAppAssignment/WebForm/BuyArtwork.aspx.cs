using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class BuyArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                SqlDataSource3.SelectCommand = "Select * from Artwork";
                SqlDataSource3.DataBind();
                Repeater1.DataBind();
            }
        }

        protected void filter_SelectedIndexChanged(object sender, EventArgs e)
        {
            String query = "Select * from Artist inner join Artwork on Artist.artistID = Artwork.artistID where ";
            int counter = 0;
            if (!ddlCategory.SelectedItem.Text.Equals("Select a category"))
            {
                if (counter == 0)
                {
                    query += "Artwork.artworkCategory ='" + ddlCategory.Text + "' ";
                    counter = 1;
                }
                else
                {
                    query += "and Artwork.artworkCategory ='" + ddlCategory.Text + "' ";
                }
            }
            if (!ddlPrice.SelectedItem.Text.Equals("Select a price range"))
            {
                if (counter == 0)
                {
                    query += "Artwork.artworkPrice between 10 and 20000 ";
                    counter = 2;
                }
                else
                {
                    query += "and Artwork.artworkPrice between 10 and 20000 ";
                }
            }
            if (!ddlArtist.SelectedItem.Text.Equals("Select an artist"))
            {
                if (counter == 0)
                {
                    query += "Artist.artistName ='" + ddlArtist.Text + "' ";
                    counter = 3;
                }
                else
                {
                    query += "and Artist.artistName ='" + ddlArtist.Text + "' ";
                }
            }
            if (counter == 0)
            {
                query = "Select * from Artwork";
            }

            SqlDataSource3.SelectCommand = query;
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }

        protected void txtSearchArtwork_TextChanged(object sender, EventArgs e)
        {
            String search = txtSearchArtwork.Text;
            SqlDataSource3.SelectCommand = "Select * from Artwork where artworkName like '%" + search + "%' or lower(artworkName) like '%" + search + "%' or upper(artworkName) like '%" + search + "%'"; 
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }

        protected void txtSearch_Click(object sender, EventArgs e)
        {
            String search = txtSearchArtwork.Text;
            SqlDataSource3.SelectCommand = "Select * from Artwork where artworkName like '%" + search + "%'";
            SqlDataSource3.DataBind();
            Repeater1.DataBind();
        }
    }
}