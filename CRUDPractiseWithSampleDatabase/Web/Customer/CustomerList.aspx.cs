using CRUDPractiseWithSampleDatabase.BLL.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDPractiseWithSampleDatabase.Web
{
    public partial class CustomerList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();

            if (!IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    lblerrormsg.ForeColor = System.Drawing.Color.Green;
                    lblerrormsg.Text = Request.QueryString["status"];
                }
            }
        }

        protected void BindGridView()
        {
            GridView1.DataSource = CustomerManager.GetAllCustomerDetails();
            GridView1.DataBind();
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCustomer.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[this.GridView1.SelectedRow.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                Response.Redirect("~/Web/Customer/AddCustomer.aspx?id="+hdnUserId.Value);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                CustomerManager.DeleteCustomerDetail(int.Parse(hdnUserId.Value));
            }
            BindGridView();
        }
    }
}