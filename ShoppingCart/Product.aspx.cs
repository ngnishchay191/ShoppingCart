using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart.Models;
using ShoppingCart.DataAccessLayer;

namespace ShoppingCart
{
    public partial class Product : System.Web.UI.Page
    {

        //btnBuyClick_Click

        protected void btnBuyClick_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["pid"] = row.Cells[0].Text;
            //Response.Write("Product ID:" + Session["pid"]);
            txtcid.Text = Session["cid"].ToString();
            txtCartpid.Text = row.Cells[0].Text;
            txtCartcid.Text = Session["cid"].ToString();
            txtCartPrice.Text = row.Cells[2].Text;
            txtCartstock.Text = row.Cells[3].Text;


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                txtcid.Text = Session["cid"].ToString();
            }

        }

        protected void btnCalculateAmount_Click(object sender, EventArgs e)
        {
            decimal amount = 0;
            if(txtCartPrice.Text=="" || txtCartqty.Text=="")
            {
                output.Text = "Either click buy product above or enter quantity";
            }
            amount = decimal.Parse(txtCartqty.Text) * decimal.Parse(txtCartPrice.Text);
            txtCarttamt.Text = amount.ToString();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            if(int.Parse(txtCartqty.Text) > int.Parse(txtCartstock.Text))
            {
                output.Text = "Quantity is more than the available stock";
                return;
            }
            else if((!rbCard.Checked) && (!rbCash.Checked))
            {
                output.Text = "Please select a payment option";
                return;
            }        
            try
            {
                OrderModel om = new OrderModel();
                //om.CustomerId = int.Parse(Session["cid"].ToString());
                om.CustomerId = int.Parse(txtCartcid.Text);
                om.TotalAmount = decimal.Parse(txtCartqty.Text) * decimal.Parse(txtCartPrice.Text);
                om.ProductId = int.Parse(txtCartpid.Text);
                om.Quantity = int.Parse(txtCartqty.Text);
                if (rbCard.Checked) om.PaymentMode = rbCard.Text;
                else if (rbCash.Checked) om.PaymentMode = rbCash.Text;
                DBMethods db = new DBMethods();
                var res = db.InsertOrder(om);
                if (res > 0)
                    output.Text = "Order Placed, Order ID: "+res;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                output.Text = ex.Message;
            }
        }
    }
}