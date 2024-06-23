<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="ReCreate_market.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 50px;
            width: 500px;
        }

        .card {
            background-color: #f8f9fa;
            border: none;
        }

        .btn-submit {
            background-color: #28a745;
            color: #fff;
        }

        .btn-submit:hover {
            background-color: #218838;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header text-center">
                    <h2 class="font-weight-bold">Card Details</h2>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtFirstName">First Name</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="First Name" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtLastName">Last Name</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Last name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="txtCardNumber">Card Number</label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="16 Digits card number" oninput="javascript: if (this.value.length > 16) this.value = this.value.slice(0, 16);" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Card number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="txtExpiryDate">Expiry Date</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="MM/YY (Eg:142024)" oninput="javascript: if (this.value.length > 4) this.value = this.value.slice(0, 4);" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Expiry date is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col">
                                <label for="txtCVV">CVV</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="3 digits CVV" oninput="javascript: if (this.value.length > 3) this.value = this.value.slice(0,3);" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="CVV is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtBillingAddress">Billing Address</label>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Billing Address" TextMode="MultiLine" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Address is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-submit btn-lg" OnClick="Button1_Click" />
                    </div>
                    <div class="text-center mt-3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" Font-Bold="true" HeaderText="Fix the following errors" />
                    </div>
                    <div class="text-center mt-3">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Addto_Cart.aspx" CssClass="font-weight-bold">Previous Page</asp:HyperLink>
                        &nbsp;|&nbsp;
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Home.aspx" CssClass="font-weight-bold">Home</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
