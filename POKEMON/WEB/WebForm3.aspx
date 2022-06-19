<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WEB.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%foreach (DOMINIO.Generation item in Generation_Neg.getGenerations())
        {%>
    <h1><%:item.Id %> - <%:item.Name %></h1> 
    <img src="<%:item.Image_URL %>" alt="Alternate Text" />
    <p><%:item.Information %></p>

        <%} %>
</asp:Content>
