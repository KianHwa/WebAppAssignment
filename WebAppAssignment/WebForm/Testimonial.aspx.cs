using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Testimonial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
              
                

                Session["Username"] = "Ali";
                Session["UserID"] = "e1f44526-dce3-4b11-99e3-c2be25d96473";
            }
        }
    }
}