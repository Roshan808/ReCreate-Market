using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReCreate_market
{
    public partial class Userlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["UPWD"] != null)
                {
                    TextBox1.Text = Request.Cookies["UNAME"].Value;
                    TextBox2.Text = Request.Cookies["UPWD"].Value;
                    CheckBox1.Checked = true;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("Select * from tblUsers1 where Username=@username and Password=@Password", con);
                cmd.Parameters.AddWithValue("@username", TextBox1.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    if (CheckBox1.Checked)
                    {
                        // Set cookies if "Remember Me" is checked
                        Response.Cookies["UNAME"].Value = TextBox1.Text;
                        Response.Cookies["UPWD"].Value = TextBox2.Text;
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        // Remove cookies if "Remember Me" is not checked
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    String Utype = dt.Rows[0][10].ToString().Trim();

                    if (Utype == "Admin")
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                    else
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                }
                else
                {
                    // Invalid credentials, clear the fields
                    clr();
                               
                }

                con.Close();
            }
        }


        private void clr()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox1.Focus();

        }
    }
}