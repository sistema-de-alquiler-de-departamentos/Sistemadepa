<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="regisquieropublicar.aspx.cs" Inherits="SALQUEZ.regisquieropublicar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sesion-body text-center">
  

      <div class="form-signin">
      <img class="mb-4" src="Img/logo_sesion.png" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Registrate y empieza a publicar</h1>

           <asp:Panel ID="Panel1" runat="server">
      
      
       <div class="form-group">
       
      <asp:Label ID="lblnombres" runat="server" Text="Nombres:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtnombres" runat="server" CssClass="form-control" placeholder="Nombres" />
 
     </div>
     
      <div class="form-group">
       
      <asp:Label ID="lblapellidos" runat="server" Text="Apellidos:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtapellidos" runat="server" CssClass="form-control" placeholder="Apellidos" />
 
     </div>

      <div class="form-group">
       
      <asp:Label ID="lbldni" runat="server" Text="DNI:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtdni" runat="server" CssClass="form-control" placeholder="DNI" />
 
     </div>
               <div class="form-group">
       
      <asp:Label ID="lbltelefono" runat="server" Text="Teléfono:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txttelefono" runat="server" CssClass="form-control" placeholder="Teléfono" />
 
     </div>
               <div class="form-group">
       
      <asp:Label ID="Label3" runat="server" Text="Dirección:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtdireccion" runat="server" CssClass="form-control" placeholder="Dirección" />
 
     </div>
      <asp:Label ID="Label1" runat="server" Text="Registrate con un Email." CssClass="col-form-label" ></asp:Label>
               <div class="form-group">
       
      <asp:Label ID="lblusuario" runat="server" Text="Email:" CssClass="col-sm-4 col-form-label" ></asp:Label>
      <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email" />
 
     </div>
       

      <div class="form-group">
      <asp:Label ID="lblcontraseña" runat="server" Text="Contraseña:" CssClass="col-sm-4 col-form-label"></asp:Label>
      <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese Contraseña"></asp:TextBox>
    
      </div>

      <div class="form-group">
      <asp:Button ID="btnregistrar" runat="server"  Text="Registrar" CssClass="btn btn-lg btn-warning" ValidationGroup="Panel1" OnClick="btnregistrar_Click" />
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
