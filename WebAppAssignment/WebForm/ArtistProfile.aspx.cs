using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment
{
    public partial class ArtistProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object fvArtistProfile_GetItem(int id)
        {
            return null;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void fvArtistProfile_UpdateItem(int id)
        {

        }
    }
}