<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemList.aspx.cs" Inherits="CRUDPractiseWithSampleDatabase.Web.ItemList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Site.css" rel="stylesheet" />
    <br />
    <asp:Button class="btn" ID="addBtn" runat="server" OnClick="addBtn_Click" Text="Add new Item" Width="105px" />
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
    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns ="False" 
        DataKeyNames ="ItemID" BorderColor="White" BorderStyle="None" OnRowEditing="GridView1_RowEditing" 
        OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField ShowHeader ="false">
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="false" CommandName="Update" Text="Update" />
                    <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>      
                <asp:TemplateField HeaderText="Item Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Purchase Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PurchasePrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PurchasePrice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sales Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SalesPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SalesPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Opening quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OpeningQty") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("OpeningQty") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <%--<asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnNew" runat="server" CausesValidation="false" CommandName="NewMember" Text="New" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Created On">
                    <EditItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("CreatedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("CreatedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Modified On">
                    <EditItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("ModifiedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("ModifiedOn", "{0:MMM/dd/yyyy }") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" OnClientClick="return Confirm()" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>'/>
                    </ItemTemplate>


<ItemStyle Width="50px"></ItemStyle>


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
