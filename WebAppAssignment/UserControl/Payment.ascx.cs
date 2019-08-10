using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Payment : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           foreach(ListItem item in rblCard.Items)
            {
                item.Attributes.Add("class","cardimg");
            }
        }

        protected void btnContinuePayment_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx?step=3");
        }
      
    }
}