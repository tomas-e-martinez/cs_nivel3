<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="presentacion.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-3">
        <h1>Registrar nuevo usuario</h1>
    </div>
    <div class="row">
        <div class="col-12 mb-3">
            <asp:Label Text="Usuario" runat="server" for="txtUser" CssClass="form-label" />
            <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" REQUIRED />
        </div>
        <div class="col-12 mb-3">
            <asp:Label Text="Contraseña" runat="server" for="txtUser" CssClass="form-label" />
            <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" REQUIRED />
        </div>
    </div>
    <div class="row">
        <div class="col-4 mb-3">
            <asp:Button Text="Registrarse" runat="server" ID="btnRegistrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click"/>
        </div>
    </div>
</asp:Content>
