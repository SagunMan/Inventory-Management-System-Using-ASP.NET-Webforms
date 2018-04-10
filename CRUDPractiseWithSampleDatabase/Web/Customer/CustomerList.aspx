<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="CRUDPractiseWithSampleDatabase.Web.CustomerList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Site.css" rel="stylesheet" />

    <br />
    <asp:Button class="btn" ID="addBtn" runat="server" Text="Add Customer" Width="132px" OnClick="addBtn_Click" />
    <table runat ="server">
        <tr>
            <td>
                <asp:HiddenField runat="server" ID="hdnUserId" />
            </td>
            <td colspan="3">
                <asp:Label runat="server" ForeColor="red" ID="lblerrormsg" />
            </td>
        </tr>
        
    </table>
    <br />
    <asp:GridView class="table" ID="GridView1" AutoGenerateColumns="False" DataKeyNames="CustomerID" BorderColor="White" BorderStyle="None" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="false" CommandName="Select" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="200px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Created On">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modified On">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ModifiedOn") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ModifiedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" OnClientClick="return Confirm()" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
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
