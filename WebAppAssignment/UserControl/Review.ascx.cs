using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAssignment.UserControl
{
    public partial class Review : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select Artwork.artworkURL, Artwork.artworkName, Artwork.artworkPrice, Orders.orderStatus, Orders.orderDate, OrderDetails.orderQuantity, aspnet_Membership.UserId, Orders.orderID, Artwork.artworkID " +
                                               "from Orders inner join OrderDetails on Orders.orderID = OrderDetails.orderID " +
                                               "join Artwork on OrderDetails.artworkID = Artwork.artworkID join aspnet_Membership on aspnet_Membership.UserId = Orders.UserID " +
                                               "where Orders.UserId ='" + Session["UserId"].ToString() + "' and Orders.orderStatus='Pending'";
            SqlDataSource1.DataBind();
            Repeater1.DataBind();
        }

        protected void btnContinuePayment_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            SqlDataReader reader;
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\ArtworkGallery.mdf;Integrated Security=SSPI");

            String paymentSql = "insert into Payment(paymentDate,total) values('" + DateTime.Now.ToString("MM/dd/yyyy") + "','" + float.Parse(Session["subtotal"].ToString()) + "')";
            cmd = new SqlCommand(paymentSql, conn);
            conn.Open();
            adapter.InsertCommand = new SqlCommand(paymentSql, conn);
            adapter.InsertCommand.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

            //find paymentID
            conn.Open();
            int paymentid = 0;
            cmd = new SqlCommand("select top(1) paymentID from Payment order by paymentID desc", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                paymentid = (int)reader.GetValue(0);
            }
            conn.Close();

            //find orderID
            conn.Open();
            int i = 0;
            int[] orderids = new int[100];
            cmd = new SqlCommand("select Orders.orderID from Orders inner join aspnet_Membership on Orders.UserId = aspnet_Membership.UserId where Orders.UserId='" + Session["UserId"].ToString() + "' and Orders.orderStatus='Pending'", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //orderid = 
                orderids[i] = (int)reader.GetValue(0);
                i++;
            }
            conn.Close();


            for(int j=0; j<=i; j++)
            {
                //update paymentID to order table
                String orderPaymentID = "update Orders set paymentID ='" + paymentid + "',orderStatus='Paid' " + "where orderID ='" + orderids[j] + "'";

                conn.Open();
                cmd = new SqlCommand(orderPaymentID, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                //Decrease artwork quantity after purchased
                String updateQty = "update Artwork set Artwork.artworkStock = (Artwork.artworkStock - OrderDetails.orderQuantity) " +
                                       "from Artwork inner join OrderDetails on Artwork.artworkID = OrderDetails.artworkID " +
                                       "inner join Orders on Orders.orderID = OrderDetails.orderID " + 
                                       "where OrderDetails.orderID ='" + orderids[j] + "' and Orders.orderStatus='Paid'";
                conn.Open();
                cmd = new SqlCommand(updateQty, conn);
                adapter.UpdateCommand = new SqlCommand(updateQty, conn);
                adapter.UpdateCommand.ExecuteNonQuery();

                cmd.Dispose();
                conn.Close();
            }


            //send receipt
            String artworkname = "";
            double artworkprice = 0.00;
            int qty = 0;
            int paymentID = 0;
            DateTime paymentdate = new DateTime();

            String receiptMsg = "";
            conn.Open();
            cmd = new SqlCommand("select Artwork.artworkName, Artwork.artworkprice, OrderDetails.orderQuantity, Payment.paymentID, Payment.paymentDate from Artwork inner join OrderDetails on " +
                                               "Artwork.artworkID = OrderDetails.artworkID inner join Orders on " +
                                               "OrderDetails.orderID = Orders.orderID inner join aspnet_Users on " +
                                               "Orders.UserID = aspnet_Users.UserId inner join Payment on " +
                                               "Payment.paymentID = Orders.paymentID " +
                                               "where Payment.paymentID='" + paymentid + "'", conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                artworkname = (String)reader.GetValue(0);
                artworkprice = (Double)reader.GetValue(1);
                qty = (int)reader.GetValue(2);
                paymentID = (int)reader.GetValue(3);
                paymentdate = (DateTime)reader.GetValue(4);

                receiptMsg += "<tr>" +
                               "<td style=\"border: 1px solid #d9d9d9\">" + artworkname + "</td>" +
                               "<td style=\"border: 1px solid #d9d9d9\">" + qty + "</td>" +
                               "<td style=\"border: 1px solid #d9d9d9\">" + artworkprice + "</td>" +
                               "</tr>";
            }
            conn.Close();

            try
            {
                MailMessage mailmessage = new MailMessage();
                mailmessage.From = new MailAddress("artisticsdnbhd@gmail.com");
                String email = "jasonthemember@gmail.com";
                mailmessage.To.Add(email);
                mailmessage.Subject = "E-receipt";
                mailmessage.IsBodyHtml = true;
                mailmessage.Body = "<div style= \"width:70%;\">" +
                                   "<div style =\"width:70%;\">" +
                                   "<h2 style=\"text-align:center\" > Your Receipt </h2>" +
                                   "<p style=\"text-align:center\"> Here is your E - receipt.Please keep it somewhere safe,<br/> just in case you need to talk about us</p>" +
                                   "</div>" +
                                   "<div>" +
                                   "<table style =\"width:70%;>" +
                                   "<tr>" +
                                   "<th style =\"width:100%;text-align:left\">" + paymentID + "</th>" +
                                   "<th style =\"width:100%;text-align:right\">" + paymentdate + "</th>" +
                                   "</tr >" +
                                   "<tr >" +
                                   "<td style =\"width:70%;text-align:left\">1</td>" +
                                   "<td style =\"width:70%;text-align:right;\" > 1 / 1 / 1999 </td>" +
                                   "</tr>" +
                                   "</table>" +
                                   "<table style = \"width:70%;text-align:center;padding:10px;border-collapse:collapse\">" +
                                   "<tr>" +
                                   "<th style = \"width:40%;border:3px solid #d9d9d9\"> Artwork Name </th>" +
                                   "<th style = \"width:40%;border:3px solid #d9d9d9\"> Quantity </th>" +
                                   "<th style = \"width:40%;border:3px solid #d9d9d9\"> Artwork Price (RM) </th>" +
                                   "</tr>" +
                                   receiptMsg + 
                                   "<tr>" +
                                   "<td ></td>" +
                                   "<td > Total </td>" +
                                   "<td> 100 </td>" +
                                   "</tr>" +
                                   "</table>" +
                                   "</div>" +
                                   "</div>"; 

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("artisticsdnbhd@gmail.com", "Artistic12345");
                smtpClient.Send(mailmessage);
            }
            catch (Exception)
            {

            }

            Response.Redirect("CheckOut.aspx?step=4");
        }
    }
}