using CRUDPractiseWithSampleDatabase.BLL.Manager;
using CRUDPractiseWithSampleDatabase.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDPractiseWithSampleDatabase.Web.User
{
    public partial class UserTypeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }

        public void BindGridView()
        {
            GridView1.DataSource = UserManager.GetAllUserTypeDetails();
            GridView1.DataBind();
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(usertypeTxtBox.Text))
            {
                lblerrormsg.Text = "User type cannot be empty.";
                usertypeTxtBox.Focus();
                return;
            }

            bool IsInsert = true;

            UserType obj = new UserType();
            if(!string.IsNullOrEmpty(hdnUserId.Value))
            {
                obj.UserTypeID = int.Parse(hdnUserId.Value);
                IsInsert = false;
            }

            obj.UserType1 = usertypeTxtBox.Text;

            bool status = UserManager.InsertUserTypeDetails(obj, IsInsert);
            if (status)
            {
                //after successful logic
                if (!IsInsert)
                {
                    lblerrormsg.Text = "Updated Successfully.";
                    lblerrormsg.ForeColor = System.Drawing.Color.Green;
                }

                BindGridView();
            }
            else
            {
                lblerrormsg.Text = IsInsert ? "Unable to save." : "Unable to updated.";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            addBtn.Text = "Update";
            hdnUserId.Value = GridView1.DataKeys[this.GridView1.SelectedRow.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                UserType obj = UserManager.GetUserTypeByID(int.Parse(hdnUserId.Value));
                if (obj != null)
                {
                    usertypeTxtBox.Text = obj.UserType1;
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                UserManager.DeleteUserTypeDetail(int.Parse(hdnUserId.Value));
            }
            BindGridView();
        }
    }
}