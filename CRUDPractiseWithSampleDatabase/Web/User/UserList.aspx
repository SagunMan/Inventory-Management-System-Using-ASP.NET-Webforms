<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="CRUDPractiseWithSampleDatabase.Web.UserList" %>


<asp:Content ID="Content1" ContentPlaceHolderId="MainContent" runat="server">
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/Site.css" rel="stylesheet" />
    <%--<asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnNew" runat="server" CausesValidation="false" CommandName="NewMember" Text="New" />
                    </ItemTemplate>
                </asp:TemplateField>--%>    

    <%--</form> --%>
    
    <br />
        <table runat ="server" class ="table">
            <tr class ="tab-content">
                <td class="auto-style1">Name</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="nameTxtBox" runat="server" Height="27px" Width="186px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvnameTxtBox" ControlToValidate="nameTxtBox" Display="None"
                    runat="server" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">User Name</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="usernameTxtBox" runat="server" Width="185px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvusernameTxtBox" ControlToValidate="usernameTxtBox" Display="None"
                    runat="server" ErrorMessage="User Name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>User Type</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:DropDownList ID="usertypeDrpDwn" class="dropdown" runat="server" Height="28" Width="185">
                        <asp:ListItem Enabled="true" Text="Select a user type" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvusertypeDrpDown" ControlToValidate="usertypeDrpDwn" Display="None"
                    runat="server" ErrorMessage="User Type is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Password</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="passwordTxtBox" runat="server" Width="185px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvpasswordTxtBox" ControlToValidate="passwordTxtBox" Display="None"
                    runat="server" ErrorMessage="Password is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revpasswordTxtBox" runat="server" ErrorMessage="Password should be of length atleast 8 with one capital letter and one digit "
                    ControlToValidate="passwordTxtBox" Display="None" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"> </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Re-type Password</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox ID="repasswordTxtBox" runat="server" Width="185px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvrepasswordTxtBox" Display="None" ControlToValidate="repasswordTxtBox"
                    runat="server" ErrorMessage="Re-type password is required."></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvrepasswordTxtBox" ControlToValidate="repasswordTxtBox" ControlToCompare="passwordTxtBox"
                        Operator ="Equal" Type ="String" runat="server" ErrorMessage="Re-type password mismatch."></asp:CompareValidator>
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
    
        <asp:GridView align="center" ID="GridView1" class="table" runat="server" AutoGenerateSelectButton="False" AutoGenerateColumns="False" 
            AllowPaging="true" PageSize="10" CellPadding="3" CellSpacing="2" DataKeyNames="UserID"
            OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" BorderColor="White" BorderStyle="None">
            <Columns>
                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                <ItemTemplate>
                    <asp:LinkButton ID="btnSelect" runat="server" CausesValidation="false" CommandName="Select" Text="Select" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FullName" HeaderText="Name" ItemStyle-Width="200px">
                    <ItemStyle Width="200px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="Username" ItemStyle-Width="100px">
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="UserType" HeaderText="Usertype" ItemStyle-Width="100px">
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CreatedOn" DataFormatString="{0:MMM/dd/yyyy }" HeaderText="Created On" ItemStyle-Width="150px">
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:BoundField>
                <%--<asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnNew" runat="server" CausesValidation="false" CommandName="NewMember" Text="New" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CausesValidation="false" OnClientClick="return Confirm()" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>'/>
                    </ItemTemplate>


                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
    <%--</body>--%>    
<%--</html> --%>
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
<%--</html> --%>
</asp:Content>