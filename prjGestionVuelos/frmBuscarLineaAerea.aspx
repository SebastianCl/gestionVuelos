<%@ Page Title="" Language="C#" MasterPageFile="~/frmMdiUsuarios.Master" AutoEventWireup="true" CodeBehind="frmBuscarLineaAerea.aspx.cs" Inherits="prjGestionVuelos.frmBuscarLineaAerea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-Buscar-LineaAerea">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-2">
                </div>
                <div class="col-xs-12 col-md-8">
                    <br /><br /><br />
                    <form id="frmBusquedaLA" runat="server">
                        <h2>Busqueda de Linea Aerea</h2>
                        <asp:TextBox CssClass="form-control input-lg" runat="server" ID="txtCodLA"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnBuscarLA" runat="server" CssClass="btn btn-warning btn-lg btn-block" Text="BUSCAR" OnClick="btnBuscarLA_Click" />
                        <br /><br /><br />
                        <asp:GridView ID="GridVPV" runat="server" AutoGenerateColumns="False" GridLines="None"  
                            AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"  
                            PageSize="100" >  
                            <Columns>  
                                <asp:BoundField DataField="CODIGO" HeaderText="Código" />  
                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />  
                                <asp:BoundField DataField="PAIS" HeaderText="Pais" />                                 
                            </Columns>  
                        </asp:GridView>  
                        
                    </form>
                </div>
                <div class="col-xs-12 col-md-2">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
