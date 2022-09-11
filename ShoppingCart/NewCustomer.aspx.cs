using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart.DataAccessLayer;
using ShoppingCart.Models;

namespace ShoppingCart
{
    public partial class NewCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                DBMethods db = new DBMethods();
                CustomerModel m = new CustomerModel();
                m.CustName = txtname.Text;
                m.MobNo = long.Parse(txtmobno.Text);
                m.CustAddress = txtaddr.Text;
                m.Email = txtemail.Text;
               
                m.Password = txtpass.Text;
                var res = db.InsertCustomer(m);
                if (res > 0)
                    output.Text = "New CustomerID is :" + res;
            }
            catch (Exception ex)
            {
                output.Text = ex.Message;
            }
        }
    }
}