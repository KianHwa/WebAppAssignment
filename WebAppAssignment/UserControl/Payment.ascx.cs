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

        }

        protected void btnContinuePayment_Click(object sender, EventArgs e)
        {
            float total = float.Parse(Request.QueryString["total"].ToString());
            Response.Redirect("CheckOut.aspx?total=" + total + "&step=3");
        }
    }
}