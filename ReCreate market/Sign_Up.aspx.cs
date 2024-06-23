using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

namespace ReCreate_market
{
    public partial class Sign_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupbtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (isformvalid() )
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RecreateMarketDB"].ConnectionString))
                    {
                        con.Open();

                        string query = "INSERT INTO tblUsers1(Username, Password, Email, Date, ContNum, State, City, PinCode, Address, Usertype) VALUES (@Username, @Password, @Email, @Date, @ContNum, @State, @City, @PinCode, @Address,'User')";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            // Use parameters to prevent SQL injection
                            cmd.Parameters.AddWithValue("@Username", txtUname.Text);
                            cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@Date", DOB.Text);
                            cmd.Parameters.AddWithValue("@ContNum", ContNum1.Text);
                            cmd.Parameters.AddWithValue("@State", DropDownList1.Text);
                            cmd.Parameters.AddWithValue("@City", city.Text);
                            cmd.Parameters.AddWithValue("@PinCode", pin.Text);
                            cmd.Parameters.AddWithValue("@Address", Add.Text);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            clr();
                            con.Close();

                            if (rowsAffected > 0)
                            {
                                Response.Write("<script> alert('Registration Successfully done');  </script>");
                            }
                            else
                            {
                                // Handle the case where no rows were affected (insert failed)
                                Response.Write("<script> alert('Registration failed');  </script>");
                            }
                        }
                    }
                    Response.Redirect("~/Userlogin.aspx");

                }
                
            }
            catch (Exception ex)
            {
                // Log or handle the exception appropriately
                Response.Write("<script> alert('An error occurred during registration');  </script>");
            }

        }
        private bool isformvalid()
        {
            if (txtUname.Text == "")
            {
                Response.Write("<script> alert('username not valid');  </script>");
                txtUname.Focus();

                return false;
            }
            else if (txtPass.Text == "")
            {
                Response.Write("<script> alert('Password not valid');  </script>");
                txtPass.Focus();
                return false;
            }
            else if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Email not valid');  </script>");
                txtEmail.Focus();
                return false;
            }
            else if (DOB.Text == "")
            {
                Response.Write("<script> alert('Date of birth not valid');  </script>");
                DOB.Focus();
                return false;
            }
            else if (ContNum1.Text == "")
            {
                Response.Write("<script> alert('Contact num not valid');  </script>");
                ContNum1.Focus();
                return false;
            }
            else if (DropDownList1.Text == "")
            {
                Response.Write("<script> alert('State not valid');  </script>");
                DropDownList1.Focus();
                return false;
            }
            else if (city.Text == "")
            {
                Response.Write("<script> alert('City name not valid');  </script>");
                city.Focus();
                return false;
            }
            else if (pin.Text == "")
            {
                Response.Write("<script> alert('Pin is not valid');  </script>");
                pin.Focus();
                return false;
            }
            else if(Add.Text == "")
            {
                Response.Write("<script> alert('Address not valid');  </script>");
                Add.Focus();
                return false;
            }

            return true;
        }
        private void clr()
        {
            txtUname.Text = string.Empty;
            txtPass.Text = string.Empty;
            DOB.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ContNum1.Text = string.Empty;
            DropDownList1.Text = string.Empty;
            city.Text = string.Empty;
            pin.Text = string.Empty;
            Add.Text = string.Empty;

        }
    }
    


}