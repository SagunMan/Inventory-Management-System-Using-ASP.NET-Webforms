<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTypeList.aspx.cs" Inherits="CRUDPractiseWithSampleDatabase.Web.User.UserTypeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Site.css" rel="stylesheet" />

    <br />
    <table runat ="server" class ="table">
        <tr class ="tab-content">
            <td class="auto-style1">User Type</td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="usertypeTxtBox" runat="server" Height="27px" Width="186px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvusertypeTxtBox" ControlToValidate="usertypeTxtBox" Display="None"
                runat="server" ErrorMessage="User type is required."></asp:RequiredFieldValidator>
            </td>
        </tr>           
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="addBtn" CssClass="btn" Text="Add User Type" runat="server" OnClick="addBtn_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ForeColor="red" ID="lblerrormsg" />
            </td>
            <td>
                <asp:HiddenField runat="server" ID="hdnUserId" />
            </td>
            <td colspan ="3">
                <asp:ValidationSummary ID="vsInsertUpdate" runat="server" ShowMessageBox="true" ShowSummary="false" />
                <asp:Label runat="server" ForeColor="red" ID="Label1" />
            </td>
        </tr> 
    </table>

    <asp:GridView ID="GridView1" class="table" AutoGenerateColumns="false" runat="server" DataKeyNames="UserTypeID" 
        BorderColor="White" BorderStyle="None" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:LinkButton ID="selectBtn" runat ="server" CausesValidation="false" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="UserType1" HeaderText="User Type" />
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteBtn" runat ="server" OnClientClick="return Confirm()" CausesValidation="false" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
<script>
    function Confirm() {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Do you want to delete data?")) {
            return true;
        } else {
            return false;
        }
        //document.forms[0].appendChild(confirm_value);
    }
</script>
</asp:Content>
