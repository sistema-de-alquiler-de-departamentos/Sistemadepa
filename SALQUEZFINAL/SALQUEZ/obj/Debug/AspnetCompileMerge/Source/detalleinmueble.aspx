<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="detalleinmueble.aspx.cs" Inherits="SALQUEZ.detalleinmueble" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>
        var $jq = jQuery.noConflict();
        window.jQuery = $jq;
        </script>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyD1RPWOBWO9-7KixUMIj5_N2krY6U4H264"></script>
    <script src="Scripts/locationpicker.jquery.js"></script>
    <div class="container gallery-container ">
    <div class="tz-gallery">

        <div class="row">
            <%--<div class="col-sm-6 col-md-4">
                <a class="lightbox" href="Img/Inmuebles/park.jpg">
                    <img src="Img/Inmuebles/park.jpg" alt="Park">
                </a>
            </div>
            <div class="col-sm-6 col-md-4">
                <a class="lightbox" href="Img/Inmuebles/bridge.jpg">
                    <img src="Img/Inmuebles/bridge.jpg" alt="Bridge">
                </a>
            </div>--%>
             <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate>
            <div class="col-sm-6 col-md-4">
                <a class="lightbox" href="<%#Eval("Imagen")%>">
                    <img src="<%#Eval("Imagen")%>" alt="Tunnel">
                </a>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

                    <div class="col-sm-6 col-md-4">
                <a class="lightbox" href="<%#Eval("Imagen2")%>">
                    <img src="<%#Eval("Imagen2")%>" alt="Tunnel">
                </a>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

                    <div class="col-sm-6 col-md-4">
                <a class="lightbox" href="<%#Eval("Imagen3")%>">
                    <img src="<%#Eval("Imagen3")%>" alt="Tunnel">
                </a>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                     </ItemTemplate>
                        </asp:Repeater>


           <div class="col-sm-12 col-md-12">
       <asp:Label ID="lblestado" runat="server" Text="Label" Visible="false"></asp:Label>
               <asp:Label ID="lblidfavoritos" runat="server" Text="Label" Visible="false"></asp:Label>
       <asp:Button ID="btnfavoritos" runat="server" Text="Agregar a favoritos <3" CssClass="btn btn-danger float-right" OnClick="btnfavoritos_Click" />
           
        <asp:Button ID="btndesagregar" runat="server" Text="Desagregar <3" CssClass="btn btn-secondary float-right" OnClick="btndesagregar_Click" Visible="false"/></div>
        </div>
         
    </div>
       
        <asp:Label ID="lblidusuario" runat="server" Text="" Visible="false"></asp:Label>
        <div class="container containermaxwid">
           
      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Datos del inmueble</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Tipo de Inmueble</h6>
                <small class="text-muted"><asp:Label ID="lbltipoinmueble" runat="server" Text=""></asp:Label></small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Tipo de Operación</h6>
                <small class="text-muted"><asp:Label ID="lbltipooperacion" runat="server" Text=""></asp:Label></small>
              </div>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Fecha Publicación</h6>
                <small class="text-muted"><asp:Label ID="lblfechapublicacion" runat="server" Text=""></asp:Label></small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Dormitorios</h6>
              </div>
              <span class="text-muted"><asp:Label ID="lbldormitorios" runat="server" Text=""></asp:Label></span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Baños</h6>
              </div>
              <span class="text-muted"><asp:Label ID="lblbaños" runat="server" Text=""></asp:Label></span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Superficie m2</h6>
              </div>
              <span class="text-muted">
                  <asp:Label ID="lblsuperficie" runat="server" Text="Label"></asp:Label></span>
            </li>
        
            <li class="list-group-item d-flex justify-content-between">
              <span>Precio</span>
              <strong>
                <asp:Label ID="lblprecio" runat="server" Text=""></asp:Label></strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <div class="input-group-append">
                <button type="submit" class="btn btn-warning">WhatsApp</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3"><asp:Label ID="lblnombre" runat="server" Text=""></asp:Label></h4>
          <div class="row">
              <div class="col-md-12">
            <p><asp:Label ID="lbldescripcion" runat="server" Text=""></asp:Label></p>
                  
          </div>
         
          </div>
            <h5 class="mb-3">Ubicación</h5>
            Ubicación
            <div class="row">
              <div class="col-md-12">
            <p><asp:Label ID="lblubicacion" runat="server" Text=""></asp:Label>, <asp:Label ID="lbldepartamento" runat="server" Text=""></asp:Label> , <asp:Label ID="lblprovincia" runat="server" Text=""></asp:Label>, <asp:Label ID="lbldistrito" runat="server" Text=""></asp:Label></p>
          </div>
         
          </div>
             <div class="row">
              <div class="col-md-4">
            <p> <asp:Button ID="btnllamar" runat="server" Text="Llamenme" CssClass="btn btn-warning" OnClick="btnllamar_Click"/></p>
          </div>
                 <div class="col-md-4">
            <p><asp:Button ID="btnconsulta" runat="server" Text="Enviar Consulta" CssClass="btn btn-warning" OnClick="btnconsulta_Click"/></p>
                     
          </div>
                 <div class="col-md-4">
            <p><asp:Button ID="btntelefono" runat="server" Text="Contactar-Telefono" CssClass="btn btn-warning" OnClick="btntelefono_Click" /></p>
          </div>
         
          </div>
             <hr class="mb-4">

            <div class="row">
                
                <input type="text" name="num"  id="latitud" runat="server"  size="20" style="display:none"/>
                 <input type="text" name="num"  id="longitud" runat="server"  size="20" style="display:none"/>
                 <h5 class="mb-3">Ubicacion en el Mapa</h5>
                <div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>
            </div>



        </div>
      </div></div>
            
      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Nameclass="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
        </div>

