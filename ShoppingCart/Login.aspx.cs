using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart.DataAccessLayer;
using ShoppingCart.Models;

namespace ShoppingCart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DBMethods db = new DBMethods();
                var res = db.Login(int.Parse(txtid.Text), txtpass.Text);
                output.Text = res;
                if (res == "Success")
                {

                    Session["cid"] = long.Parse(txtid.Text);
                    //FormsAuthentication.RedirectFromLoginPage(txtCId.Text, false);
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception ex)
            {
                output.Text = ex.Message;
            }
        }
    }
}