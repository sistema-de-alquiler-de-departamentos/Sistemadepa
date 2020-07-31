<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="mispublicaciones.aspx.cs" Inherits="SALQUEZ.mispublicaciones" %>
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
                     <asp:button runat="server" CommandName="Editar" CommandArgument='<%#Eval("IDInmueble")%>' class="btn btn-sm btn-outline-secondary" Text="Editar"></asp:button>
                    
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

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatePanelTop" UpdateMode="Conditional" ChildrenAsTriggers="True">
                 <ContentTemplate>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                <div class="modal-content">
                 <div class="modal-header">

        <h5 class="modal-title">Editar Publicacion</h5>
        <asp:HyperLink ID="HyperLink1" runat="server"  class="close" data-dismiss="modal" aria-hidden="true" NavigateUrl="~/index.aspx">
          <span aria-hidden="true">&times;</span>
        </asp:HyperLink>
                   
                  
        </div>
        <div class="modal-body">
           
             <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                 <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblidinmueble" runat="server" Text="" CssClass="col-form-label" Visible="false"></asp:Label>
            </div>
            <div class="form-group col-md-6">
                  <asp:Label ID="lblidusuario" runat="server" Text="" CssClass="col-form-label" Visible="false"></asp:Label>
            </div>
                 </div>
        
                  <div class="form-row">
             <div class="form-group col-md-6">
                 <asp:Label ID="lbltipoinmueble" runat="server" Text="Tipo de inmueble:" CssClass="col-form-label"></asp:Label>
                 <asp:DropDownList ID="cmbtipoinmueble" runat="server" CssClass="form-control">
                    <asp:ListItem>Departamento</asp:ListItem>
                    <asp:ListItem>Casa</asp:ListItem>
                    <asp:ListItem>Terreno</asp:ListItem>
                </asp:DropDownList>
             </div>
                  <div class="form-group col-md-6">
                <asp:Label ID="lbltipoperacion" runat="server" Text="Tipo de Operacion:" CssClass="col-form-label"></asp:Label>
                <asp:DropDownList ID="cmbtipoperacion" runat="server" CssClass="form-control">
                    <asp:ListItem>Compra</asp:ListItem>
                    <asp:ListItem>Alquiler</asp:ListItem>
                    <asp:ListItem>Traspaso</asp:ListItem>
                </asp:DropDownList>
            </div></div>
            

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
                 <asp:DropDownList ID="cmbdepartamento" runat="server"  CssClass="form-control"  OnSelectedIndexChanged="cmbdepartamento_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                  </div>
           
           <div class="form-group col-md-4">
                 <asp:Label ID="lblprovincia" runat="server" Text="Pronvicia:" ></asp:Label>
                 <asp:DropDownList ID="cmbprovincia" runat="server"  CssClass="form-control" OnSelectedIndexChanged="cmbprovincia_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
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
                      <div class="form-group col-md-2">
                <asp:Label ID="lblprecio" runat="server" Text="Precio: S/." CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtprecio" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-2">
                <asp:Label ID="lbldormitorios" runat="server" Text="Nº Dormitorios:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtdormitorios" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-2">
                <asp:Label ID="lblbaños" runat="server" Text="Nº Baños: S/." CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtbaños" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                      <div class="form-group col-md-2">
                <asp:Label ID="lblsuperficie" runat="server" Text="Superficie m2:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtsuperficie" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
                   

                     <div class="form-group col-md-4">
                         <asp:Label ID="lblfileupload" runat="server" Text="Imagen Digital:" CssClass="col-form-label"></asp:Label>
                         <asp:FileUpload ID="fileupload" runat="server" AutoPostBack="True"/>
                     </div>
                  </div>
                      <div class="form-group col-md-12">
                <asp:Label ID="lblfecha" runat="server" Text="Fecha:" CssClass="col-form-label"></asp:Label>
                <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

      
        <div class="modal-footer">
       
      
       <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
            
        <asp:Button ID="btneditar" runat="server" Text="Editar" CssClass="btn btn-primary" OnClick="btneditar_Click"/>
      </div></div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div></div></div>
                      </ContentTemplate>
          <Triggers>
      <asp:PostBackTrigger ControlID="btneditar" />
               
   </Triggers>
                    </asp:UpdatePanel>
</asp:Content>
