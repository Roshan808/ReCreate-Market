using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReCreate_market
{
    public partial class Seller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString);

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            if (fileUpload.HasFile)
            {
                string filename = fileUpload.PostedFile.FileName;
                string filepath = "Imeges/" + fileUpload.FileName;
                fileUpload.PostedFile.SaveAs(Server.MapPath("~/Imeges/") + filename);

                // Open connection
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString))
                {
                    // Define the SQL query with parameterized values
                    string query = "INSERT INTO Sellers_table (Material, Price, Address, img, Date) VALUES (@Material, @Price, @Address, @img, @Date)";
                    // Open connection and command
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters
                        cmd.Parameters.AddWithValue("@Material", txtMaterial.Text);
                        cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@img", filepath);
                        cmd.Parameters.AddWithValue("@Date", txtDate.Text);

                        // Open the connection, execute the command, and close the connection
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }


                // Show alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data successfully inserted');", true);
            }

        }

    }
}