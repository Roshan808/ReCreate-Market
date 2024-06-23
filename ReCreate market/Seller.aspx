<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Seller.aspx.cs" Inherits="ReCreate_market.Seller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="container">
                <h1 class="mt-4 mb-4">Seller Form</h1>
                <div class="form-group">
                    <label for="txtMaterial">Scrap Material</label>
                    <asp:TextBox ID="txtMaterial" runat="server" CssClass="form-control" placeholder="Enter scrap material"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPrice">Scrap Price</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter scrap price"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Seller's Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter seller's address" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="fileUpload">Upload Images</label>
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" AllowMultiple="true" />
                </div>
                <div class="form-group">
                    <label for="txtDate">Date of Selling</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Enter date of selling" TextMode="Date"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

</asp:Content>