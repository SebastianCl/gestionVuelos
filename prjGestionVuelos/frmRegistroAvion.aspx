<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroAvion.aspx.cs" Inherits="prjGestionVuelos.frmRegistroAvion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <div id="page-content-RegistroAvion">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del nuevo Avión</h2>
                <br /><br/>
                                    
                <form id="frmRegistroAvion" runat="server">
                    <asp:textbox id="txtCodAvion" runat="server" cssclass="form-control" placeholder="Ingrese el codigo del avión" MaxLength="10"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" placeholder="Modelo del avión" MaxLength="20"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtCapacidad" runat="server" TextMode="Number" CssClass="form-control" placeholder="Ingrese la capacidad del avón"></asp:TextBox>
                    <br />
                     <asp:TextBox ID="txtLineaAerea" runat="server"  CssClass="form-control" placeholder="Ingrese el codigo de la linea aerea del avión" MaxLength="10"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroAv" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nueva Avión" OnClick="btnRegistroAv_Click" />
                     
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
