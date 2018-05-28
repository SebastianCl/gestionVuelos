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
    public partial class frmLineaAerea : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtCodLineaAerea.Text = string.Empty;
            this.txtNombreLineaAerea.Text = string.Empty;
            this.txtPaisLineaAerea.Text = string.Empty;
        }
        private bool ValidarCampos()
        {
            if (this.txtCodLineaAerea.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el codigo de la Aerolinea";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNombreLineaAerea.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el nombre de la Aerolinea";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtPaisLineaAerea.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el pais de la Aerolinea";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }

        private void RegistrarAerolinea()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }                
                clsLineaAerea objAerolinea = new clsLineaAerea(strNombreApp);
                objAerolinea.CodLineaAerea = this.txtCodLineaAerea.Text.Trim();
                if (objAerolinea.ConsultarLineaAerea())
                {
                    this.lblMensaje.Text = "La Aerolinea ya se encuentra registrada";
                    this.pnlAlerta.Visible = true;
                    objAerolinea = null;
                    return;
                }
                objAerolinea.NombreLineaAerea = this.txtNombreLineaAerea.Text.Trim();
                objAerolinea.Pais = this.txtPaisLineaAerea.Text.Trim();


                if (!objAerolinea.Crear_Linea_Aerea())
                {
                    this.lblMensaje.Text = objAerolinea.Error;
                    this.pnlAlerta.Visible = true;
                    objAerolinea = null;
                    return;
                }

                if (objAerolinea.Respuesta == 0)
                {
                    this.lblMensaje.Text = "La Linea Aerea ya se encuentra registrada";
                    this.pnlAlerta.Visible = true;
                    objAerolinea = null;
                    return;
                }
                else
                {                    
                    this.lblMensaje.Text = "Registro de Aerolinea con exito";
                    this.pnlAlerta.Visible = true;
                    objAerolinea = null;
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

        protected void btnRegistroLA_Click(object sender, EventArgs e)
        {
            RegistrarAerolinea();
            LimpiarCampos();
        }
        #endregion
    }
}