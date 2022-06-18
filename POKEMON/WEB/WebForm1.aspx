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
                                    <img src="<%# Eval("Images[2]") %>" alt="Person" width="96"><b>#<%# Eval("Id") %></b>
                                </div>
                                <h5 class="card-title">
                                    <%# Eval("Name") %></h5>

                               <%-- <div class="type-cell type-<%#Eval("Types[0].Name").ToString().ToLower()%>">
                                    <%#Eval("Types[0].Name") %>
                                </div>--%>

                                <%for (int i = 0; i < pokemon_Neg.GetPokemons()[Convert.ToInt32(Eval("Id"))].Types.Count; i++)
                                    {
                                        Response.Write(pokemon_Neg.GetPokemons()[Convert.ToInt32(Eval("Id"))].Types[i].Name);
                                    } %>

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
                            <h6><%# Eval("Generation.Name") %></h6>
                        </div>
                    </div>


                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
</asp:Content>
