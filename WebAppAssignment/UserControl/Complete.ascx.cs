using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Complete : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm/Homepage.aspx");
        }
            
        protected void btnGoToShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("../WebForm/BuyArtwork.aspx");
        }
    }
}