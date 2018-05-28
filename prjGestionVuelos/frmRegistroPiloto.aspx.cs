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
    public partial class frmPiloto : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region METODOS PRIVADOS
        private void LimpiarCampos()
        {
            this.txtIDPiloto.Text = string.Empty;
            this.txtNickPiloto.Text = string.Empty;
            this.txtClavePiloto.Text = string.Empty;
            this.txtNombrePiloto.Text = string.Empty;
            this.txtCiudadPiloto.Text = string.Empty;
            this.txtDirPiloto.Text = string.Empty;
            this.txtTelPiloto.Text = string.Empty;
            this.txtCodLineaAerea.Text = string.Empty;
        }
        private bool ValidarCampos()
        {
            if (this.txtIDPiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una identificación";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNickPiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar un nombre de usuario";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtClavePiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una contraseña";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNombrePiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el nombre del administrador a registrar";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCiudadPiloto.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la ciudad del administrador a registrar";
                this.pnlAlerta.Visible = true;
                return false;
            }

            return true;
        }

        private bool crearPiloto()
        {
            try
            {
                if (!consultarIdUsuario())
                {
                    return false;
                }
                clsPiloto objPiloto = new clsPiloto(strNombreApp);
                objPiloto.Identificacion = this.txtIDPiloto.Text.Trim();
                objPiloto.Nombre = this.txtNombrePiloto.Text.Trim();
                objPiloto.Direccion = this.txtDirPiloto.Text.Trim();
                objPiloto.Ciudad = this.txtCiudadPiloto.Text.Trim();
                objPiloto.Telefono = this.txtTelPiloto.Text.Trim();
                objPiloto.Codigo_Linea = this.txtCodLineaAerea.Text.Trim();
                objPiloto.Nick = this.txtNickPiloto.Text.Trim();
                objPiloto.ObtenerIdUsuario();       
                
                objPiloto.CrearPiloto();
                objPiloto = null;
                return true;
            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
                this.pnlAlerta.Visible = true;
                return false;
            }
        }

        private bool consultarIdUsuario()
        {
            try
            {
                clsPiloto objPiloto = new clsPiloto(strNombreApp);
                objPiloto.Nick = this.txtNickPiloto.Text.Trim();
                if (!objPiloto.ObtenerIdUsuario())
                {
                    this.lblMensaje.Text = objPiloto.Error;
                    this.pnlAlerta.Visible = true;
                    objPiloto = null;
                    return false;
                }
                objPiloto = null;
                return true;
            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
                this.pnlAlerta.Visible = true;                
                return false;
            }
        }

        private void RegistrarPiloto()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }                
                clsLineaAerea objLA = new clsLineaAerea(strNombreApp);
                objLA.CodLineaAerea = this.txtCodLineaAerea.Text.Trim();
                if (!objLA.ConsultarLineaAerea())
                {
                    this.lblMensaje.Text = objLA.Error;
                    this.pnlAlerta.Visible = true;
                    objLA = null;
                    return;
                }
                clsPiloto objValPil = new clsPiloto(strNombreApp);
                objValPil.Identificacion = this.txtIDPiloto.Text.Trim();
                if (objValPil.ConsultarPiloto())
                {
                    this.lblMensaje.Text = "Lo sentimos ,ya hay un piloto registrado con esa identificación";
                    this.pnlAlerta.Visible = true;
                    objValPil = null;
                    return;
                }
                objValPil = null;
                clsUsuario objUsu = new clsUsuario(strNombreApp);
                objUsu.NickUsuario = this.txtNickPiloto.Text;
                objUsu.Clave = this.txtClavePiloto.Text;
                objUsu.Rol = "P";                

                if (!objUsu.CrearUsuario())
                {
                    this.lblMensaje.Text = objUsu.Error;
                    this.pnlAlerta.Visible = true;
                    objUsu = null;
                    return;
                }

                if (objUsu.Respuesta == 0)
                {
                    this.lblMensaje.Text = "Nombre de usuario no disponible";
                    this.pnlAlerta.Visible = true;
                    objUsu = null;
                    return;
                }
                else
                {                    
                    if (!crearPiloto())
                    {
                        return;
                    }
                    this.lblMensaje.Text = "Nuevo piloto registrado con exito";
                    this.pnlAlerta.Visible = true;
                    objUsu = null;
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

        protected void btnRegistroP_Click(object sender, EventArgs e)
        {
            RegistrarPiloto();
            LimpiarCampos();
        }
        #endregion
    }
}