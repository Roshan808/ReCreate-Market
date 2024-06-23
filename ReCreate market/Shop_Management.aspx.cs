using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ReCreate_market
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }

        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
       

        void LoadRecord()
        {
            SqlCommand cmd = new SqlCommand("select Prod_id,Pname,Pdesc,Price from Product;", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update Product set Pname='" + TextBox2.Text + "',Pdesc='" + TextBox3.Text + "',Price='" + TextBox4.Text + "' where Prod_id='" + int.Parse(TextBox1.Text) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            clr();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesfully inserted row')", true);
            LoadRecord();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete Product  where Prod_id='" + int.Parse(TextBox1.Text) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            clr();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Succesfully Deleted row')", true);
            LoadRecord();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Product where Prod_id='" + int.Parse(TextBox1.Text) + "'", con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "Imeges/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Imeges/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Product VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + filepath + "','" + TextBox4.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                clr();

                // Show alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data successfully inserted');", true);


            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Product where Prod_id='" + int.Parse(TextBox1.Text) + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                TextBox2.Text = reader.GetValue(1).ToString();
                TextBox3.Text = reader.GetValue(2).ToString();
                TextBox4.Text = reader.GetValue(4).ToString();
                FileUpload1.ID = reader.GetValue(3).ToString();
            }
            con.Close();

        }

        private void clr()
        {
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox3.Text = string.Empty;

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            LoadRecord();
            clr();
        }
    }
}