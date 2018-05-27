using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libGestionVuelos;

namespace prjGestionVuelos
{
    public partial class frmRegistroAdmin : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region "Metodos Privados"
        private void LimpiarCampos()
        {
            this.txtIDAdmin.Text = string.Empty;            
            this.txtNickAdmin.Text = string.Empty;
            this.txtClaveAdmin.Text = string.Empty;
            this.txtNombreAdmin.Text = string.Empty;
            this.txtCiudadAdmin.Text = string.Empty;
        }

        private bool ValidarCampos()
        {
            if (this.txtIDAdmin.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una identificación";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNickAdmin.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar un nombre de usuario";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtClaveAdmin.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una contraseña";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNombreAdmin.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el nombre del administrador a registrar";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCiudadAdmin.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la ciudad del administrador a registrar";
                this.pnlAlerta.Visible = true;
                return false;
            }

            return true;
        }

        private bool obtenerIdUsuario()
        {
            try
            {
                clsPersona objPersona = new clsPersona(strNombreApp);
                objPersona.Nombre = this.txtNombreAdmin.Text.Trim();
                objPersona.Nick = this.txtNickAdmin.Text.Trim();
                objPersona.Identificacion = this.txtIDAdmin.Text.Trim();
                objPersona.Ciudad = this.txtCiudadAdmin.Text.Trim();
                if (!objPersona.ConsultarIdUsuario())
                {
                    this.lblMensaje.Text = objPersona.Error;
                    this.pnlAlerta.Visible = true;
                    objPersona = null;
                    return false;
                }
                objPersona.CrearPersona();
                objPersona = null;
                return true;
            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
                this.pnlAlerta.Visible = true;
                return false;
            }
        }
        private void RegistrarAdmin()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsPersona objValPer = new clsPersona(strNombreApp);
                objValPer.Identificacion = this.txtIDAdmin.Text.Trim();
                if (objValPer.ValidarPersona())
                {
                    this.lblMensaje.Text = "Los sentimos, ya hay un administrador registrado con esa identificación";
                    this.pnlAlerta.Visible = true;
                    objValPer = null;
                    return;
                }
                objValPer = null;
                clsUsuario objUsu = new clsUsuario(strNombreApp);
                objUsu.NickUsuario = this.txtNickAdmin.Text;
                objUsu.Clave = this.txtClaveAdmin.Text;
                objUsu.Rol = "A";
                objUsu.Cedula = this.txtIDAdmin.Text;

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
                    if (!obtenerIdUsuario())
                    {
                        return;
                    }
                    this.lblMensaje.Text = "Nuevo usuario registrado con exito";
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

        protected void btnRegistroA_Click(object sender, EventArgs e)
        {
            RegistrarAdmin();
            LimpiarCampos();        
        }
        #endregion

    }
}