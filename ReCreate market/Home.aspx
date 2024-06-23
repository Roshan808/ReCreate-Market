<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ReCreate_market.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
          <img src="imeges/homepage_img.jpg" class="img-fluid w-100" style="height: 80vh;"/>
    </div>
  
    <section style="font-family: 'Poppins', sans-serif";>
                           <asp:Label ID="lblsuccess" runat="server" cssClass="text-success"></asp:Label>

      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                   <h2>Our Features</h2>
               </center>
            </div>
         </div>
         
         <div class="row">
            <div class="col-md-4">
               <center>
                   <div class="card" style="width: 18rem;">
                       <img class="card-img-top" src="imeges/homedecor_img.jpg" alt="Card image cap">
                       <div class="card-img-overlay" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: rgba(255, 255, 255, 0.4); width: 100%; padding: 20px; text-align: center;">
                           <p class="card-title font-weight-bold align-text-bottom">Home Decor</p>
                           <p class="card-text  font-weight-bold text-justify">Florish your house with creative item.</p>
                       </div>
                   </div>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                   <div class="card" style="width: 18rem;">
                       <img class="card-img-top" src="imeges/electronic_acc.jpg" alt="Card image cap">
                       <div class="card-img-overlay" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: rgba(255, 255, 255, 0.4); width: 100%; padding: 20px; text-align: center;">
                           <p class="card-title font-weight-bold align-text-bottom"> Electronic Accessories</p>
                           <p class="card-text font-weight-bold text-justify">Coustomize accessories hub.
                           </p>
                       </div>
                   </div>
               </center>
            </div>
            <div class="col-md-4">
                <center>
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="imeges/sketches.jpg" alt="Card image cap">
                        <div class="card-img-overlay" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: rgba(255, 255, 255, 0.4); width: 100%; padding: 20px; text-align: center;">
                            <p class="card-title font-weight-bold align-text-bottom">Sketches</p>
                            <p class="card-text  font-weight-bold text-justify">Be curious about fascinating sketches.</p>
                        </div>
                    </div>
                </center>
            </div>
         </div>
      </div>

   </section>
    <br />
    <br />
    <br />
    <br />


    <style>
        .card-img-top {
            width: 100%; /* Ensure the image takes the full width of the container */
            height: auto; /* Maintain aspect ratio */
        }

        .text-container {
            padding: 20px; /* Add padding for better spacing */
        }

        .product-container {
            position: relative;
        }

        .product-overlay {
            position: absolute;
            top: 0;
            start: 0;
            end: 0;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.4); /* Semi-transparent white background */
        }
    </style>
    <div class="container border-light">
        <div class="row">
            <!-- Right column with image, price, and details (col-md-2 each) -->
            <asp:Repeater ID="ProductRepeater" runat="server">
                <HeaderTemplate>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="text-container">
                                <h2>Creative Store</h2>
                                <p>Fresh Artist creation and Customize material available at a reasonable price.</p>
                            </div>
                        </div>
                </HeaderTemplate>
                <ItemTemplate>

                    <div class="col-md-2">
                        <div class="product-container">
                            <div class="product-overlay">
                                <h3>Price: <%# Eval("Price") %></h3>
                                <p><%# Eval("Pname") %></p>
                            </div>
                            <img class="card-img-top" src='<%# Eval("Pimage") %>' alt=''>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>


        </div>
    </div>
            


    <br />
    <br />
    <br />
    <br />


    <style>
        .card-img-top {
            width: 100%; /* Ensure the image takes the full width of the container */
            height: auto; /* Maintain aspect ratio */
        }

        .text-container {
            padding: 20px; /* Add padding for better spacing */
        }

        .product-container {
            position: relative;
        }

        .product-overlay {
            position: absolute;
            top: 0;
            start: 0;
            end: 0;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.4); /* Semi-transparent white background */
        }
    </style>
    <div class="container border-light">
        <div class="row">
            <!-- Right column with image, price, and details (col-md-2 each) -->
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="text-container">
                                <h2>Scrapyard</h2>
                                <p>Find Your Diamond From The Mine of Scrap.</p>
                            </div>
                        </div>
                </HeaderTemplate>
                <ItemTemplate>

                    <div class="col-md-2">
                        <div class="product-container">
                            <div class="product-overlay">
                                <h3>Price: <%# Eval("Price") %></h3>
                                <p><%# Eval("Pname") %></p>
                            </div>
                            <img class="card-img-top" src='<%# Eval("Pimage") %>' CssClass="card-img-top" Style="height: 200px;" alt=''>
                            
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>
    <br />
    <br />
    <br />
    <br />

 
</asp:Content>
