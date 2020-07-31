<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="favoritos.aspx.cs" Inherits="SALQUEZ.favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="container">
          


      <div class="row">
           <asp:Repeater ID="Repeater" runat="server">
                <ItemTemplate>
                    
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
               <div class="card-header">
        <asp:LinkButton ID="LinkButton1" runat="server">
                   <h4 class="my-0 font-weight-normal text-center">S/.<%#Eval("Precio")%></h4>
                   </asp:LinkButton>
      </div>
            <img src="<%#Eval("Imagen")%>" alt="Imagen depa" class="bd-placeholder-img card-img-top" width="100" height="225"/>
            <div class="card-body">
                <h5><span><%#Eval("Nombre")%></span></h5>
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
</asp:Content>
