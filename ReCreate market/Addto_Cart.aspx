<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addto_Cart.aspx.cs" Inherits="ReCreate_market.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="text-center">
                <h2 class="text-primary">Your Shopping Cart</h2>
                <hr />
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-secondary" NavigateUrl="Products.aspx">Continue Shopping</asp:HyperLink>
            </div>
            <div class="row justify-content-center mt-4">
                <asp:GridView ID="GridView1" OnRowDeleting="GridView1_RowDeleting" runat="server" AutoGenerateColumns="False" BackColor="#CCFFFF" BorderColor="Black" BorderWidth="5px" EmptyDataText="No Product available in Shopping cart" ShowFooter="True" CssClass="table table-bordered table-striped">
                    <Columns>
                        <asp:BoundField DataField="S No" HeaderText="Sr No">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pid" HeaderText="Product ID">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Product image">
                            <ItemTemplate>
                                <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("pimage") %>' AlternateText="Product Image" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="pname" HeaderText="Product Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pprice" HeaderText="Price">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Remove" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="text-center mt-4">
                <asp:Button ID="Button1" runat="server" Text="Place Order" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
