<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SALQUEZ.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <main role="main">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
         <img src="Img/Carousel/feature9.jpg" alt="New York" class="bd-placeholder-img" width="100" height="100"/>
          <div class="container">
          <div class="carousel-caption">
            <h1>DEPARTAMENTO PERFECTO.</h1>
               <p> Publica tu inmueble | Venta y Alquiler de Casas y Departamentos</p>
            <p><a class="btn btn-lg btn-warning" href="#" role="button">Publicar</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <img src="Img/Carousel/feature7.jpg" alt="New York" class="bd-placeholder-img" width="100" height="100"/>
        <div class="container">
          <div class="carousel-caption">
            <h1>ENCUENTRA TU CASA PERFECTA.</h1>
            <p> Publica tu inmueble | Venta y Alquiler de Casas y Departamentos</p>
            <p><a class="btn btn-lg btn-warning" href="#" role="button">Publicar</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
         <img src="Img/Carousel/hero5.jpg" alt="New York" class="bd-placeholder-img" width="100" height="100"/>
        <div class="container">
          <div class="carousel-caption <%--text-right--%>">
            <h1>DEPARTAMENTOS CÓMODOS.</h1>
            <p>Publica tu inmueble | Venta y Alquiler de Casas y Departamentos</p>
            <p><a class="btn btn-lg btn-warning" href="#" role="button">Publicar</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</main>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:UpdatePanel runat="server" ID="updatePanel" UpdateMode="Conditional" ChildrenAsTriggers="True">
          <ContentTemplate>
    <div class="container p-3 my-3 bg-dark text-white">
        
    <h3 style="text-align:center;">BUSCAR</h3>
    <p class="lead">Use el formulario para buscar un departamento y/o casa</p>
  
        <div class="form">
             <div class="form-row">
               <div class="form-group col-md-3">
                <asp:TextBox ID="txtubicacion" runat="server" CssClass="form-control" PlaceHolder="Palabra Clave"></asp:TextBox>
               </div>
              <div class="form-group col-md-3">
               <asp:DropDownList ID="cmbdepartamento" runat="server"  CssClass="form-control" OnSelectedIndexChanged="cmbdepartamento_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
               </div>
              <div class="form-group col-md-3">
               <asp:DropDownList ID="cmbprovincia" runat="server"  CssClass="form-control" OnSelectedIndexChanged="cmbprovincia_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
               </div>
            <div class="form-group col-md-3">
               <asp:DropDownList ID="cmbdistrito" runat="server"  CssClass="form-control"  AutoPostBack="True"></asp:DropDownList>
               </div>
             </div>
          </div>
        <br />
        <div class="row">
            <div class="col-md-2">
               <asp:DropDownList ID="cmbdormitorios" runat="server"  CssClass="form-control">
                   <asp:ListItem Value="0">--Dormitorios--</asp:ListItem>
                   <asp:ListItem>1</asp:ListItem>
                   <asp:ListItem>2</asp:ListItem>
                   <asp:ListItem>3</asp:ListItem>
                   <asp:ListItem>4</asp:ListItem>
                   <asp:ListItem>5</asp:ListItem>
                   <asp:ListItem>6</asp:ListItem>
                   <asp:ListItem>7</asp:ListItem>
                   <asp:ListItem>8</asp:ListItem>
                </asp:DropDownList>
               </div>
            <div class="col-md-2">
               <asp:DropDownList ID="cmbbaños" runat="server"  CssClass="form-control">
                   <asp:ListItem Value="0">--Baños--</asp:ListItem>
                   <asp:ListItem>1</asp:ListItem>
                   <asp:ListItem>2</asp:ListItem>
                   <asp:ListItem>3</asp:ListItem>
                   <asp:ListItem>4</asp:ListItem>
                   <asp:ListItem>5</asp:ListItem>
                   <asp:ListItem>6</asp:ListItem>
                   <asp:ListItem>7</asp:ListItem>
                   <asp:ListItem>8</asp:ListItem>
                   <asp:ListItem>9</asp:ListItem>
                </asp:DropDownList>
               </div>
            <div class="col-md-3">
                <asp:DropDownList ID="cmboperacion" runat="server"  CssClass="form-control">
                   <asp:ListItem Value="0">--Seleccionar Operacion--</asp:ListItem>
                   <asp:ListItem Value="1">Alquiler</asp:ListItem>
                   <asp:ListItem Value="2">Venta</asp:ListItem>
                   
                </asp:DropDownList>
                </div>
            <div class="col-md-3">
                <asp:DropDownList ID="cmbtipoinmueble" runat="server"  CssClass="form-control">
                   <asp:ListItem Value="0">--Seleccionar Tipo Inmueble--</asp:ListItem>
                   <asp:ListItem Value="1">Departamento</asp:ListItem>
                   <asp:ListItem Value="2">Casa</asp:ListItem>
                   
                </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnbuscar" runat="server" Text="Buscar" CssClass="btn btn-warning" OnClick="btnbuscar_Click" />
               </div>

        </div>
    </div>
    <hr class="featurette-divider">
    <asp:Label ID="idinmueble" runat="server" Text="Label" Visible="false"></asp:Label>
      <div class="container">
          


      <div class="row">
           <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate>
                    
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
               <div class="card-header">
        <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="btndetalleinmueble_Click">--%>
                   <h4 class="my-0 font-weight-normal text-center">S/.<%#Eval("Precio")%></h4>
                  <%-- </asp:LinkButton>--%>
      </div>
            <img src="<%#Eval("Imagen")%>" alt="Imagen depa" class="bd-placeholder-img card-img-top" width="100" height="225"/>
            <div class="card-body">
                <h5 style="background-color:goldenrod;border-radius:1em;text-align:center"><span><%#Eval("TipoOperacion")%>: <%#Eval("TipoInmueble")%></span></h5>
                <h5><span><%#Eval("Nombre")%></span></h5>
                <h5><small class="text-muted"><%#Eval("Departamento")%>, <%#Eval("Provincia")%>, <%#Eval("Distrito")%></small></h5>
                <h5><small class="text-muted"><%#Eval("Ubicacion")%></small></h5>
              <p class="card-text overflow ellipsis"><%#Eval("Descripcion")%></p>
                <div class="row">
                <div class="col-4">
                <small class="text-muted"><strong>Cuartos: <%#Eval("Dormitorios")%></strong></small>
                </div>
                <div class="col-4">
                <small class="text-muted"><strong>Baños: <%#Eval("Baños")%></strong></small>
                </div>
                <div class="col-4">
                <small class="text-muted"><strong>Superficie: <%#Eval("Superficie")%></strong></small>
                </div>
                </div><br />
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                    <asp:button runat="server" CommandName="Contactar" CommandArgument='<%#Eval("IDInmueble")%>' class="btn btn-sm btn-outline-secondary" Text="Información"></asp:button>
                
                    
                </div>
                  
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
                     </ItemTemplate>
                        </asp:Repeater>
             
       <%-- <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>--%>

        
       
      </div>
    </div>
    </ContentTemplate>
         
                    </asp:UpdatePanel>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2020 BuscaTuHogar.ga</p>
            <ul>
          <%--<li class="list-inline-item"><a href="#"></a></li>--%>
          <li class="list-inline-item"><a href="politicadeprivacidad.aspx">Politicas de privacidad</a></li>
          <li class="list-inline-item"><a href="#">Soporte</a></li>
       </ul>
      </footer>
</asp:Content>
