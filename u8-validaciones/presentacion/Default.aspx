<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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

        <%--<style>
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
        </div>--%>

        <style>
            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: contain;
            }
        </style>

        <%if (Session["usuario"] != null) { %>
            <div class="row mb-3">
                <div class="col-12">
                    <h2>Bienvenido/a <% Response.Write(((dominio.Usuario)Session["usuario"]).User.ToString()); %></h2>
                </div>
                <div class="col-6">
                    <asp:Button Text="Cerrar Sesión" runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-primary"/>
                </div>
            </div>
        <% } %>

        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" for="txtFiltro" CssClass="" />
                    <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" OnTextChanged="filtro_TextChanged" 
                        CssClass="form-control" />
                </div>
            </div>
            <div class="col-6" style="display: flex; flex-direction: column; justify-content:flex-end;">
                <div class="mb-3">
                    <asp:CheckBox Text="Filtro Avanzado" runat="server" ID="chkFiltroAvanzado" 
                        CssClass="" AutoPostBack="true" OnCheckedChanged="chkFiltroAvanzado_CheckedChanged"/>
                </div>
            </div>
        </div>

        <%if (FiltroAvanzado)
            { %>
            <div class="row">
                <div class="col-4 mb-3">
                    <asp:Label Text="Campo" for="ddlCampo" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCampo" CssClass="form-select" 
                        OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Precio" />
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Marca" />
                    </asp:DropDownList>
                </div>
                <div class="col-4 mb-3">
                    <asp:Label Text="Criterio" for="ddlCriterio" runat="server" />
                    <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                <div class="col-4 mb-3">
                    <asp:Label Text="Filtro" for="txtFiltroAvanzado" runat="server" />
                    <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click"/>
                </div>
            </div>
            
           <% } %>

            <div class="row">
                <div class="mb-3">
                    <a href="ArticuloForm.aspx" class="btn btn-primary">Agregar Artículo</a>
                </div>
            </div>

        <hr />

        <div class="row row-cols-1 row-cols-md-3 g-4">

            <asp:Repeater ID="repRepetidor" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="..." onerror="this.src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9cSGzVkaZvJD5722MU5A-JJt_T5JMZzotcw&s'">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <p class="card-text">$<%#Eval("Precio", "{0:F2}") %></p>
                                <a href="ArticuloForm.aspx?id=<%#Eval("Id") %>" class="btn btn-primary">Ver Detalle</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

</asp:Content>
