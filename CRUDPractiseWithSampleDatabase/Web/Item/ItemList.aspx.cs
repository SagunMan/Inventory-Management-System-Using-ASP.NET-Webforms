using CRUDPractiseWithSampleDatabase.BLL.Manager;
using CRUDPractiseWithSampleDatabase.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDPractiseWithSampleDatabase.Web
{
    public partial class ItemList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();

                if(Request.QueryString !=null)
                {
                    if (Request.QueryString["edit"] == "True")
                    {
                        lblerrormsg.Text = "Updated Successfully..";
                        lblerrormsg.ForeColor = System.Drawing.Color.Green;
                    }
                    if (Request.QueryString["status"] == "True")
                    {
                        lblerrormsg.ForeColor = System.Drawing.Color.Green;
                        lblerrormsg.Text = "Item Added successfully.";
                    }
                }
            }
        }

        protected void BindGridView()
        {
            GridView1.DataSource = ItemManager.GetAllItemDetails();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                ItemOrProduct obj = new ItemOrProduct();
                obj.ItemID = new Guid(hdnUserId.Value);
                obj.Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
                obj.PurchasePrice = decimal.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text);
                obj.SalesPrice = decimal.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3")).Text);
                obj.OpeningQty = double.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text);

                bool status = ItemManager.EditItem(obj);

                if (status)
                {
                    bool edit = true;
                    Response.Redirect("ItemList.aspx?edit="+edit);
                }
                else
                {
                    lblerrormsg.Text = "Editing Failed.";
                }
                
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddItem");
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("ItemList");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                ItemManager.DeleteItemDetails(new Guid(hdnUserId.Value));
            }
            BindGridView();
        }

    }
}