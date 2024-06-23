<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="ReCreate_market.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .report-container {
        border: 1px solid #ccc; 
        padding: 10px;
        margin-bottom: 20px; 
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-5">
            <div class="col-12 text-center">
                <h2 class="mb-4">Reports</h2>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="btn-group">
                    <asp:Button ID="Button1" runat="server" Text="User Data" CssClass="btn btn-success btn-lg" OnClick="Button1_Click"/>
                    <asp:Button ID="Button2" runat="server" Text="Order Data" CssClass="btn btn-success btn-lg" OnClick="Button2_Click"/>
                    <asp:Button ID="Button3" runat="server" Text="Payment Data" CssClass="btn btn-success btn-lg" OnClick="Button3_Click"/>
                </div>
            </div>
        </div>
        <div class="row mt-5" align="center">
    <div class="col-12 text-center">
        <div class="report-container">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="900px"></rsweb:ReportViewer>
            <rsweb:ReportViewer ID="ReportViewer3" runat="server" Width="900px"></rsweb:ReportViewer>
            <rsweb:ReportViewer ID="ReportViewer2" runat="server" Width="900px"></rsweb:ReportViewer>
        </div>

    </div>
</div>
    </div>
</asp:Content>