<!-- Modals de bootrap -->
    <!-- Quiero que me llamen -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanelTop" UpdateMode="Conditional" ChildrenAsTriggers="True">
                 <ContentTemplate>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">Quiero que me llamen</h5>
        <asp:HyperLink ID="HyperLink1" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
                      <div class="form-group col-md-12">
                <asp:Label ID="lblemail" runat="server" Text="Ingrese su Email:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtemailllamar" runat="server" CssClass="form-control" PlaceHolder="Ingrese su email"></asp:TextBox>
            </div></div>
                    <div class="form-row">
                      <div class="form-group col-md-6">
                <asp:Label ID="lblnombrellamar" runat="server" Text="Nombre:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtnombrellamar" runat="server" CssClass="form-control" PlaceHolder="Ingrese Nombre"></asp:TextBox>
            </div>
                      <div class="form-group col-md-6">
                <asp:Label ID="lbltelefonollamar" runat="server" Text="Telefono:" CssClass="col-form-label" ></asp:Label>
                <asp:TextBox ID="txttelefonollamar" runat="server" CssClass="form-control" PlaceHolder="Ingrese Telefono"></asp:TextBox>
            </div>
            
                  </div>
                     

      
        <div class="modal-footer">
       
      
       <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
            
        <asp:Button ID="btnenviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnenviar_Click" />
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div></div>
                      

    <!-- Modals de bootrap -->
    <!-- Enviar Consulta -->
  
   
                <!-- Modal -->
                <div class="modal fade" id="myModalConsulta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">Enviar Consulta</h5>
        <asp:HyperLink ID="HyperLink2" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
                      <div class="form-group col-md-12">
                <asp:Label ID="Label1" runat="server" Text="Ingrese su Email:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtemailconsulta" runat="server" CssClass="form-control" PlaceHolder="Ingrese su email"></asp:TextBox>
            </div></div>
                    <div class="form-row">
                      <div class="form-group col-md-6">
                <asp:Label ID="Label2" runat="server" Text="Nombre:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtnombreconsulta" runat="server" CssClass="form-control" PlaceHolder="Ingrese Nombre"></asp:TextBox>
            </div>
                      <div class="form-group col-md-6">
                <asp:Label ID="Label3" runat="server" Text="Telefono:" CssClass="col-form-label" ></asp:Label>
                <asp:TextBox ID="txttelefonoconsulta" runat="server" CssClass="form-control" PlaceHolder="Ingrese Telefono"></asp:TextBox>
            </div>
            
                  </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                <asp:Label ID="Label4" runat="server" Text="Mensaje:" CssClass="col-form-label" ></asp:Label>
                <asp:TextBox ID="txtmensajeconsulta" runat="server" CssClass="form-control" PlaceHolder="Ingrese Telefono"></asp:TextBox>
            </div>
                    </div>
                     

      
        <div class="modal-footer">
       
      
       <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
            
        <asp:Button ID="btnenviarconsulta" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnenviarconsulta_Click" />
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div></div>
                      
                    </ContentTemplate>
          <Triggers>
      <asp:PostBackTrigger ControlID="btnenviar" />
              <asp:PostBackTrigger ControlID="btnenviarconsulta" />
               
   </Triggers>
                    </asp:UpdatePanel>

    <!-- Modals de bootrap -->
    <!-- Contactar -->
  
    <asp:UpdatePanel runat="server" ID="updatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="True">
                 <ContentTemplate>
                <!-- Modal -->
                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">¡Llamar ahora!</h5>
        <asp:HyperLink ID="HyperLink3" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
                      <div class="form-group col-md-12 text-center">
                <h6><asp:Label ID="lblnombreinmueble" runat="server" Text="Jesus Christian" CssClass="col-form-label"></asp:Label></h6>
                            <div class="form-group col-md-12 text-center">
                <asp:Label ID="lbldireccioninmueble" runat="server" Text="Jesus Christian" CssClass="col-form-label"></asp:Label>

            </div>
                          <div class="form-group col-md-12 text-center">
              <asp:LinkButton ID="linktelefonocontacto" runat="server"> <asp:Label ID="lbltelefonocontacto" runat="server" Text="9432432234" CssClass="col-form-label"></asp:Label></asp:LinkButton>
            </div>
            </div></div>
                    
                   

                  
                     

      
        <div class="modal-footer">
       
      
       <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
            
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div></div>
                      </ContentTemplate>
          <Triggers>
      <asp:PostBackTrigger ControlID="btnenviar" />
               
   </Triggers>
                    </asp:UpdatePanel>


<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
    <script>
        $jq('#ModalMapPreview').locationpicker({
            radius: 0,
            location: {
                latitude: $jq('#<%=latitud.ClientID%>').val(),
                longitude: $jq('#<%=longitud.ClientID%>').val()
                <%--latitude: $jq('#<%=lbllatitud.ClientID%>'),
                longitude: $jq('#<%=lbllongitud.ClientID%>')--%>
            },
            enableAutocomplete: true,

        onchanged: function (currentLocation, radius, isMarkerDropped) {
            $jq('#ModalMapPreview').locationpicker('autosize');

        }

    });


</script>

 
</asp:Content>
