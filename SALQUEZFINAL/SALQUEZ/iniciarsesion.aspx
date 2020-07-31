<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="iniciarsesion.aspx.cs" Inherits="SALQUEZ.iniciarsesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    


     <div class="card text-center">
  <div class="card-header">
    Ingresa a tu cuenta.
  </div>
</div>
    
         


        <div class="sesion-body text-center">
  

      <div class="form-signin">
      <img class="mb-4" src="Img/logo_sesion.png" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesion</h1>

           <asp:Panel ID="Panel1" runat="server">
      <div class="form-group">
      <asp:Button ID="btniniciarfb" runat="server"  Text="Continuar con Facebook" CssClass="btn btn-lg btn-primary" OnClick="btniniciar_sesion_Click" ValidationGroup="Panel1" />
      </div>

      <div class="form-group">

      <asp:Label ID="lblusuario" runat="server" Text="Usuario:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtusuario" runat="server" CssClass="form-control" placeholder="Ingrese Usuario" />
 
     </div>
       

      <div class="form-group">
      <asp:Label ID="lblcontraseña" runat="server" Text="Contraseña:" CssClass="col-sm-4 col-form-label"></asp:Label>
      <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese Contraseña"></asp:TextBox>
    
      </div>

      <div class="form-group">
      <asp:Button ID="btniniciar_sesion" runat="server"  Text="Iniciar sesion" CssClass="btn btn-lg btn-warning" OnClick="btniniciar_sesion_Click" ValidationGroup="Panel1" />
      </div>
             <p class="mt-5 mb-3 text-muted">&copy; SALQUEZ-Huancayo</p>

      <br />

           </asp:Panel>

      
      <asp:Label ID="lblapellido" runat="server"></asp:Label>
      <asp:Label ID="lblidusuario" runat="server" Visible="False"></asp:Label>
      <br />
      <asp:Label ID="lbltipo_de_usuario" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblnombre" runat="server" Visible="False"></asp:Label>


      <asp:Label ID="lblarea" runat="server" Visible="False"></asp:Label>


      <asp:Label ID="lblidarea" runat="server" Visible="False"></asp:Label>


      <br />

  
    </div>
    </div>

</asp:Content>
