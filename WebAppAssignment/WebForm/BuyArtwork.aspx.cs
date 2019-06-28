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
                SqlDataSource1.SelectCommand = "";
                SqlDataSource1.DataBind();
                Repeater1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from Artwork where artworkCategory='" + txtCategory.Text + "'";
            SqlDataSource1.DataBind();
            Repeater1.DataBind();
        }
    }
}