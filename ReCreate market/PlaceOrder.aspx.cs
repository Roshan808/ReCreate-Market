using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReCreate_market
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO PaymentDetails (Fname, Lname, Card_no, Expirey_date, CVV, Billingaddress) VALUES (@Fname, @Lname, @Card_no, @Expirey_date, @CVV, @Billingaddress)", conn);

            cmd.Parameters.AddWithValue("@Fname",TextBox1.Text);
            cmd.Parameters.AddWithValue("@Lname",TextBox2.Text);
            cmd.Parameters.AddWithValue("@Card_no",TextBox3.Text);
            cmd.Parameters.AddWithValue("@Expirey_date",TextBox4.Text);
            cmd.Parameters.AddWithValue("@CVV",TextBox5.Text);
            cmd.Parameters.AddWithValue("@Billingaddress",TextBox6.Text);

            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Payment Successfull');</script>");
            Session["address"] = TextBox6.Text;
            Response.Redirect("Invoice.aspx");


        }
    }
}