using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            TextBox tbQty = (TextBox)FormView1.FindControl("txtQty");

            SqlCommand cmd;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");
            String ordersSql = "insert into Orders (orderStatus,UserId,orderDate) values('Pending','" + Session["UserId"].ToString() + "','07-06-2019')";

            //Insert into Order table
            cmd = new SqlCommand(ordersSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(ordersSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            //Find order ID
            conn.Open();
            int orderid = 0;
            cmd = new SqlCommand("select top(1) orderID from Orders order by orderID desc", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                orderid = (int)reader.GetValue(0);
            }
            conn.Close();

            //Insert into Associative Table (OrderDetails Table)
            String orderDetailsSql = "insert into OrderDetails (orderID, artworkID,orderQuantity) select o.orderID, a.artworkID," + Convert.ToInt32(tbQty.Text) + " from Orders o cross join Artwork a where o.orderID ='" + orderid + "' and a.artworkID = " + btn.CommandArgument;
            cmd = new SqlCommand(orderDetailsSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(orderDetailsSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            Response.Redirect("BuyArtwork.aspx?status=orderAdded");
        }
    }
}