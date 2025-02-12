<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PersonaForm.aspx.cs" Inherits="presentacion.PersonaForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">ID</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" placeholder="5"/>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Pedro"/>
            </div>
            <div class="mb-3">
                <label for="txtEdad" class="form-label">Edad</label>
                <asp:TextBox runat="server" ID="txtEdad" CssClass="form-control" placeholder="32"/>
            </div>

            <div class="mb-3">
                <asp:Button Text="Aceptar" ID="btnAceptar" OnClick="btnAceptar_Click" runat="server" CssClass="btn btn-primary" />
                <asp:Button Text="Modificar" ID="btnModificar" OnClick="btnModificar_Click" runat="server" CssClass="btn btn-primary" Visible="false"/>
                <a href="Default.aspx" class="btn btn-secondary">Cancelar</a>
                <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" runat="server" CssClass="btn btn-danger" Visible="false" />
            </div>


        </div>
    </div>

</asp:Content>
