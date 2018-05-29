<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroVuelo.aspx.cs" Inherits="prjGestionVuelos.frmVuelo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div id="page-content-RegistroVuelo">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del nuevo Vuelo</h2>
                <br /><br/>
                                    
                <form id="frmRegistroVuelo" runat="server">
                    <asp:textbox id="txtCodVuelo" runat="server" cssclass="form-control" placeholder="Indique un código para el nuevo Vuelo" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtAvion" runat="server" CssClass="form-control" placeholder="Ingrese el código del avión" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtPiloto" runat="server"  CssClass="form-control" placeholder="Ingrese el código del piloto" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtFechaPartida" runat="server" TextMode="DateTimeLocal" CssClass="form-control" placeholder="Indique la fecha de partida" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtFechaLlegada" runat="server" TextMode="DateTimeLocal" CssClass="form-control" placeholder="Indique la fecha de llegada" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtCantPlazasVacias" runat="server"  CssClass="form-control" placeholder="Indique la cantidad de plazas vacias" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroV" runat="server" CssClass="btn btn-success btn-lg btn-block" Text="Registrar nuevo Vuelo" OnClick="btnRegistroV_Click" />
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
