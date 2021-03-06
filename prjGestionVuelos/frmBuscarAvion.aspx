﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frmMdiUsuarios.Master" AutoEventWireup="true" CodeBehind="frmBuscarAvion.aspx.cs" Inherits="prjGestionVuelos.frmBuscarAvion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-content-Buscar-Avion">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-2">
                </div>
                <div class="col-xs-12 col-md-8">
                    <br /><br /><br />
                    <form id="frmBusquedaAe" runat="server">
                        <h2>Busqueda de aviones
                        </h2>
                        <asp:TextBox CssClass="form-control input-lg" runat="server" ID="txtCodAvion"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnBuscarAvi" runat="server" CssClass="btn btn-danger btn-lg btn-block" Text="BUSCAR" OnClick="btnBuscarAvi_Click" />
                        <br /><br /><br />
                        <asp:GridView ID="GridVPV" runat="server" AutoGenerateColumns="False" GridLines="None"  
                            AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" 
                            PageSize="200">  
                            <Columns>  
                                <asp:BoundField DataField="CODIGO" HeaderText="Código" />  
                                <asp:BoundField DataField="MODELO" HeaderText="Modelo" />  
                                <asp:BoundField DataField="CAPACIDAD" HeaderText="Capacidad" />  
                                <asp:BoundField DataField="CODIGO_LINEA" HeaderText="Linea Aerea"/>                                  
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
