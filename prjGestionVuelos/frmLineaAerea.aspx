<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmLineaAerea.aspx.cs" Inherits="prjGestionVuelos.frmLineaAerea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
   
    <div id="page-content-RegistroLineaAerea">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos de la nueva Linea Aerea</h2>
                <br /><br/>
                                    
                <form id="frmRegistroLineaAerea" runat="server">
                    <asp:textbox id="txtCodLineaAerea" runat="server" cssclass="form-control" placeholder="Ingrese el codigo de la Linea Aerea" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtNombreLineaAerea" runat="server" CssClass="form-control" placeholder="Nombre de la Linea Aerea" MaxLength="30"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtPaisLineaAerea" runat="server"  CssClass="form-control" placeholder="Ingrese el pais de la Linea Aerea" MaxLength="30"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroLA" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nueva linea aerea" OnClick="btnRegistroLA_Click" />
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
