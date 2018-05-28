<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroPlanVuelo.aspx.cs" Inherits="prjGestionVuelos.frmRegistroPlanVuelo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-content-RegistroPlanVuelo">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del Plan Vuelo</h2>
                <br /><br/>
                                    
                <form id="frmRegistroPlanVuelo" runat="server">
                    <asp:TextBox ID="txtPlanVuelo" runat="server"  CssClass="form-control" placeholder="Asigne un codigo al plan de vuelo" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtCodVuelo" runat="server" CssClass="form-control" placeholder="Ingrese el código de vuelo" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtCodLineaA" runat="server" CssClass="form-control" placeholder="Ingrese el código de la linea aerea" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtCodEscalaT" runat="server" CssClass="form-control" placeholder="Ingrese el código de la escala técnica" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtAeroPartida" runat="server" CssClass="form-control" placeholder="Ingrese el código del Aeropuerto de partida" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtAeroLlegada" runat="server" CssClass="form-control" placeholder="Ingrese el código del Aeropuerto de destino" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroPV" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nuevo Plan de Vuelo" OnClick="btnRegistroPV_Click"/>
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
