﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="presentacion.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-3">
        <h1>Iniciar Sesión</h1>
    </div>
    <div class="row mb-3">
        <div class="col-12 mb-3">
            <asp:Label Text="Usuario" runat="server" for="txtUsuario" CssClass="form-label"/>
            <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" REQUIRED />
        </div>
        <div class="col-12 mb-3">
            <asp:Label Text="Contraseña" runat="server" for="txtPass" CssClass="form-label"/>
            <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" REQUIRED />
        </div>
        <div class="col-12 mb-3">
            <asp:Button Text="Ingresar" runat="server" ID="btnLogin" CssClass="btn btn-primary" OnClick="btnLogin_Click"/>
        </div>
    </div>
</asp:Content>
