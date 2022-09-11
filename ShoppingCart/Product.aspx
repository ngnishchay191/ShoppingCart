<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="ShoppingCart.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid #FF0000;
            background-color: #99FF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Customer ID:
            <asp:TextBox ID="txtcid" runat="server" ReadOnly="True"></asp:TextBox>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ProdId" DataSourceID="SqlDataSource1" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="ProdId" HeaderText="ProdId" InsertVisible="False" ReadOnly="True" SortExpression="ProdId" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                <asp:BoundField DataField="ProdStock" HeaderText="ProdStock" SortExpression="ProdStock" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn1" runat="server" Text="Buy Product" OnClick="btnBuyClick_Click" CausesValidation="False" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <br />
        <table class="auto-style1">
            <tr>
                <td style="font-weight: bold; font-size: 19px; font-family: 'Arial Black'">SHOPPING CART:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Customer ID:</td>
                <td>
                    <asp:TextBox ID="txtCartcid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Product ID:</td>
                <td>
                    <asp:TextBox ID="txtCartpid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Product Price:</td>
                <td>
                    <asp:TextBox ID="txtCartPrice" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCartPrice" ErrorMessage="Price is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Product Stock:</td>
                <td>
                    <asp:TextBox ID="txtCartstock" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Enter Quantity:</td>
                <td>
                    <asp:TextBox ID="txtCartqty" runat="server" TextMode="Number"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCartqty" ErrorMessage="Quantity is Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Total Amount:</td>
                <td>
                    <asp:TextBox ID="txtCarttamt" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnCalculateAmount" runat="server" OnClick="btnCalculateAmount_Click" Text="Calculate Amount" />
                </td>
            </tr>
            <tr>
                <td>Payment Mode:</td>
                <td>
                    <asp:RadioButton ID="rbCard" runat="server" Text="Card" GroupName="paymentMode" />
                    <asp:RadioButton ID="rbCash" runat="server" Text="Cash" GroupName="paymentMode" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="output" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnOrder" runat="server" Text="Order" OnClick="btnOrder_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommonSimulation2ConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Go to Home Page</asp:HyperLink>
    </form>
</body>
</html>
