<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Scrapyard_Managment.aspx.cs" Inherits="ReCreate_market.Scrapyard_Managment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
    .center-table {
        margin: 0 auto;
    } 
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <body>
        

        <div align="center" style="font-family: 'Poppins', sans-serif";><h2 class="display-3" >Scrapyard Product Management</h2></div>
<br />
<br />
        <div class="container-fluid" style="font-family: 'Poppins', sans-serif";>
    <div class="row">
        <div class="col-md-6">
            <table class="table table-striped">
                <tr>
                    <td>Product ID</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                        <asp:Button ID="Button5" class="btn btn-danger" runat="server" Text="Get" OnClick="Button5_Click" Style="margin-right: 5px;" />
                    <td></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Product Description</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Product Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br />
                        <asp:Button ID="Button4" class="btn btn-primary" runat="server" Text="Insert" OnClick="Button4_Click" Style="margin-right: 5px;" />
                        <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="Update" OnClick="Button1_Click1" Style="margin-right: 5px;" />
                        <asp:Button ID="Button2" class="btn btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" Style="margin-right: 5px;" />
                        <asp:Button ID="Button3" class="btn btn-success" runat="server" Text="Search" OnClick="Button3_Click" />
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="Button7_Click" ImageUrl="~/imeges/refresh.png" Height="45px" Style="margin-right: 5px;" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-6">
            <table class="table table-striped">
                <tr>              
                    <td>
            <asp:GridView ID="GridView2" runat="server" Width="700px" CssClass="container text-center">
            </asp:GridView>
                    </td>
                </tr>
                </table>
        </div>
    </div>
</div>
        <div>
            


        </div>
    </body>
</asp:Content>
