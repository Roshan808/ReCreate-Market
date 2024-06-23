<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ReCreate_market.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .price {
    font-size: 18px;
    font-weight: bold;
}

.quantity-label {
    display: block;
    margin-bottom: 5px;
    font-size: 14px;
}

.quantity-dropdown {
    width: 70px;
}

/* Adjust button style */
.btn-primary {
    padding: 8px 16px;
    font-size: 14px;
    border-radius: 5px;
}

    </style>
<section style="font-family: 'Poppins', sans-serif";>
    <div class="container">
        <div class="row">
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton11" runat="server" Text="Accessories"></asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton12" runat="server" Text="Art"></asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton13" runat="server" Text="Electronics"></asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton14" runat="server" Text="Home Decor"></asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton15" runat="server" Text="Life style"></asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton CssClass="nav-link" ID="LinkButton16" runat="server" Text="Toys"></asp:LinkButton>
            </div>

        </div>
    </div>
    </section>
    <br />
    <br />
    
 
    <section style="font-family: 'Poppins', sans-serif";>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <b><h3>Shop</h3></b>
                </div>
            </div>
            <br />
            <br />
            <br />
            <div class="row">
                <div class="col-4">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="card border-light" style="width: 18rem; margin-right: 40px;">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Pimage") %>' CssClass="card-img-top" Style="height: 300px;" />
                                <div class="card-body">
                                    <h5 class="card-title align-content-center"><%# Eval("Pname") %><h5>
                                        <br />
                                        <div class="row align-items-center">
                                            <div class="col-6">
                                                <span class="price"><%# Eval("Price", "{0:c}") %></span>
                                            </div>
                                            <div class="col-3">
                                                <span class="quantity-label">Qty</span>
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control quantity-dropdown">
                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-3" >
                                                <asp:ImageButton  ID="ImageButton1" runat="server" ImageUrl="imeges/add-to-cart.png" Width="50" Height="50" CommandArgument='<%# Eval("Prod_id") %>' CommandName="AddToCart" style="margin-left: 10px;" />

                                            </div>
                                        </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RecreateMarketDB %>" SelectCommand="SELECT [Prod_id], [Pname], [Pimage], [Price] FROM [Product]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </section>        
</asp:Content>
