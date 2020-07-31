<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="publicarinmueble.aspx.cs" Inherits="SALQUEZ.PublicarDepa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
              <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script>
        var $jq = jQuery.noConflict();
        window.jQuery = $jq;
        </script>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyD1RPWOBWO9-7KixUMIj5_N2krY6U4H264"></script>
    <script src="Scripts/locationpicker.jquery.js"></script>

        <div class="container">
  <div class="py-5 text-center">
    <h2>Publicar Departamentos</h2>
    <p class="lead">Rellene el siguiente formulario.</p>
  </div>
             <div class="form">
                 <div class="form-row">
                     <div class="form-group col-md-6">
                  <asp:Label ID="lbltipoinmueble" runat="server" Text="Tipo de inmueble:" CssClass="col-form-label"></asp:Label>
                 <asp:DropDownList ID="cmbtipoinmueble" runat="server" CssClass="form-control">
                    <asp:ListItem>Departamento</asp:ListItem>
                    <asp:ListItem>Casa</asp:ListItem>
                  
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <asp:Label ID="lbltipoperacion" runat="server" Text="Tipo de Operacion:" CssClass="col-form-label"></asp:Label>
                <asp:DropDownList ID="cmbtipoperacion" runat="server" CssClass="form-control">
                    <asp:ListItem>Compra</asp:ListItem>
                    <asp:ListItem>Alquiler</asp:ListItem>
                   
                </asp:DropDownList>
            </div>
            
                 </div>
                 <div class="form-row">
                      <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                 </div>
               <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblnombredepa" runat="server" Text="Nombre del Departamento:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                  <asp:Label ID="lblubicacion" runat="server" Text="Dirección:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtubicacion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                 </div>
                   <div class="form-row">
                 <div class="form-group col-md-4">
                 <asp:Label ID="lblcmbdepartamento" runat="server" Text="Departamento:" CssClass="col-form-label"></asp:Label>
                 <asp:DropDownList ID="cmbdepartamento" runat="server"  CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="cmbdepartamento_SelectedIndexChanged" ></asp:DropDownList>
                  </div>
           
           <div class="form-group col-md-4">
                 <asp:Label ID="lblprovincia" runat="server" Text="Pronvicia:" ></asp:Label>
                 <asp:DropDownList ID="cmbprovincia" runat="server"  CssClass="form-control" OnSelectedIndexChanged="cmbprovincia_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
               </div>

                       <div class="form-group col-md-4">
                 <asp:Label ID="Label1" runat="server" Text="Distrito:" ></asp:Label>
                 <asp:DropDownList ID="cmbdistrito" runat="server"  CssClass="form-control"></asp:DropDownList>
               </div>
                   </div>
                
                 
                  <div class="form-row">
                      <div class="form-group col-md-12">
                <asp:Label ID="lbldescripcion" runat="server" Text="Descripción:" ></asp:Label>
                <asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                  </div>

                 <div class="form-row">
                      <div class="form-group col-md-3">
                <asp:Label ID="lblprecio" runat="server" Text="Precio: S/." CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtprecio" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-3">
                <asp:Label ID="lbldormitorios" runat="server" Text="Nº Dormitorios:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtdormitorios" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-3">
                <asp:Label ID="lblbaños" runat="server" Text="Nº Baños:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtbaños" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-3">
                <asp:Label ID="lblsuperficie" runat="server" Text="Superficie m2:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtsuperficie" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                     
                  </div>
                 <div class="form-row">
                     <div class="form-group col-md-4">
                         <asp:Label ID="Label10" runat="server" Text="Imagen Digital:" CssClass="col-form-label"></asp:Label>
                         <asp:FileUpload ID="fileupload" runat="server" AutoPostBack="True"/>
                     </div>
                     <div class="form-group col-md-4">
                         <asp:Label ID="Label2" runat="server" Text="Imagen Digital2:" CssClass="col-form-label"></asp:Label>
                         <asp:FileUpload ID="fileupload1" runat="server" AutoPostBack="True"/>
                     </div>
                     <div class="form-group col-md-4">
                         <asp:Label ID="Label3" runat="server" Text="Imagen Digital3:" CssClass="col-form-label"></asp:Label>
                         <asp:FileUpload ID="fileupload2" runat="server" AutoPostBack="True"/>
                     </div>
                 </div>

                


                 </div>
               
             <br />
            <asp:Label ID="idver" runat="server" Text="Label" Visible="false"></asp:Label>
        
             
           
   

    </div>
              </ContentTemplate>
        <Triggers>
      <asp:PostBackTrigger ControlID="btnguardar" />
   </Triggers>
        </asp:UpdatePanel> 


    <div class="container">
        <div class="py-1 text-center">
    <p class="lead">Seleccionar el lugar en el mapa.</p>
  </div>
                  <div class="form-row">
                      <div class="form-group col-md-6">
                          <asp:Label ID="lblbuscarmapa" runat="server" Text="Introduce Ubicación:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtbuscarmapa" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                  </div>
                 <div class="form-row">
                      <div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>
                 </div>

                 <div class="form-row">
                      <div class="form-group col-md-2">
                          <asp:Label ID="lbllatitud" runat="server" Text="Latitud:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtlatitud" runat="server" CssClass="form-control"  ></asp:TextBox>
                        
                      </div>
                     <div class="form-group col-md-2">
                          <asp:Label ID="lbllongitud" runat="server" Text="Longitud:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtlongitud" runat="server" CssClass="form-control"  ></asp:TextBox>
                      

                      </div>
                 </div>
         <asp:Button ID="btnguardar" runat="server" Text="Guardar"  CssClass="btn btn-primary" OnClick="btnguardar_Click"    />
        <br />
        <br />
        <br />
    </div>

   <script>
       $jq('#ModalMapPreview').locationpicker({
           radius: 0,
           location: {
               latitude: -12.06809999999998,
               longitude: -75.21008501586913
           },
           enableAutocomplete: true,
           inputBinding: {
               latitudeInput: $jq('#<%=txtlatitud.ClientID%>'),
            longitudeInput: $jq('#<%=txtlongitud.ClientID%>'),
            locationNameInput: $jq('#<%=txtbuscarmapa.ClientID%>')
        },

        onchanged: function (currentLocation, radius, isMarkerDropped) {
            $('#ubicacion').html($jq('#<%=txtbuscarmapa.ClientID%>').val());
            $jq('#ModalMapPreview').locationpicker('autosize');

        }

    });


</script>
     
</asp:Content>
