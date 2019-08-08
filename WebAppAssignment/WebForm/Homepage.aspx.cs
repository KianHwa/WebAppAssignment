using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment
{
    public partial class Homepage : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

                SqlDataSource1.SelectCommand = "Select * from Artwork";
                SqlDataSource1.DataBind();
                

            }
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

    }
}   