﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.WebForm
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            String masterPage = Request.QueryString["status"];
            if (masterPage != null)
            {
                if (masterPage.Equals("loggedIn"))
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
}