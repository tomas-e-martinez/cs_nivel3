<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticuloForm.aspx.cs" Inherits="presentacion.ArticuloForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--public int Id { get; set; }

    [DisplayName("Código")]
    public string Codigo { get; set; }
    public string Nombre { get; set; }

    [DisplayName("Descripción")]
    public string Descripcion { get; set; }

    [DisplayName("Categoría")]
    public Categoria Categoria { get; set; }
    public Marca Marca { get; set; }
    public string ImagenUrl { get; set; }
    public decimal Precio { get; set; }--%>

    <div class="mb-3">
        <asp:Label Text="ID" runat="server" for="txtId" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtId" placeholder="4" CssClass="form-control" />
    </div>
    <div class="mb-3">
        <asp:Label Text="Código" runat="server" for="txtCodigo" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtCodigo" placeholder="S04T" CssClass="form-control" />
    </div>
    <div class="mb-3">
        <asp:Label Text="Nombre" runat="server" for="txtNombre" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtNombre" placeholder="Galaxy S12" CssClass="form-control" />
    </div>
    <div class="mb-3">
        <asp:Label Text="Descripción" runat="server" for="txtDescripcion" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtDescripcion" placeholder="Teléfono inteligente con pantalla de 5 pulgadas." CssClass="form-control" TextMode="MultiLine" Rows="2"/>
    </div>
    <div class="mb-3">
        <asp:Label Text="Categoría" runat="server" for="ddlCategoria" CssClass="form-label"/>
        <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select" />
    </div>
    <div class="mb-3">
        <asp:Label Text="Marca" runat="server" for="ddlMarca" CssClass="form-label"/>
        <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select" />
    </div>
    <div class="mb-3">
        <asp:Label Text="URL de Imagen" runat="server" for="txtUrlImagen" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtUrlImagen" placeholder="http://imagenes.com/celular" CssClass="form-control" />
    </div>
    <div class="mb-3">
        <asp:Label Text="Precio" runat="server" for="txtPrecio" CssClass="form-label"/>
        <asp:TextBox runat="server" ID="txtPrecio" placeholder="$4250" CssClass="form-control" />
    </div>
</asp:Content>
