<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WEB.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">



        <%foreach (DOMINIO.Generation item in Generation_Neg.getGenerations())
            {%>
        <div class="flip-card">
            <div class="flip-card-inner">
                <div class="flip-card-front">
                    <img src="<%:item.Image_URL %>" alt="Avatar" style="width: 300px; height: 300px;">
                </div>
                <div class="flip-card-back">
                    <img src="images/icons8-psyduck-96.png" alt="Avatar" style="width: 300px; height: 300px;">
                </div>
            </div>
        </div>

        <%} %>
    </div>
</asp:Content>
