using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace ReCreate_market
{
    public partial class Addto_cart2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }

                Session["addproduct"] = "false";

                LoadProducts("Product2");
            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session[OrderDate] = OrderDate;
            orderid();
        }

        private void LoadProducts(string Product)
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("s No");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("ptotalprice");

            if (Request.QueryString["id"] != null)
            {
                dr = dt.NewRow();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM " + Product + " WHERE Prod_id = @ProdId", conn);
                da.SelectCommand.Parameters.AddWithValue("@ProdId", Request.QueryString["id"]);
                DataSet ds = new DataSet();
                da.Fill(ds);

                dr["s No"] = 1;
                dr["pid"] = ds.Tables[0].Rows[0]["Prod_id"].ToString();
                dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                dr["pquantity"] = Request.QueryString["quantity"];

                decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["Price"]);
                int Quantity = Convert.ToInt32(Request.QueryString["quantity"]);
                decimal TotalPrice = price * Quantity;

                dr["ptotalprice"] = TotalPrice;

                dt.Rows.Add(dr);
            }
            else
            {
                // Handle loading products from database without query string parameters
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM " + Product, conn);
                DataSet ds = new DataSet();
                da.Fill(ds);

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    dr = dt.NewRow();
                    dr["s No"] = dt.Rows.Count + 1;
                    dr["pid"] = row["Prod_id"].ToString();
                    dr["pname"] = row["Pname"].ToString();
                    dr["pimage"] = row["Pimage"].ToString();
                    dr["pprice"] = row["Price"].ToString();
                    dr["pquantity"] = "1"; // Default quantity can be set here

                    dt.Rows.Add(dr);
                }
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["buyitems"] = dt;

            if (GridView1.Rows.Count > 0)
            {
                GridView1.FooterRow.Cells[5].Text = "Total Amount";
                GridView1.FooterRow.Cells[6].Text = Grandtotal().ToString();
            }
        }


        private decimal Grandtotal()
        {
            DataTable dt = (DataTable)Session["buyitems"];
            decimal grandTotal = 0;

            foreach (DataRow row in dt.Rows)
            {
                // Check if the value is DBNull before converting
                if (row["ptotalprice"] != DBNull.Value)
                {
                    decimal totalprice = Convert.ToDecimal(row["ptotalprice"]);
                    grandTotal += totalprice;
                }
            }

            return grandTotal;
        }




        public void orderid()
        {
            string alphaNumeric = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            Random random = new Random();
            string orderId = "Order_Id_" + DateTime.Now.ToString("yyyyMMddHHmmss") + new string(Enumerable.Repeat(alphaNumeric, 5).Select(s => s[random.Next(s.Length)]).ToArray());
            Session["Orderid"] = orderId;
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["buyitems"]; // Get the DataTable from session

            int rowIndex = e.RowIndex;
            dt.Rows.RemoveAt(rowIndex); // Remove the row at the specified index

            // Reassign serial numbers for the remaining rows
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["s No"] = i + 1;
            }

            Session["buyitems"] = dt; // Update the DataTable in session

            GridView1.DataSource = dt; // Bind the updated DataTable to the GridView
            GridView1.DataBind();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt;
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
                scon.Open();
                SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid, sno, productid, productname, price, quantity, orderdate) values('" + Session["Orderid"] + "'," + dt.Rows[i]["s No"] + ",'" + dt.Rows[i]["pid"] + "','" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + Session["Orderdate"] + "')", scon);


                cmd.ExecuteNonQuery();
                scon.Close();
            }

            //If Session is Null Redirecting to login else Placing the order
            if (Session["username"] == null)
            {

                Response.Redirect("Userlogin.aspx");
            }
            else
            {

                if (GridView1.Rows.Count.ToString() == "0")
                {
                    Response.Write("<script>alert('Your Cart is Empty. You cannot place an  Order'); </ script > ");
                }
                else
                {

                    Response.Redirect("PlaceOrder.aspx");
                }

            }

        }

    }
}
