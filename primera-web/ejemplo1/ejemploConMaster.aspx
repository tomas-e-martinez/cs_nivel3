<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ejemploConMaster.aspx.cs" Inherits="ejemplo1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Ejemplo con master</h1>

    <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
    <asp:Button ID="btnAceptar" runat="server" Text="OK" OnClick="btnAceptar_Click" />
    <asp:Label Text="" ID="lblSaludo" runat="server"></asp:Label>
</asp:Content>
