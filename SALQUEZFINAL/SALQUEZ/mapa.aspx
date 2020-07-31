<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="mapa.aspx.cs" Inherits="SALQUEZ.mapa" %>
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

    
    <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default" >Seleccionar Ubicacion</button>
 
       
    <asp:TextBox ID="latitud" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:TextBox ID="longitud" runat="server" CssClass="form-control"></asp:TextBox>

    <asp:TextBox ID="ModalMapadress" runat="server" CssClass="form-control"></asp:TextBox>
    <div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>


<div class="clearfix"></div>
<script>
    $jq('#ModalMapPreview').locationpicker({
        radius: 0,
        location: {
            latitude: -12.0681,
            longitude: -75.2106
        },
        enableAutocomplete: true,
        inputBinding: {
            latitudeInput: $jq('#<%=latitud.ClientID%>'),
            longitudeInput: $jq('#<%=longitud.ClientID%>'),
            locationNameInput: $jq('#<%=ModalMapadress.ClientID%>')
        },
        
        onchanged: function (currentLocation, radius, isMarkerDropped) {
            $jq('#ubicacion').html($jq('#<%=ModalMapadress.ClientID%>').val());
            $jq('#ModalMapPreview').locationpicker('autosize');

        }
         
    });
  
    
</script>

    


    

    
</asp:Content>
