using CRUDPractiseWithSampleDatabase.BLL.Manager;
using CRUDPractiseWithSampleDatabase.DLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDPractiseWithSampleDatabase.Web
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            addBtn.Text = "Add";
            BindGridView();
            if (!IsPostBack)
            {
                fillUserType();
            }
        }

        protected void BindGridView()
        {
            GridView1.DataSource = UserManager.GetAllUserDetails();
            GridView1.DataBind();
        }

        protected void fillUserType()
        {
            var userTypes = UserManager.GetAllUserTypeDetails();

            foreach (UserType userType in userTypes)
            {
                ListItem i = new ListItem(userType.UserType1, userType.UserTypeID.ToString());
                usertypeDrpDwn.Items.Add(i);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }

        protected void ClearValue()
        {
            nameTxtBox.Text = "";
            usernameTxtBox.Text = "";
            passwordTxtBox.Text = "";
            repasswordTxtBox.Text = "";
            hdnUserId.Value = "";
            lblerrormsg.Text = "";
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            addBtn.Text = "Update";
            ClearValue();
            hdnUserId.Value = GridView1.DataKeys[this.GridView1.SelectedRow.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                UserDetail obj = UserManager.GetUserByID(new Guid(hdnUserId.Value));
                if (obj != null)
                {
                    nameTxtBox.Text = obj.FullName;
                    usernameTxtBox.Text = obj.UserName;
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

            if (string.IsNullOrEmpty(usernameTxtBox.Text))
            {
                lblerrormsg.Text = "Username cannot be empty.";
                usernameTxtBox.Focus();
                return;
            }

            if (string.IsNullOrEmpty(passwordTxtBox.Text))
            {
                lblerrormsg.Text = "Password cannot be empty.";
                passwordTxtBox.Focus();
                return;
            }

            if (passwordTxtBox.Text.Trim() != repasswordTxtBox.Text.Trim())
            {
                lblerrormsg.Text = "Retype password mismatch.";
                return;
            }
            bool IsInsert = true;

            UserDetail obj = new UserDetail();
            if (string.IsNullOrEmpty(hdnUserId.Value))
            {
                obj.UserID = Guid.NewGuid();
                IsInsert = true;
            }
            else
            {
                obj.UserID = new Guid(hdnUserId.Value);
                IsInsert = false;
            }

            obj.FullName = nameTxtBox.Text;
            obj.UserName = usernameTxtBox.Text;
            obj.PasswordAsHash = MD5Hash(passwordTxtBox.Text.Trim());

            bool status = UserManager.InsertUserDetails(obj, IsInsert);
            if (status)
            {
                //after successful logic
                if (!IsInsert)
                {
                    lblerrormsg.Text = "Updated Successfully.";
                    lblerrormsg.ForeColor = System.Drawing.Color.Green;
                }
                ClearValue();
                BindGridView();
            }
            else
            { 
                lblerrormsg.Text = IsInsert ? "Unable to save." : "Unable to updated.";
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            addBtn.Text = "Add";
            ClearValue();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            hdnUserId.Value = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            if (!string.IsNullOrEmpty(hdnUserId.Value))
            {
                UserManager.DeleteUserDetail(new Guid(hdnUserId.Value));
            }
            BindGridView();
        }  


        
    }
}