﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class CheckOut : System.Web.UI.Page
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
    }
}