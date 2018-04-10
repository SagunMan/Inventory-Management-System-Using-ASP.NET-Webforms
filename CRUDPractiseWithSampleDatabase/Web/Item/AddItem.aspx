<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="CRUDPractiseWithSampleDatabase.Web.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Site.css" rel="stylesheet" />
    <br />
        <table runat ="server" class ="table">
            <tr class ="tab-content">
                <td class="auto-style1">Item Name</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="nameTxtBox" runat="server" Height="27px" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvnameTxtBox" ControlToValidate="nameTxtBox" Display="None"
                    runat="server" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Purchase cost</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="ppriceTxtBox" runat="server" Width="185px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvppriceTxtBox" ControlToValidate="ppriceTxtBox" Display="None"
                    runat="server" ErrorMessage="Purchase Price is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Sales Price</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="spriceTxtBox" runat="server" Width="185px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvspriceTxtBox" ControlToValidate="spriceTxtBox" Display="None"
                    runat="server" ErrorMessage="Sales price is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Opening Quantity</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="qtyTxtBox" runat="server" Width="185px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvqtyTxtBox" Display="None" ControlToValidate="qtyTxtBox"
                    runat="server" ErrorMessage="Quantity is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td class="auto-style2">
                </td>
                <td class="auto-style4">
                    <asp:HiddenField runat="server" ID="hdnUserId" />
                </td>
                <td>
                    <asp:Button class="btn" ID="addBtn" runat="server" Text="Add" OnClick="addBtn_Click" />
                    <asp:Button class="btn" ID="clearBtn" runat="server" CausesValidation ="false" Text="Clear" OnClick="clearBtn_Click" />
                </td>
                <td colspan="3">
                    <asp:Label runat="server" ForeColor="red" ID="lblerrormsg" />
                </td>
                <td colspan ="3">
                    <asp:ValidationSummary ID="vsInsertUpdate" runat="server" ShowMessageBox="true" ShowSummary="false" />
                    <asp:Label runat="server" ForeColor="red" ID="Label1" />
                </td>
            </tr>
            
        </table>
</asp:Content>
