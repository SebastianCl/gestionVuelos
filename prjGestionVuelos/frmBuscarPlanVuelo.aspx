<%@ Page Title="" Language="C#" MasterPageFile="~/frmMdiUsuarios.Master" AutoEventWireup="true" CodeBehind="frmBuscarPlanVuelo.aspx.cs" Inherits="prjGestionVuelos.frmBuscarPlanVuelo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-Buscar-PlanVuelo">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-2">
                </div>
                <div class="col-xs-12 col-md-8">
                    <br /><br /><br />
                    <form id="frmBusquedaPV" runat="server">
                        <h2>Busqueda de planes de vuelo</h2>
                        <asp:TextBox CssClass="form-control input-lg" runat="server" ID="txtCodPlanV"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnBuscarPV" runat="server" CssClass="btn btn-success btn-lg btn-block" Text="BUSCAR" OnClick="btnBuscarPV_Click" />
                        <br /><br /><br />
                        <asp:GridView ID="GridVPV" runat="server" AutoGenerateColumns="False" GridLines="None"  
                            AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"  
                            PageSize="200" >  
                            <Columns>  
                                <asp:BoundField DataField="CODIGO" HeaderText="Código Plan" />  
                                <asp:BoundField DataField="CODIGO_VUELO" HeaderText="Vuelo" />  
                                <asp:BoundField DataField="CODIGO_LINEA" HeaderText="Linea Aerea" />  
                                <asp:BoundField DataField="CODIGO_ESCALATECNICA" HeaderText="Escala Tecnica" />  
                                <asp:BoundField DataField="AEROPUERTO_PARTIDA" HeaderText="Aeropuerto de partida" />  
                                <asp:BoundField DataField="AEROPUERTO_DESTINO" HeaderText="Aeropuerto de destino" />  
                            </Columns>  
                        </asp:GridView>  
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
                    </form>
                </div>
                <div class="col-xs-12 col-md-2">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
