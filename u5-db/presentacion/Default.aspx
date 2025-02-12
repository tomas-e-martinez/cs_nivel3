<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">ASP.NET</h1>
            <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <%--<div class="row">
            <asp:GridView ID="dgvArticulos" DataKeyNames="Id" runat="server" CssClass="table" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                </Columns>

            </asp:GridView>
        </div>--%>

        <style>
            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: contain;
            }
        </style>

        <div class="row row-cols-1 row-cols-md-3 g-4">

            <%
                foreach (dominio.Articulo art in ListaArticulo)
                {
            %>
            <div class="col">
                <div class="card">
                    <img src="<%:art.ImagenUrl %>" class="card-img-top" alt="..." onerror="this.src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9cSGzVkaZvJD5722MU5A-JJt_T5JMZzotcw&s'">
                    <div class="card-body">
                        <h5 class="card-title"><%:art.Nombre %></h5>
                        <p class="card-text"><%:art.Descripcion %></p>
                        <a href="DetalleArticulo.aspx&id=<%:art.Id %>">Ver Detalle</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

    </main>

</asp:Content>
