<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_page.aspx.cs" Inherits="ReCreate_market.Admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- Custom CSS for additional styling -->
    <style>
        /* Additional custom styling */
        body {
            padding-top: 50px; /* Add padding to the top of the body to accommodate the fixed navbar */
        }
        .btn-custom {
            margin-top: 20px; /* Add margin to the top of buttons */
        }
    </style>
     <style>
         .span-large {
            font-size: 24px; /* Adjust the font size to make it larger */
        }
  
        .image-button:hover {
            transform: scale(1.1); /* Scale up by 10% on hover */
            transition: transform 0.3s ease; /* Smooth transition */
            cursor: pointer; /* Change cursor to pointer */
        }
        .image-button {
            width: 400px; /* Adjust the width of the image button */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">Admin Page</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">                      
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-5">        
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="text-center">
                        <!-- Shop Management Button -->
                        <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="~/Shop_Management.aspx" ImageUrl="~/imeges/shop.png" AlternateText="Shop Management" CssClass="btn btn-lg btn-custom img-fluid image-button" />
                        <br />
                        <span class="span-large">Shop Management</span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="text-center">
                        <!-- Scrapyard Management Button -->
                        <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="~/Scrapyard_Managment.aspx" ImageUrl="~/imeges/waste.png" AlternateText="Scrapyard Management" CssClass="btn  btn-lg btn-custom img-fluid image-button" />
                        <br />
                        <span class="span-large">Scrapyard Management</span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="text-center">
                        <!-- Shop Management Button -->
                        <asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/Report.aspx" ImageUrl="~/imeges/report.png" AlternateText="Shop Management" CssClass="btn btn-lg btn-custom img-fluid image-button" />
                        <br />
                        <span class="span-large" align="center">Reports</span>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div align="center">
            <asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" Text="Back To Home" PostBackUrl="~/Home.aspx" />
                </div>
        </div>
        
    </form>

</body>
</html>
