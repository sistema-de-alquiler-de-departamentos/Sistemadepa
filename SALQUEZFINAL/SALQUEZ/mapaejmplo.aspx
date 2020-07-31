<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mapaejmplo.aspx.cs" Inherits="SALQUEZ.mapaejmplo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      
   <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>

    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyD1RPWOBWO9-7KixUMIj5_N2krY6U4H264"></script>
    <script src="Scripts/locationpicker.jquery.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
 
</head>
<body>

    
<button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default" >Seleccionar Ubicacion</button>
    <form id="form1" runat="server">
        <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog" >
<style>.pac-container { z-index: 99999; }</style>
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-body">
<div class="form-horizontal">
<div class="form-group">
<label class="col-sm-2 control-label">Ubicación:</label>
<div class="col-sm-9">
<asp:TextBox ID="ModalMapadress" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="col-sm-1">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
</div>
<div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>
<div class="clearfix">&nbsp;</div>
<div class="m-t-small">
<label class="p-r-small col-sm-1 control-label">Lat.:</label>
<div class="col-sm-3">
 <asp:TextBox ID="latitud" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<label class="p-r-small col-sm-2 control-label">Long.:</label>

<div class="col-sm-3">
    <asp:TextBox ID="longitud" runat="server" CssClass="form-control"></asp:TextBox>
</div>
<div class="col-sm-3">
<button type="button" class="btn btn-primary btn-block" data-dismiss="modal" >Aceptar</button>
</div>

</div>
<div class="clearfix"></div>
<script>
    $('#ModalMapPreview').locationpicker({
        radius: 0,
        location: {
            latitude: -12.0681,
            longitude: -75.2106
        },
        enableAutocomplete: true,
        inputBinding: {
            latitudeInput: $('#latitud'),
            longitudeInput: $('#longitud'),
            locationNameInput: $('#ModalMapadress')
        },
        
        onchanged: function (currentLocation, radius, isMarkerDropped) {
            $('#ubicacion').html($('#ModalMapadress').val());
        }
    });
    $('#ModalMap').on('shown.bs.modal', function () {
        $('#ModalMapPreview').locationpicker('autosize');
    });
</script>
</div>
</div>
</div>
</div></div>
    </form>
</body>
</html>
