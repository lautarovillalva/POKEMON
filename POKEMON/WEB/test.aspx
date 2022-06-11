<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="WEB.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


        <asp:Repeater ID="rpGenerations" runat="server">
        <ItemTemplate>
            <div class="card">
                <img src="<%#Eval("image_URL") %>" alt="Avatar" style="width: 100%">
                <div class="container">
                    <h4><b><%#Eval("id") %> - <%#Eval("name") %></b></h4>
                    <p><%# Convert.ToDateTime(Eval("date")).Year %></p>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
