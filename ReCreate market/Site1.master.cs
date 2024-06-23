using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ReCreate_market
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("Addto_Cart.aspx");
        }

    }
}