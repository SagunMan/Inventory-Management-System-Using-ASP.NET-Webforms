using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CRUDPractiseWithSampleDatabase.DLL;
using CRUDPractiseWithSampleDatabase.BLL.Manager;

namespace CRUDPractiseWithSampleDatabase.Web
{
    public partial class AddItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(nameTxtBox.Text))
            {
                lblerrormsg.Text = "Name cannot be empty.";
                nameTxtBox.Focus();
                return;
            }

            if (string.IsNullOrEmpty(ppriceTxtBox.Text))
            {
                lblerrormsg.Text = "Purchase price cannot be empty.";
                ppriceTxtBox.Focus();
                return;
            }

            if (string.IsNullOrEmpty(spriceTxtBox.Text))
            {
                lblerrormsg.Text = "Sales price cannot be empty.";
                spriceTxtBox.Focus();
                return;
            }

            if (string.IsNullOrEmpty(qtyTxtBox.Text))
            {
                lblerrormsg.Text = "Quantity cannot be empty.";
                qtyTxtBox.Focus();
                return;
            }
            
            ItemOrProduct obj = new ItemOrProduct();
            obj.ItemID = Guid.NewGuid();
            obj.Name = nameTxtBox.Text;
            obj.PurchasePrice = decimal.Parse(ppriceTxtBox.Text);
            obj.SalesPrice = decimal.Parse(spriceTxtBox.Text);
            obj.OpeningQty = double.Parse(qtyTxtBox.Text);

            bool status = ItemManager.AddItem(obj);

            if (status)
            {
                bool message = true;
                Response.Redirect("~/Web/Item/ItemList.aspx?status=" + message);
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            nameTxtBox.Text = "";
            ppriceTxtBox.Text = "";
            spriceTxtBox.Text = "";
            qtyTxtBox.Text = "";
        }
    }
}