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
    public partial class frmAero_LineaAe : System.Web.UI.Page
    {
        #region VARIABLES GLOABLES
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtCodRLineaAerea.Text = string.Empty;
            this.txtCodRAeropuerto.Text = string.Empty;
        }      
        private bool ValidarCampos()
        {
            if (this.txtCodRAeropuerto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el codigo del Aeropuerto";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCodRLineaAerea.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el código de la Aerolinea";
                this.pnlAlerta.Visible = true;
                return false;
            }            

            return true;
        }

        private void AsignarAeroLA()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsAeropuerto objAeropuerto = new clsAeropuerto(strNombreApp);
                objAeropuerto.CodigoAeropuerto = this.txtCodRAeropuerto.Text.Trim();
                if (!objAeropuerto.ConsultarAeropuerto())
                {
                    this.lblMensaje.Text = "El Aeropuerto que intenta asignar no existe";
                    this.pnlAlerta.Visible = true;
                    objAeropuerto = null;
                    return;
                }
                objAeropuerto = null;
                clsLineaAerea objLineaAerea = new clsLineaAerea(strNombreApp);
                objLineaAerea.CodLineaAerea = this.txtCodRLineaAerea.Text.Trim();
                if (!objLineaAerea.ConsultarLineaAerea())
                {
                    this.lblMensaje.Text = "No existe una linea aerea con código " + objLineaAerea.CodLineaAerea;
                    this.pnlAlerta.Visible = true;
                    objLineaAerea = null;
                    return;
                }
                objLineaAerea = null;

                clsAsignacion objAeroLA = new clsAsignacion(strNombreApp);
                objAeroLA.CodigoAeropuerto = this.txtCodRAeropuerto.Text.Trim();
                objAeroLA.CodigoLineaAerea = this.txtCodRLineaAerea.Text.Trim();

                if (!objAeroLA.AsginarAero_LineaAerea())
                {
                    this.lblMensaje.Text = objAeroLA.Error;
                    this.pnlAlerta.Visible = true;
                    objAeroLA = null;
                    return;
                }

                if (objAeroLA.Respuesta == 0)
                {
                    this.lblMensaje.Text = objAeroLA.Error;
                    this.pnlAlerta.Visible = true;
                    objAeroLA = null;
                    return;
                }
                else
                {
                    this.lblMensaje.Text = "Asignación con exito";
                    this.pnlAlerta.Visible = true;
                    objAeroLA = null;
                    return;
                }

            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = "No hubo cambios, el Aeropuerto ya contaba con esta asignación";
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

        protected void btnAsignacionAL_Click(object sender, EventArgs e)
        {
            AsignarAeroLA();
            LimpiarCampos();
        }
        #endregion
    }
}