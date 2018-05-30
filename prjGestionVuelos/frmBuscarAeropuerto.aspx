﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frmMdiUsuarios.Master" AutoEventWireup="true" CodeBehind="frmBuscarAeropuerto.aspx.cs" Inherits="prjGestionVuelos.frmBuscarAeropuerto" %>
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
                        <asp:Button ID="btnBuscarAe" runat="server" CssClass="btn btn-success btn-lg btn-block" Text="BUSCAR" OnClick="btnBuscarAe_Click" />
                        <br /><br /><br />
                        <asp:GridView ID="GridVPV" runat="server" AutoGenerateColumns="False" GridLines="None"  
                            AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"  
                            PageSize="100" >  
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
                </div>
                <div class="col-xs-12 col-md-2">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
