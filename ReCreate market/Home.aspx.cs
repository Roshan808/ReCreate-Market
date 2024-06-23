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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";

            // Check if the user is logged in (using a session variable as an example)
            if (Session["Username"] != null)
            {
                lblsuccess.Text = "Login success, Welcome " + Session["Username"].ToString();
            }
            else
            {
                Response.Redirect("~/Userlogin.aspx");
            }
            if (!IsPostBack)
            {
                // Assuming you have a method to fetch data from the database
                // and return it as a DataTable or List of objects
                DataTable productsData = GetProductsDataFromDatabase();
                DataTable productsData2 = GetProductsDataFromDatabase2();



                // Bind the data to the Repeater control
                ProductRepeater.DataSource = productsData;
                ProductRepeater.DataBind();

                Repeater1.DataSource = productsData2;
                Repeater1.DataBind();

            }




        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";
            if (e.CommandName == "AddToCart")
            {
                DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
                Response.Redirect("Addto_Cart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
            }
        }

        private DataTable GetProductsDataFromDatabase()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP 4 Pimage, Price, PName FROM Product", con);
            DataTable productsData = new DataTable();
            adapter.Fill(productsData);
            return productsData;
        }

        private DataTable GetProductsDataFromDatabase2()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP 4 Pimage, Price, PName FROM Product2", con);
            DataTable productsData2 = new DataTable();
            adapter.Fill(productsData2);
            return productsData2;
        }

        
    }
}
