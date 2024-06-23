<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="ReCreate_market.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            text-align: center;
            color: #333;
            margin-top: 0;
        }
        
        .btn-download {
            background-color: #aaa;
            color: #fff;
            font-weight: bold;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        
        .btn-download:hover {
            background-color: #666;
        }
        
        .link-home {
            color: #333;
            font-weight: bold;
            text-decoration: none;
            margin-left: 20px;
        }
        
        .link-home:hover {
            text-decoration: underline;
        }
        
        .invoice-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .invoice-table th, .invoice-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .invoice-table th {
            background-color: #f2f2f2;
        }
        
        .invoice-total {
            font-weight: bold;
        }
        
        .invoice-note {
            text-align: center;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="Button1" runat="server" Text="Download Invoice" OnClick="Button1_Click" CssClass="btn-download" />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx" CssClass="link-home">Go To Home Page </asp:HyperLink>
            <asp:Panel ID="Panel1" runat="server">
                <table class="invoice-table">
                    <tr>
                        <th colspan="2"><h2>Retail Invoice</h2></th>
                    </tr>
                    <tr>
                        <td>Order No:</td>
                        <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Order detail:</td>
                        <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Buyers Address:</td>
                        <td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Seller Address:</td>
                        <td>Tulinj Road, Appa nagar, Nallasopara (E), Room no 2</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="invoice-table">
                                <Columns>

                                    <asp:BoundField DataField="sno" HeaderText="S no">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productid" HeaderText="Product Id">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="productname" HeaderText="Product Name">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="Price">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>

                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>Grand total:</td>
                        <td><asp:Label ID="Label4" runat="server" Text="Label" CssClass="invoice-total"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="invoice-note">This is a computer-generated invoice and does not require a signature.</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
