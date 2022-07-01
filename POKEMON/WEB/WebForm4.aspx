<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WEB.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="py-5 text-center container">
        <div class="row py-lg-5">

            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light"><%:pokemon.Name %></h1>
                <div class="chip">
                            <img src="<%:pokemon.Images[2] %>" alt="Person" width="96"><b>#<%:pokemon.Id %></b>
                        </div>
                        <h5 class="card-title">
                            <%:pokemon.Name %></h5>

                        <div class="types">


                            <%foreach (DOMINIO.TypeP types in pokemon.Types)
                                {%>
                            <div class="type-cell type-<%:types.Name.ToLower()%>">
                                <%:types.Name %>
                            </div>
                            <%} %>

                            <%if (pokemon.IsLegendary)
                                {%>
                            <h6 class="type-cell legendary">LEGENDARY</h6>
                            <%} %>
                        </div>
               
            </div>
        </div>
    </section>



</asp:Content>
