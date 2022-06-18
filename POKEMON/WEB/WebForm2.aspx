﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WEB.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <%foreach (DOMINIO.Pokemon item in pokemon_Neg.GetPokemons())
                {%>
            <div class="col">
                <div class="card h-100">
                    <img src="<%:item.Images[0] %>" class="card-img-top foto1" alt="...">
<%--                    <img src="<%:item.Images[1] %>" class="card-img-top foto2" alt="...">--%>
                    <div class="card-body">

                        <div class="chip">
                            <img src="<%:item.Images[2] %>" alt="Person" width="96"><b>#<%:item.Id %></b>
                        </div>
                        <h5 class="card-title">
                            <%:item.Name %></h5>

                        <div class="types">


                        <%foreach (DOMINIO.TypeP types in item.Types)
                            {%>
                        <div class="type-cell type-<%:types.Name.ToLower()%>">
                            <%:types.Name %>
                        </div>

                        <%} %>

                        </div>



                        <div class="stats">
                            <div class="stats-name">
                                <h6>HP</h6>
                                <h6>Attack</h6>
                                <h6>Defense</h6>
                                <h6>Speed</h6>
                                <h6>Sp. Attack</h6>
                                <h6>Sp. Defense</h6>
                            </div>
                            <div class="stats-points">
                                <h6><%:item.Hp %></h6>
                                <h6><%:item.Attack %></h6>
                                <h6><%:item.Defense %></h6>
                                <h6><%:item.Speed %></h6>
                                <h6><%:item.SpecialAttack %></h6>
                                <h6><%:item.SpecialDefense %></h6>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%} %>
        </div>
    </div>




</asp:Content>