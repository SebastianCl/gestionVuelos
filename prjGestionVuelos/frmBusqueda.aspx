<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmBusqueda.aspx.cs" Inherits="prjGestionVuelos.frmBusqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="page-content-wrapper">
        <div class="container-fluid">
	    <div class="row">
            <div class="col-xs-12 col-md-2">
            </div>
            <div class="col-xs-12 col-md-8">
    		    <h2>Buscar aeropuertos, aviones, vuelos y aerolíneas</h2>
                <br /><br />
                <div id="search-aeropuerto">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" placeholder="Buscar un aerpuerto" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-map-marker"></i>
                                </button>
                            </span>
                    </div>
                </div>
                <br />
                <div id="search-avion">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" placeholder="Buscar un avión" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-plane"></i>
                                </button>
                            </span>
                    </div>
                </div>
                <br />
                <div id="search-aerolinea">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" placeholder="Buscar una aerolinea" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-send"></i>
                                </button>
                            </span>
                    </div>
                </div>
                <br />


              </div>   
            <div class="col-xs-12 col-md-2">
            </div>         
	    </div>
        </div>
    </div>
</asp:Content>
