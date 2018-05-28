using libGestionVuelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjGestionVuelos
{
    public partial class frmRegistroEscalaTecnica : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region "Metodos Privados"
        private void LimpiarCampos()
        {
            this.txtCodEscalaTecnica.Text = string.Empty;
            this.txtAeropuerto.Text = string.Empty;
            
        }
        private bool ValidarCampos()
        {
            if (this.txtCodEscalaTecnica.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe asignar un código para registrar una Escala Técnica";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar un Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }            

            return true;
        }
        private void RegistrarEscalaTecnica()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsAeropuerto objValAero = new clsAeropuerto(strNombreApp);
                objValAero.CodigoAeropuerto = this.txtAeropuerto.Text.Trim();
                if (!objValAero.ConsultarAeropuerto())
                {
                    this.lblMensaje.Text = "El Aeropuerto no existe";
                    this.pnlAlerta.Visible = true;
                    objValAero = null;
                    return;
                }
                objValAero = null;
                clsEscalaTecnica objEscalaTecnica = new clsEscalaTecnica(strNombreApp);
                objEscalaTecnica.CodEscalaTecnica = this.txtCodEscalaTecnica.Text.Trim();
                if (objEscalaTecnica.ConsultarEscalaTenica())
                {
                    this.lblMensaje.Text = "Lo sentimos, ya existe una Escala Técnica con ese código";
                    this.pnlAlerta.Visible = true;
                    objEscalaTecnica = null;
                    return;
                }
                objEscalaTecnica.CodigoAeropuerto = this.txtAeropuerto.Text.Trim();
                if (!objEscalaTecnica.CrearEscalaTecnica())
                {
                    this.lblMensaje.Text = objEscalaTecnica.Error;
                    this.pnlAlerta.Visible = true;
                    objEscalaTecnica = null;
                    return;
                }

                if (objEscalaTecnica.Respuesta == 0)
                {
                    this.lblMensaje.Text = objEscalaTecnica.Error;
                    this.pnlAlerta.Visible = true;
                    objEscalaTecnica = null;
                    return;
                }
                else
                {                    
                    this.lblMensaje.Text = "Nueva Escala Técnica registrada con exito";
                    LimpiarCampos();
                    this.pnlAlerta.Visible = true;
                    objEscalaTecnica = null;
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

        protected void btnRegistroET_Click(object sender, EventArgs e)
        {
            RegistrarEscalaTecnica();
            LimpiarCampos();
        }
        #endregion
    }
}