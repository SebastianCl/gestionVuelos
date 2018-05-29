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
    public partial class frmRegistroPlanVuelo : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        private string strET;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtPlanVuelo.Text = string.Empty;
            this.txtCodVuelo.Text = string.Empty;
            this.txtCodLineaA.Text = string.Empty;
            this.txtCodEscalaT.Text = string.Empty;
            this.txtAeroPartida.Text = string.Empty;
            this.txtAeroLlegada.Text = string.Empty;

        }
        private bool ValidarCampos()
        {
            if (this.txtPlanVuelo.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe asignar un codigo al Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCodVuelo.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código de vuelo del Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCodLineaA.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código de la linea aerea asignada al Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCodEscalaT.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código de la escala técnica del Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtAeroPartida.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código del Aeropuerto de partida del Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtAeroLlegada.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código del Aeropuerto de destino del Plan de Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }


            return true;
        }
        private bool ValidarSimilitudAeropuertos()
        {
            if (this.txtAeroPartida.Text.Trim() == this.txtAeroLlegada.Text.Trim())
            {
                this.lblMensaje.Text = "El aeropuerto de Partida y Destino no pueden ser iguales";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }
        

        private bool ValidarCodigoVuelo()
        {
            clsVuelo objValVuelo = new clsVuelo(strNombreApp);
            objValVuelo.CodigoVuelo = this.txtCodVuelo.Text.Trim();
            if (!objValVuelo.ConsultarVuelo())
            {
                this.lblMensaje.Text = "No existe ningún vuelo con el código " + objValVuelo.CodigoVuelo;
                this.pnlAlerta.Visible = true;
                objValVuelo = null;
                return false;
            }
            objValVuelo = null;
            return true;
        }

        private bool ValidarLineaAerea()
        {
            clsLineaAerea objValLA = new clsLineaAerea(strNombreApp);
            objValLA.CodLineaAerea = this.txtCodLineaA.Text.Trim();
            if (!objValLA.ConsultarLineaAerea())
            {
                this.lblMensaje.Text = "No existe ninguna linea aérea con el código " + objValLA.CodLineaAerea;
                this.pnlAlerta.Visible = true;
                objValLA = null;
                return false;
            }
            objValLA = null;
            return true;
        }

        private bool ValidarEscalaTecnica()
        {

            clsEscalaTecnica objValET = new clsEscalaTecnica(strNombreApp);
            objValET.CodEscalaTecnica = this.txtCodEscalaT.Text.Trim();
            if (!objValET.ConsultarEscalaTenica())
            {
                this.lblMensaje.Text = "No existe ninguna escala técnica con el código " + objValET.CodEscalaTecnica;
                this.pnlAlerta.Visible = true;
                objValET = null;
                return false;
            }
            objValET = null;
            return true;
        }

        private bool ValidarAeropuertos()
        {
            clsAeropuerto objValAeropuerto = new clsAeropuerto(strNombreApp);
            objValAeropuerto.CodigoAeropuerto = this.txtAeroPartida.Text.Trim();
            if (!objValAeropuerto.ConsultarAeropuerto())
            {
                this.lblMensaje.Text = "No existe ningín Aeropuerto con código " + objValAeropuerto.CodigoAeropuerto;
                this.pnlAlerta.Visible = true;
                objValAeropuerto = null;
                return false;
            }
            objValAeropuerto.CodigoAeropuerto = this.txtAeroLlegada.Text.Trim();
            if (!objValAeropuerto.ConsultarAeropuerto())
            {
                this.lblMensaje.Text = "No existe ningín Aeropuerto con código " + objValAeropuerto.CodigoAeropuerto;
                this.pnlAlerta.Visible = true;
                objValAeropuerto = null;
                return false;
            }
            objValAeropuerto = null;
            return true;
        }

        private void RegistrarPlanVuelo()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                if (!ValidarSimilitudAeropuertos())
                {
                    return;
                }

                if (!ValidarCodigoVuelo())
                {
                    return;
                }
                if (!ValidarLineaAerea())
                {
                    return;
                }
                if (this.txtCodEscalaT.Text.Trim() != "N/A")
                {
                    if (!ValidarEscalaTecnica())
                    {
                        return;
                    }
                    strET = this.txtCodEscalaT.Text.Trim();
                }
                else
                {
                    strET = "N/A";
                }
                if (!ValidarAeropuertos())
                {
                    return;
                }

                clsPlanVuelo objPlanVuelo = new clsPlanVuelo(strNombreApp);
                objPlanVuelo.PlanVuelo = this.txtPlanVuelo.Text.Trim();
                if (objPlanVuelo.ConsultarPlanVuelo())
                {
                    this.lblMensaje.Text = "Lo sentimos, ya existe un plan de vuelo con código " + objPlanVuelo.PlanVuelo;
                    this.pnlAlerta.Visible = true;
                    objPlanVuelo = null;
                    return;
                }
                objPlanVuelo.CodigoVuelo = this.txtCodVuelo.Text.Trim();
                objPlanVuelo.CodigoLineaA = this.txtCodLineaA.Text.Trim();
                objPlanVuelo.CodigoEscalaT = strET;
                objPlanVuelo.AeropuertoPartida= this.txtAeroPartida.Text.Trim();
                objPlanVuelo.AeropuertoLlegada = this.txtAeroLlegada.Text.Trim();

                if (!objPlanVuelo.CrearPlanVuelo())
                {
                    this.lblMensaje.Text = objPlanVuelo.Error;
                    this.pnlAlerta.Visible = true;
                    objPlanVuelo = null;
                    return;
                }

                if (objPlanVuelo.Respuesta == 0)
                {
                    this.lblMensaje.Text = "Lo sentimos, el Plan de Vuelo ya esta registrado";
                    this.pnlAlerta.Visible = true;
                    objPlanVuelo = null;
                    return;
                }
                else
                {
                    this.lblMensaje.Text = "Nuevo Plan de Vuelo registrado con exito";
                    this.pnlAlerta.Visible = true;
                    objPlanVuelo = null;
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

        protected void btnRegistroPV_Click(object sender, EventArgs e)
        {
            RegistrarPlanVuelo();
            LimpiarCampos();
        }
        #endregion

    }
}