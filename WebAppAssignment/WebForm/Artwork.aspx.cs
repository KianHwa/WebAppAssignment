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
            if (Session["Username"] != null)
            {
                Button btn = (Button)sender;
                TextBox tbQty = (TextBox)FormView1.FindControl("txtQty");

                SqlCommand cmd;
                SqlDataReader reader;
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                //check duplicate Order
                conn.Open();
                int duplicateOrder = 0;
                int orderID = 0;
                int orderQty = 0;
                int artworkStock = 0;
                cmd = new SqlCommand("select OrderDetails.artworkID, OrderDetails.OrderID, OrderDetails.orderQuantity from OrderDetails inner join Orders on OrderDetails.orderID = Orders.orderID " +
                                     " inner join aspnet_Users on Orders.UserId = aspnet_Users.UserId where OrderDetails.artworkID=" + btn.CommandArgument + " and aspnet_Users.Username='" + Session["Username"].ToString() + "'", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    orderID = (int)reader.GetValue(1);
                    orderQty = (int)reader.GetValue(2);
                    duplicateOrder++;
                }
                conn.Close();

                //check quantity
                conn.Open();
                cmd = new SqlCommand("Select artworkStock from Artwork where artworkID ='" + btn.CommandArgument + "'", conn);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    artworkStock = (int)reader.GetValue(0);
                }
                conn.Close();

                if (Convert.ToInt32(tbQty.Text) <= artworkStock)
                {
                    if (duplicateOrder == 0)
                    {
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
                    else
                    {
                        String updateQtySql = "update OrderDetails set OrderQuantity =" + Convert.ToInt32(tbQty.Text) + " where orderID ='" + orderID + "'";
                        conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

                        conn.Open();
                        cmd = new SqlCommand(updateQtySql, conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("BuyArtwork.aspx?status=orderAdded");
                    }
                }
                else
                {
                    String artworkID = Request.QueryString["artworkID"];
                    Response.Redirect("Artwork.aspx?status=noStock&artworkID=" + artworkID);
                }
            }
            else
            {
                Response.Redirect("Login.aspx?status=pleaseSignIn");
            }
        }
    }
}