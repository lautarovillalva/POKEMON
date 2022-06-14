<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WEB.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">


        <h1>POKÉDEX</h1>


        <div class="row row-cols-1 row-cols-md-4 g-4">
            <asp:Repeater ID="rpPokemons" runat="server">
                <ItemTemplate>

                    <div class="col">
                        <div class="card h-100">
                            <img src="<%# Eval("Images[0]") %>" class="card-img-top" alt="...">
                            <div class="card-body">

                                <div class="chip">
                                    <img src="<%# Eval("Images[1]") %>" alt="Person" width="96"><b>#<%# Eval("Id") %></b>
                                </div>
                                <h5 class="card-title">
                                    <br />
                                    <%# Eval("Name") %></h5>
                                <div class="type-cell type-<%#Eval("Type1.Name").ToString().ToLower()%>">
                                    <%#Eval("Type1.Name") %>
                                </div>
                                <%--<p class="card-text">HP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# Eval("Hp") %> <br /> Attack:&nbsp;&nbsp;<%# Eval("Attack") %> <br /> Defense:&nbsp;&nbsp;<%# Eval("Defense") %></p>--%>
                                <div class="parent">
                                    <div class="div1">
                                        <h6>HP</h6>
                                        <h6>Attack</h6>
                                        <h6>Defense</h6>
                                        <h6>Speed</h6>
                                        <h6>Sp. Attack</h6>
                                        <h6>Sp. Defense</h6>
                                    </div>
                                    <div class="div2">
                                        <h6><%# Eval("Hp") %></h6>
                                        <h6><%# Eval("Attack") %></h6>
                                        <h6><%# Eval("Defense") %></h6>
                                        <h6><%# Eval("Speed") %></h6>
                                        <h6><%# Eval("SpecialAttack") %></h6>
                                        <h6><%# Eval("SpecialDefense") %></h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
</asp:Content>
