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
    public partial class frmLogin : System.Web.UI.Page
    {
        #region VAIABLES GLOBALES
        private static string strNombreApp;
        private string strRolUsuario;
        #endregion


        #region METODOS PRIVADOS
        private bool Validar()
        {
            if (this.txtUsuario.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar su nombre de usuario";
                this.pnlAlerta.Visible = true;
                return false;
            }
            if (this.txtClave.Text.Trim() == string.Empty)
            {
                this.lblMensaje.Text = "Debe ingresar su clave";
                this.pnlAlerta.Visible = true;
                return false;
            }
            return true;
        }

        private void Ingresar()
        {
            try
            {
                if (!Validar())
                {
                    return;
                }
                clsLogin objLog = new clsLogin(strNombreApp);
                objLog.Usuario = this.txtUsuario.Text.Trim();
                objLog.Clave = this.txtClave.Text.Trim();
                if (!objLog.Logueo())
                {
                    objLog = null;
                    return;
                }
                if (objLog.Respuesta == 0)
                {
                    if (!objLog.ConsultarROl())
                    {
                        objLog = null;
                        return;
                    }
                    strRolUsuario = objLog.Rol;
                    if (strRolUsuario == "A")
                    {
                        Response.Redirect("frmBienvenida.aspx");
                    }
                    else
                    {
                        Response.Redirect("frmBienvenidaU.aspx");
                    }
                    
                    
                }
                else
                {
                    this.lblMensaje.Text = "Sus credenciales de acceso no son válidas. Verifíque nuevamente";
                    this.pnlAlerta.Visible = true;
                }
                objLog = null;
                
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

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            Ingresar();
        }
        #endregion

    }
}