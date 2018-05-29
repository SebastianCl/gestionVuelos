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
    public partial class frmVuelo : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtCodVuelo.Text = string.Empty;
            this.txtAvion.Text = string.Empty;
            this.txtPiloto.Text = string.Empty;
            this.txtFechaPartida.Text = string.Empty;
            this.txtFechaLlegada.Text = string.Empty;
            this.txtCantPlazasVacias.Text = string.Empty;            
        }
        private bool ValidarCampos()
        {
            if (this.txtCodVuelo.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código del Vuelo";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtAvion.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código del avión";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtPiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código del piloto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtFechaPartida.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la fecha de salida";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtFechaLlegada.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la fecha de llegada";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCantPlazasVacias.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la cantidad de plazas vacias";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }

        private bool ValidarFechas()
        {
            DateTime date1 =  Convert.ToDateTime(this.txtFechaPartida.Text.Trim());
            DateTime date2 = Convert.ToDateTime(this.txtFechaLlegada.Text.Trim());
            int result = DateTime.Compare(date1, date2);
                         
            if (result == 0)
            {
                this.lblMensaje.Text = "La fecha de Partida no puede ser igual a la fecha de Llegada";
                this.pnlAlerta.Visible = true;
                return false;
            }

            if (result > 0)
            {
                this.lblMensaje.Text = "La fecha de Partida no puede ser mayor que la fecha de Llegada";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }

        private void RegistrarVuelo()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                if (!ValidarFechas())
                {
                    return;
                }
                clsAvion objValAvion = new clsAvion(strNombreApp);
                objValAvion.CodigoAvion = this.txtAvion.Text.Trim();
                if (!objValAvion.ConsultarAvion())
                {
                    this.lblMensaje.Text = "El Avión no existe";
                    this.pnlAlerta.Visible = true;
                    objValAvion = null;
                    return;
                }
                objValAvion = null;
                clsPiloto objValPil = new clsPiloto(strNombreApp);
                objValPil.Identificacion = this.txtPiloto.Text.Trim();
                if (!objValPil.ConsultarPiloto())
                {
                    this.lblMensaje.Text = "El Piloto no existe";
                    this.pnlAlerta.Visible = true;
                    objValAvion = null;
                    return;
                }
                objValPil = null;
                clsVuelo objVuelo = new clsVuelo(strNombreApp);
                objVuelo.CodigoVuelo = this.txtCodVuelo.Text.Trim();
                if (objVuelo.ConsultarVuelo())
                {
                    this.lblMensaje.Text = "Lo sentimos, ya existe un vuelo con el código ingresado";
                    this.pnlAlerta.Visible = true;
                    objVuelo = null;
                    return;
                }
                objVuelo.FechaPartida = Convert.ToDateTime(this.txtFechaPartida.Text.Trim());
                objVuelo.FechaLlegada = Convert.ToDateTime(this.txtFechaLlegada.Text.Trim());
                objVuelo.PlazasVacias = Convert.ToInt32(this.txtCantPlazasVacias.Text.Trim());
                objVuelo.IDPiloto = this.txtPiloto.Text.Trim();
                objVuelo.CodigoAvion = this.txtAvion.Text.Trim();


                if (!objVuelo.CrearVuelo())
                {
                    this.lblMensaje.Text = objVuelo.Error;
                    this.pnlAlerta.Visible = true;
                    objVuelo = null;
                    return;
                }

                if (objVuelo.Respuesta == 0)
                {
                    this.lblMensaje.Text = objVuelo.Error;
                    this.pnlAlerta.Visible = true;
                    objVuelo = null;
                    return;
                }
                else
                {
                    this.lblMensaje.Text = "Registro de nuevo vuelo con exito";
                    this.pnlAlerta.Visible = true;
                    objVuelo = null;
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

        protected void btnRegistroV_Click(object sender, EventArgs e)
        {
            RegistrarVuelo();
            LimpiarCampos();
        }
        #endregion

    }
}