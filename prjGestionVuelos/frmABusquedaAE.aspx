<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmABusquedaAE.aspx.cs" Inherits="prjGestionVuelos.frmABusquedaAE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-content-Buscar-Aeropuerto">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-2">
                </div>
                <div class="col-xs-12 col-md-8">
                    <br /><br /><br />
                    <form id="frmBusquedaAe" runat="server">
                        <h2>Busqueda de aeropuertos</h2>
                        <asp:TextBox CssClass="form-control input-lg" runat="server" ID="txtCodAeropuerto"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnBuscarAe" runat="server" CssClass="btn btn-info btn-lg btn-block" Text="BUSCAR" OnClick="btnBuscarAe_Click" />
                        <br /><br /><br />
                        <asp:GridView ID="GridVPV" runat="server" AutoGenerateColumns="False" GridLines="None"  
                            AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"  
                            PageSize="200" >  
                            <Columns>  
                                <asp:BoundField DataField="CODIGO" HeaderText="Código" />  
                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />  
                                <asp:BoundField DataField="CIUDAD" HeaderText="Ciudad" />  
                                <asp:BoundField DataField="PAIS" HeaderText="Pais" />  
                                <asp:BoundField DataField="ID_RESPONSABLE" HeaderText="Responsable" />  
                                <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" />  
                            </Columns>  
                        </asp:GridView>  
                        
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
