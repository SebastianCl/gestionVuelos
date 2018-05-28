<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroAeropuerto.aspx.cs" Inherits="prjGestionVuelos.frmRegistroAeropuerto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-RegistroAeropuerto">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del nuevo Aeropuerto</h2>
                <br /><br/>
                                    
                <form id="frmRegistroAeropuerto" runat="server">
                    <asp:textbox id="txtCodAeropuerto" runat="server" cssclass="form-control" placeholder="Ingrese el codigo del Aeropuerto" MaxLength="10"></asp:TextBox>
                    <%--<br />--%>                    
                    <asp:TextBox ID="txtNombreAeropuerto" runat="server" CssClass="form-control" placeholder="Nombre del Aeropuerto" MaxLength="30"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtPaisAeropuerto" runat="server"  CssClass="form-control" placeholder="Ingrese el pais del Aeropuerto" MaxLength="30"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtCiudadAeropuerto" runat="server"  CssClass="form-control" placeholder="Ingrese la ciudad del Aeropuerto" MaxLength="30"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtDirAeropuerto" runat="server"  CssClass="form-control" placeholder="Ingrese la dirección del Aeropuerto" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtTelAeropuerto" runat="server"  CssClass="form-control" placeholder="Ingrese el telefono del Aeropuerto" MaxLength="50"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroAe" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nuevo Aeropuerto" OnClick="btnRegistroAe_Click" />
                </form>
                <br /><br />
                    <asp:Panel ID="pnlAlerta" runat="server">
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <div class="alert alert-info alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <asp:Label ID="lblMensaje" runat="server" CssClass="text-center" ForeColor="#000000"></asp:Label>
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
