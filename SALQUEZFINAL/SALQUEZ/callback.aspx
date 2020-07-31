<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="callback.aspx.cs" Inherits="FacebookLogin.callback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       
    <title></title>
    <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $('#btnjesus').click(function () {
                 FB.logout(function (response) {
                     $('#lbmsj').html('Sesión Cerrada');
                     
                 });
             });
         });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <button type="button" id="btnjesus">Jesus</button>
         <label class="control-label">Estado:</label><br />
         <label id="lbmsj" class="control-label"></label>
    </div>
    </form>
     
</body>


  
</html>
