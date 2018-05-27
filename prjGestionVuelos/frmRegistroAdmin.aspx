<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmRegistroAdmin.aspx.cs" Inherits="prjGestionVuelos.frmRegistroAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
    <div id="page-content-RegistroAdmin">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Ingrese los datos del nuevo Administrador</h2>
                <br /><br/>
                                    
                <form id="frmRegistroAdmin" runat="server">
                    <asp:TextBox ID="txtIDAdmin" runat="server" TextMode="Number" CssClass="form-control" placeholder="Identificación"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtNickAdmin" runat="server" CssClass="form-control" placeholder="Nombre de usuario"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtClaveAdmin" runat="server" TextMode="Password" CssClass="form-control" placeholder="Ingrese una clave (max 10)"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtNombreAdmin" runat="server" CssClass="form-control" placeholder="Nombre completo"></asp:TextBox>
                    <br />                    
                    <asp:TextBox ID="txtCiudadAdmin" runat="server" CssClass="form-control" placeholder="Ingrese la ciudad local del admisnitrador"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegistroA" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Registrar nuevo administrador" OnClick="btnRegistroA_Click" />
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
