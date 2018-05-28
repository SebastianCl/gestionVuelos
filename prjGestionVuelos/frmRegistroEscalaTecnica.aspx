<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroEscalaTecnica.aspx.cs" Inherits="prjGestionVuelos.frmRegistroEscalaTecnica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-RegistroEscalaTecnica">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos de la nueva Escala Técnica</h2>
                <br /><br/>
                                    
                <form id="frmRegistroEscalaTecnica" runat="server">
                    <asp:TextBox ID="txtCodEscalaTecnica" runat="server"  CssClass="form-control" placeholder="Asigne un codigo a la Escala Técnica" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtAeropuerto" runat="server" CssClass="form-control" placeholder="Aeropuerto de escala" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:Button ID="btnRegistroET" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nueva Escala Técnica" OnClick="btnRegistroET_Click" />
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
