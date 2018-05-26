using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libGestionVuelos;
using System.Reflection;

namespace prjGestionVuelos
{
    public partial class frmRegistroUsuario : System.Web.UI.Page
    {
        #region "Variables Globales"
        private static string strNombreApp;
        #endregion

        #region "Metodos Privados"
        private void LimpiarCampos()
        {
            this.txtIDUsuario.Text = string.Empty;
            this.txtNickUsuario.Text = string.Empty;
            this.txtClaveUsuario.Text = string.Empty;
            this.txtNombreUsuario.Text = string.Empty;
            this.txtCiudadUsuario.Text = string.Empty;
        }
        private bool ValidarCampos()
        {
            if (this.txtIDUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una identificación";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtIDUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar un nombre de usuario";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtClaveUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar una contraseña";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtNombreUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar el nombre del usuario a registrar";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtCiudadUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar la ciudad del usuario a registrar";
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
                objPersona.Nombre = this.txtNombreUsuario.Text.Trim();
                objPersona.Nick = this.txtNickUsuario.Text.Trim();
                objPersona.Identificacion = this.txtIDUsuario.Text.Trim();
                objPersona.Ciudad = this.txtCiudadUsuario.Text.Trim();
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
        private void RegistrarUsuario()
        {
            try
            {
                if (!ValidarCampos())
                {
                    return;
                }
                clsUsuario objUsu = new clsUsuario(strNombreApp);
                objUsu.NickUsuario = this.txtNickUsuario.Text;
                objUsu.Clave = this.txtCiudadUsuario.Text;
                objUsu.Rol = "U";
                objUsu.Cedula = this.txtIDUsuario.Text;

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
                    LimpiarCampos();
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

        protected void btnRegistroU_Click(object sender, EventArgs e)
        {
            RegistrarUsuario();            
        }
        #endregion
    }
}