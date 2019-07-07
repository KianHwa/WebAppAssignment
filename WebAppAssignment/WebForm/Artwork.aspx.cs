using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack == false)
            {
                String artworkID = Request.QueryString["artworkID"];

                SqlDataSource1.SelectCommand = "Select * from Artwork where artworkID ='" + artworkID + "'";
                SqlDataSource1.DataBind();
                FormView1.DataBind();

            }
        }
    }
}