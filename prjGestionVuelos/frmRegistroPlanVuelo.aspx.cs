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

        }
        #endregion
    }
}