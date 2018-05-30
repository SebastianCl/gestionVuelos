<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmAero_LineaAe.aspx.cs" Inherits="prjGestionVuelos.frmAero_LineaAe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-AsignacionAero_LineaAe">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		     <h2>Asignación de Aerolineas a Aeropuertos</h2>
                <br /><br/>
                                    
                <form id="frmAsignacionAero_LineaAe" runat="server">
                    <span><b>AEROPUERTO </b></span>
                    <asp:TextBox ID="txtCodRAeropuerto" runat="server"  CssClass="form-control" placeholder="Digite el código del AEROPUERTO" MaxLength="10"></asp:TextBox>
                    <br />   
                    <span><b>LINEA AEREA </b></span>                 
                    <asp:TextBox ID="txtCodRLineaAerea" runat="server" CssClass="form-control" placeholder="Digite el código de la LINEA AEREA" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:Button ID="btnAsignacionAL" runat="server" CssClass="btn btn-danger btn-lg btn-block" Text="Asignar" OnClick="btnAsignacionAL_Click" />
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
