﻿using libGestionVuelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjGestionVuelos
{
    public partial class frmRegistroAeropuerto : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtCodAeropuerto.Text = string.Empty;
            this.txtCiudadAeropuerto.Text = string.Empty;
            this.txtNombreAeropuerto.Text = string.Empty;
            this.txtPaisAeropuerto.Text = string.Empty;
            this.txtCiudadAeropuerto.Text = string.Empty;
            this.txtDirAeropuerto.Text = string.Empty;
            this.txtTelAeropuerto.Text = string.Empty;
        }
        private bool ValidarCampos()
        {
            if (this.txtCodAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el codigo del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNombreAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el nombre del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtPaisAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el pais del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCiudadAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la ciudad del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtDirAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la dirección del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtTelAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el telefono del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }

        private void RegistrarAeropuerto()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsAeropuerto objAeropuerto = new clsAeropuerto(strNombreApp);
                objAeropuerto.CodigoAeropuerto = this.txtCodAeropuerto.Text.Trim();                
                if (objAeropuerto.ConsultarAeropuerto())
                {
                    this.lblMensaje.Text = "El Aeropuerto ya se encuentra registrado";
                    this.pnlAlerta.Visible = true;
                    objAeropuerto = null;
                    return;
                }
                objAeropuerto.Nombre = this.txtNombreAeropuerto.Text.Trim();
                objAeropuerto.Pais = this.txtPaisAeropuerto.Text.Trim();
                objAeropuerto.Ciudad = this.txtPaisAeropuerto.Text.Trim();
                objAeropuerto.Direccion = this.txtDirAeropuerto.Text.Trim();
                objAeropuerto.Telefono = this.txtTelAeropuerto.Text.Trim();


                if (!objAeropuerto.CrearAeropuerto())
                {
                    this.lblMensaje.Text = objAeropuerto.Error;
                    this.pnlAlerta.Visible = true;
                    objAeropuerto = null;
                    return;
                }

                if (objAeropuerto.Respuesta == 0)
                {
                    this.lblMensaje.Text = "El aeropuerto ya se esta registrado";
                    this.pnlAlerta.Visible = true;
                    objAeropuerto = null;
                    return;
                }
                else
                {
                    this.lblMensaje.Text = "Registro de Aeropuerto con exito";
                    this.pnlAlerta.Visible = true;
                    objAeropuerto = null;
                    return;
                }

            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
                this.pnlAlerta.Visible = true;
                return;
            }
        }

        #endregion

        #region EVENTOS

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strNombreApp = Assembly.GetExecutingAssembly().GetName().Name;
            }
            this.pnlAlerta.Visible = false;
        }

        protected void btnRegistroAe_Click(object sender, EventArgs e)
        {
            RegistrarAeropuerto();
            LimpiarCampos();
        }
        #endregion

    }
}