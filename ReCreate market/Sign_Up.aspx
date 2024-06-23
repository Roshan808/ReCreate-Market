<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sign_Up.aspx.cs" Inherits="ReCreate_market.Sign_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">
   <div class="row">
      <div class="col-md-10 mx-auto">
         <div class="card">
            <div class="card-body">
               <div class="row">
                  <div class="col">
                     <center>
                        <img width="100px" src="imeges/default_pfp.png"/>
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <h4>Your Profile</h4>
                        <span>Account Status - </span>
                        <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Acc Info"></asp:Label>
                     </center>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <hr>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <label>Full Name</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="txtUname" runat="server" placeholder="Full Name"></asp:TextBox>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <label>Date of Birth</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="DOB" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <label>Contact No</label>
                     <div class="form-group" aria-required="True" id="ContNum">
                         <asp:TextBox CssClass="form-control" ID="ContNum1" runat="server" placeholder="Contact No" TextMode="Number" oninput="javascript: if (this.value.length > 10) this.value = this.value.slice(0, 10);"></asp:TextBox>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <label>Email ID</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-4">
                     <label>State</label>
                     <div class="form-group">
                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                           <asp:ListItem Text="Select" Value="select" />
                           <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                           <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                           <asp:ListItem Text="Assam" Value="Assam" />
                           <asp:ListItem Text="Bihar" Value="Bihar" />
                           <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                           <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                           <asp:ListItem Text="Goa" Value="Goa" />
                           <asp:ListItem Text="Gujarat" Value="Gujarat" />
                           <asp:ListItem Text="Haryana" Value="Haryana" />
                           <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                           <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                           <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                           <asp:ListItem Text="Karnataka" Value="Karnataka" />
                           <asp:ListItem Text="Kerala" Value="Kerala" />
                           <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                           <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                           <asp:ListItem Text="Manipur" Value="Manipur" />
                           <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                           <asp:ListItem Text="Mizoram" Value="Mizoram" />
                           <asp:ListItem Text="Nagaland" Value="Nagaland" />
                           <asp:ListItem Text="Odisha" Value="Odisha" />
                           <asp:ListItem Text="Punjab" Value="Punjab" />
                           <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                           <asp:ListItem Text="Sikkim" Value="Sikkim" />
                           <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                           <asp:ListItem Text="Telangana" Value="Telangana" />
                           <asp:ListItem Text="Tripura" Value="Tripura" />
                           <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                           <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                           <asp:ListItem Text="West Bengal" Value="West Bengal" />
                        </asp:DropDownList>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <label>City</label>
                     <div class="form-group">
                         <asp:TextBox class="form-control" ID="city" runat="server" placeholder="City"></asp:TextBox>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <label>Pincode</label>
                     <div class="form-group">
                         <asp:TextBox class="form-control" ID="pin" runat="server" placeholder="Pincode" TextMode="Number" oninput="javascript: if (this.value.length > 6) this.value = this.value.slice(0, 6);"></asp:TextBox>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <label>Full Address</label>
                     <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="Add" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col">
                     <center>
                        <span class="badge badge-pill badge-info">Login Password</span>
                     </center>
                  </div>
               </div>
                <div class="row">

                    <div class="col-md-4">
                        <label>New Password</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox class="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <asp:ImageButton ID="togglePassword" runat="server" ImageUrl="imeges/shared-vision.png" OnClientClick="togglePasswordVisibility(); return false;" CssClass="align-items-center" style="width: 40px; height: 40px; padding: 10px" />
                            </div>
                        </div>
                        <script>
                            function togglePasswordVisibility() {
                                var password = document.getElementById('<%= txtPass.ClientID %>');
                                var toggleImage = document.getElementById('<%= togglePassword.ClientID %>');

                                if (password.type === "password") {
                                    password.type = "text";
                                    toggleImage.src = "<%= ResolveUrl("imeges/shared-vision.png") %>";
                                 } else {
                                    password.type = "password";
                                    toggleImage.src = "<%= ResolveUrl("imeges/eye.png") %>";
                                }
                            }
                        </script>

                    </div>
                </div>
                </div>
                <br />
                <br />
               <div class="row">      
                  <div class="col-8 mx-auto">
                     <center>
                        <div class="form-group">
                            <asp:Button class="btn btn-primary btn-block btn-lg" ID="signupbtn" runat="server" Text="Sign Up" OnClick="signupbtn_Click" />
                        </div>
                     </center>
                  </div>
               </div>
            </div>
         </div>
         <a href="Home.aspx"><< Back to Home</a>
          <br><br>
      </div>
   </div>

</asp:Content>
