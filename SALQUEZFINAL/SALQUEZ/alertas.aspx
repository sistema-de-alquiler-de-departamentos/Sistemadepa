<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="alertas.aspx.cs" Inherits="SALQUEZ.alertas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="bg-light">



   

    <main role="main" class="container">
       
      <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-danger rounded box-shadow">
        <img class="mr-3" src="Img/notificacion.png" alt="" width="48" height="48">
        <div class="lh-100">
          <h5 class="mb-0 text-white lh-100">Estas son tus notificaciones</h5>
          <small>Notificaciones al dia de hoy</small>
        </div>
      </div>
        
      <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">Quiero que me llamen</h6>

           <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate>

        <div class="media text-muted pt-3">
          <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"/><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <div class="d-flex justify-content-between align-items-center w-100">
              <strong class="text-gray-dark"><%#Eval("Nombre")%></strong>
              
            </div>
            <span class="d-block">Email:  <%#Eval("Email")%>, Telefono:  <%#Eval("Telefono")%></span>
              <a href="#">Atendido</a>&nbsp
              <a><asp:LinkButton ID="lnkveranuncio" runat="server" CommandName="Veranuncio" CommandArgument='<%#Eval("IDInmueble")%>'>Ver anuncio</asp:LinkButton></a>&nbsp
              <a><asp:LinkButton ID="lnkllamar" runat="server" OnClick="lnkllamar_Click" CommandName="Vernumero" CommandArgument='<%#Eval("IDInmueble")%>'>Llamar</asp:LinkButton></a>
          </div>
        </div>
        </ItemTemplate>
            </asp:Repeater>

        <small class="d-block text-right mt-3">
          <a href="#">Notificaciones de: quiero que me llamen</a>
        </small>
      </div>

   <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h6 class="border-bottom border-gray pb-2 mb-0">Mensajes recibidos</h6>
        <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
    <div class="media text-muted pt-3">
     <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"/><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
      <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
        <strong class="d-block text-gray-dark"><%#Eval("Nombre")%></strong>
          <span class="d-block">Email:  <%#Eval("Email")%>, Telefono:  <%#Eval("Telefono")%></span>
        <span class="d-block">Mensaje: <%#Eval("Mensaje")%></span>
          <a href="#">Atendido</a>&nbsp
          <a><asp:LinkButton ID="lnkveranuncio" runat="server" CommandName="Veranuncio2" CommandArgument='<%#Eval("IDInmueble")%>'>Ver anuncio</asp:LinkButton></a>&nbsp
           <a><asp:LinkButton ID="lnkresponderconsulta" runat="server" OnClick="lnkresponderconsulta_Click" CommandName="ResponderConsulta" CommandArgument='<%#Eval("IDInmueble")%>'>Responder Consulta</asp:LinkButton></a>
      </p>
    </div>
    </ItemTemplate>
            </asp:Repeater>
   
    <small class="d-block text-right mt-3">
      <a href="#">Notificaciones de: consultas</a>
    </small>
  </div>
    </main>
</div>
    <!-- Modals de bootrap -->
    <!-- Contactar -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="True">
                 <ContentTemplate>
                         <!-- Modal -->
                <div class="modal fade" id="myModalConsulta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">Responder Mensaje</h5>
        <asp:HyperLink ID="HyperLink1" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
                      <div class="form-group col-md-12">
                <asp:Label ID="lblemailconsulta" runat="server" Text="Ingrese su Email:" CssClass="col-form-label"></asp:Label>
                
            </div></div>
                    <div class="form-row">
                      <div class="form-group col-md-12">
                <asp:Label ID="lblmensajeconsulta" runat="server" Text="Nombre:" CssClass="col-form-label"></asp:Label>
                
            </div>
                      <div class="form-group col-md-12">
                <asp:TextBox ID="txtmensajeconsulta" runat="server" CssClass="form-control" PlaceHolder="Ingrese Mensaje"></asp:TextBox>
            </div>
            
                  </div>
                     

      
        <div class="modal-footer">
       
      
        <asp:Button ID="btncerrarconsulta" runat="server" Text="Close" CssClass="btn btn-info" OnClick="btncerrarconsulta_Click"/>
            
        <asp:Button ID="btnenviarconsulta" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnenviarconsulta_Click"/>
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div></div>




                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">¡Llamar!</h5>
        <asp:HyperLink ID="HyperLink3" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
                      
                   
                          <div class="form-group col-md-12 text-center">
              <asp:LinkButton ID="linktelefonocontacto" runat="server"> <asp:Label ID="lbltelefonocontacto" runat="server" Text="" CssClass="col-form-label"></asp:Label></asp:LinkButton>
        
            </div>
                     </div>
                    
                   

                  
                     

      
        <div class="modal-footer">
       
            <asp:Button ID="btncerrar" runat="server" Text="Close" CssClass="btn btn-info" OnClick="btncerrar_Click"/>
       
            
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div></div>
                      </ContentTemplate>
          <Triggers>
      <asp:PostBackTrigger ControlID="btncerrar" />
              <asp:PostBackTrigger ControlID="btncerrarconsulta" />
 <%--<asp:PostBackTrigger ControlID="btnenviar_Click" />--%>
               
   </Triggers>
                    </asp:UpdatePanel>


</asp:Content>
