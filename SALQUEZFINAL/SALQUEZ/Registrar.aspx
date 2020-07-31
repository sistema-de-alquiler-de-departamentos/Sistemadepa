<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="registrar.aspx.cs" Inherits="SALQUEZ.Publica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
       <div class="row">
           <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Registrate y encuentra tu lugar</h1>
  <p class="lead">En esta sección usted puede registrarse.</p>
</div>

           <div class="container">
  <div class="card-deck mb-3 text-center">
    <div class="card mb-6 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Quiero Buscar</h4>
      </div>
      <div class="card-body">
          <asp:Button ID="btncliente" runat="server" Text="Registrarme" CssClass="btn btn-lg btn-block btn-outline-primary" OnClick="btncliente_Click" />
      </div>
    </div>

       <div class="card mb-6 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Quiero Publicar</h4>
      </div>
      <div class="card-body">
         <asp:Button ID="btnarrendador" runat="server" Text="Registrarme" CssClass="btn btn-lg btn-block btn-outline-primary" OnClick="btnarrendador_Click"  />
      </div>
    </div>
    
   
  </div>
               
                
              
            </div>
        </div>
            </div>
</asp:Content>
