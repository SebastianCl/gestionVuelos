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
    public partial class frmRegistroAvion : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtCodAvion.Text = string.Empty;
            this.txtModelo.Text = string.Empty;
            this.txtCapacidad.Text = string.Empty;
            this.txtLineaAerea.Text = string.Empty;
        }
            
        private bool ValidarCampos()
        {
            if (this.txtCodAvion.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el codigo del avión";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtModelo.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el modelo del avión";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCapacidad.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe indicar la capacidad del avión";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtLineaAerea.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el codigo de la linea aerea del avión";
                this.pnlAlerta.Visible = true;
                return false;
            }          

            return true;
        }       
                

        private void RegistrarAvion()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsLineaAerea objValidarLA = new clsLineaAerea(strNombreApp);
                objValidarLA.CodLineaAerea = this.txtLineaAerea.Text.Trim();
                if (!objValidarLA.ConsultarLineaAerea())
                {
                    this.lblMensaje.Text = objValidarLA.Error;
                    this.pnlAlerta.Visible = true;
                    objValidarLA = null;
                    return;
                }
                objValidarLA = null;
                clsAvion objAvion = new clsAvion(strNombreApp);
                objAvion.CodigoAvion = this.txtCodAvion.Text.Trim();
                if (objAvion.ConsultarAvion())
                {
                    this.lblMensaje.Text = "Lo sentimos ,ya hay un avión registrado con esa identificación";
                    this.pnlAlerta.Visible = true;
                    objAvion = null;
                    return;
                }
                objAvion.Modelo = this.txtModelo.Text.Trim();
                objAvion.Capacidad = Int32.Parse(this.txtCapacidad.Text.Trim());
                objAvion.CodLinea = this.txtLineaAerea.Text.Trim();                

                if (!objAvion.CrearAvion())
                {
                    this.lblMensaje.Text = objAvion.Error;
                    this.pnlAlerta.Visible = true;
                    objAvion = null;
                    return;
                }

                if (objAvion.Respuesta == 0)
                {
                    this.lblMensaje.Text = "No se puede realizar el registro";
                    this.pnlAlerta.Visible = true;
                    objAvion = null;
                    return;
                }
                else
                {
                    this.lblMensaje.Text = "Nuevo avión registrado con exito";
                    this.pnlAlerta.Visible = true;
                    objAvion = null;
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

        protected void btnRegistroAv_Click(object sender, EventArgs e)
        {
            RegistrarAvion();
            LimpiarCampos();
        }
        #endregion

    }
}