using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography.X509Certificates;
using System.Drawing;
using System.Security.Cryptography;
using System.Web.DynamicData;
namespace ReCreate_market
{
    public partial class WebForm2 : System.Web.UI.Page
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

                //adding products to grid
                Session["addproduct"] = "false";
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
                    if (Session["Buyitems"] == null)
                    {

                        dr = dt.NewRow();
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where Productid=" + Request.QueryString["id"], conn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        dr["s No"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["Productid"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;


                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = Grandtotal().ToString();
                        Response.Redirect("Addto_Cart.aspx");


                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);
                        SqlDataAdapter da = new SqlDataAdapter("select * from Product where Productid=" + Request.QueryString["id"], scon);
                        DataSet ds = new DataSet();
                        da.Fill(ds);


                        dr["s No"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["Productid"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];

                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                        int Quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int TotalPrice = price * Quantity;
                        dr["ptotalprice"] = TotalPrice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;

                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = Grandtotal().ToString();
                        Response.Redirect("Addto_Cart.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = Grandtotal().ToString();
                    }

                }
            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session[OrderDate] = OrderDate;
            orderid();
        }

        private int Grandtotal()
        {
            DataTable dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int totalprice = 0;
            for (int i = 0; i < nrow; i++)
            {
                int price;
                if (int.TryParse(dt.Rows[i]["ptotalprice"].ToString(), out price))
                {
                    totalprice += price;
                }
                else
                {
                    // Handle the case where the conversion fails
                    // You might want to log a warning or handle it differently based on your requirements
                }
            }
            return totalprice;
        }

        public void orderid()
        {
            string alpha = "abcDefGhijKLmnopqRStuVwxYz123456789";
            Random r = new Random();
            char[] myArray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myArray[i] = alpha[(int)(35 * r.NextDouble())];
            }
            String orderid;
            orderid = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["Orderid"] = orderid;

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];

            int rowIndex = e.RowIndex;

            // Delete the row from the DataTable based on the row index
            dt.Rows.RemoveAt(rowIndex);

            // Reassign serial numbers for the remaining rows
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["s No"] = i + 1;
            }

            Session["buyitems"] = dt;
            GridView1.DataSource = dt;
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