<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmPiloto.aspx.cs" Inherits="prjGestionVuelos.frmPiloto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-RegistroUsuario">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del nuevo Piloto</h2>
                <br /><br/>

                <form id="frmRegistroUsuario" runat="server">
                    <asp:textbox id="txtIDPiloto" runat="server" textmode="Number" cssclass="form-control" placeholder="Identificación"></asp:textbox>
                    <br />
                    <asp:textbox id="txtNickPiloto" runat="server" cssclass="form-control" placeholder="Nombre de usuario"></asp:textbox>
                    <br />
                    <asp:textbox id="txtClavePiloto" runat="server" textmode="Password" cssclass="form-control" placeholder="Ingrese una clave (max 10)"></asp:textbox>
                    <br />
                    <asp:textbox id="txtNombrePiloto" runat="server" cssclass="form-control" placeholder="Nombre completo"></asp:textbox>
                    <br />
                    <asp:textbox id="txtCiudadPiloto" runat="server" cssclass="form-control" placeholder="Ingrese la ciudad local del piloto"></asp:textbox>
                    <br />
                    <asp:textbox id="txtDirPiloto" runat="server" cssclass="form-control" placeholder="Ingrese la dirección local del piloto"></asp:textbox>
                    <br />
                    <asp:textbox id="txtTelPiloto" runat="server" cssclass="form-control" placeholder="Ingrese el número de telefono del piloto"></asp:textbox>
                    <br />
                    <asp:textbox id="txtCodLineaAerea" runat="server" cssclass="form-control" placeholder="Ingrese la linea aerea a la que pertenece el piloto"></asp:textbox>
                    <br />
                    <asp:button id="btnRegistroP" runat="server" cssclass="btn btn-primary btn-lg btn-block" text="Registrar nuevo piloto" OnClick="btnRegistroP_Click" />
                </form>
                <br /><br />
                    <asp:Panel ID="pnlAlerta" runat="server">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="alert alert-info alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <asp:Label ID="lblMensaje" runat="server" CssClass="text-center" ForeColor="#8B8787" ></asp:Label>
                            </div>
                        </div>  	
                    </asp:Panel>


              </div>   
            <div class="col-xs-12 col-md-2">
            </div>         
    </div>
        </div>
    </div>
</asp:Content>
