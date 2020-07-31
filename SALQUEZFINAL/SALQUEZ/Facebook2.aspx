<%@ Page Language="C#" MasterPageFile="~/Page2.Master" AutoEventWireup="true" CodeBehind="Facebook2.aspx.cs" Inherits="FacebookLogin.Facebook" %>
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
          
           <a href="#" onclick="loginByFacebook();">Login with Facebook</a>
           <asp:Panel ID="Panel1" runat="server">
      <div class="form-group">
           
         
          
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
      <asp:Button ID="btniniciar_sesion" runat="server"  Text="Iniciar sesion" CssClass="btn btn-lg btn-warning" ValidationGroup="Panel1" />
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
    <div id="fb-root"></div>
    <a href="#" onclick="loginByFacebook();">Login with Facebook</a>
     <a href="#" onclick="logoutByFacebook();">Logout</a> 
    <%-- now this is some required facebook's JS, two things to pay attention to
    1. setting the ApplicationID, To make this project work you have to edit "callback.aspx.cs" and put your facebook-app-key there
    2. Adjust the permissions you want to get from user, set that in scope options below. --%>
    <script type="text/javascript">
        window.fbAsyncInit = function () {
            FB.init({
                appId: '651677645701717',
                status: true, // check login status
                cookie: true, // enable cookies to allow the server to access the session
                xfbml: true, // parse XFBML
                oauth: true // enable OAuth 2.0
            });
        };
        (function () {
            var e = document.createElement('script'); e.async = true;
            e.src = document.location.protocol +
                '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(e);
        }());

        function loginByFacebook() {
            FB.login(function (response) {
                if (response.authResponse) {
                    FacebookLoggedIn(response);
                } else {
                    console.log('User cancelled login or did not fully authorize.');
                }
            }, { scope: 'user_birthday,user_hometown,user_location,email' });
        }

        function FacebookLoggedIn(response) {
            var loc = '/index.aspx';
            if (loc.indexOf('?') > -1)
                window.location = loc + '&authprv=facebook&access_token=' + response.authResponse.accessToken;
            else
                window.location = loc + '?authprv=facebook&access_token=' + response.authResponse.accessToken;
        }






    </script>
    

    </asp:Content>






