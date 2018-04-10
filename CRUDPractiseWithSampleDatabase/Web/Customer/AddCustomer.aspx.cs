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
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addBtn.Text = "Add";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    hdnUserId.Value = Request.QueryString["id"];
                    Customer obj = CustomerManager.GetCustomerByID(int.Parse(hdnUserId.Value));
                    if (obj != null)
                    {
                        nameTxtBox.Text = obj.Name;
                        addressTxtBox.Text = obj.Address;
                        if (obj.Gender == "Male")
                        {
                            MaleRadioButton.Checked = true;
                        }
                        if (obj.Gender == "Female")
                        {
                            FemaleRadioButton.Checked = true;
                        }
                    }
                    addBtn.Text = "Update";
                }
                
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(nameTxtBox.Text))
            {
                lblerrormsg.Text = "Name cannot be empty.";
                nameTxtBox.Focus();
                return;
            }

            if (string.IsNullOrEmpty(addressTxtBox.Text))
            {
                lblerrormsg.Text = "Address cannot be empty.";
                addressTxtBox.Focus();
                return;
            }

            bool isInsert = true;           
            Customer obj = new Customer();

            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                obj.CustomerID = int.Parse(hdnUserId.Value);
                isInsert = false;
            }

            obj.Name = nameTxtBox.Text;
            obj.Address = addressTxtBox.Text;

            if(MaleRadioButton.Checked)
            {
                obj.Gender = MaleRadioButton.Text;
            }
            if (FemaleRadioButton.Checked)
            {
                obj.Gender = FemaleRadioButton.Text;
            } 

            bool status = CustomerManager.AddCustomer(obj, isInsert);

            if (status)
            {
                if (isInsert)
                {
                    string message = "Customer added successfully.";
                    Response.Redirect("~/Web/Customer/CustomerList.aspx?status=" + message);
                }
                else
                {
                    string message = "Customer details edited successfully.";
                    Response.Redirect("~/Web/Customer/CustomerList.aspx?status=" + message);
                }
                
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            nameTxtBox.Text = "";
            addressTxtBox.Text = "";
            addBtn.Text = "Add";
        }
    }
}