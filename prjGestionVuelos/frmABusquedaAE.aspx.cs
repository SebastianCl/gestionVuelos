using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjGestionVuelos
{
    public partial class frmABusquedaAE : System.Web.UI.Page
    {      

        #region METODOS PRIVADOS
        private bool LlenarGrid()
        {
            try
            {
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                string strValor = this.txtCodAeropuerto.Text.Trim();
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblAEROPUERTO", objCon);
                DataTable dt = new DataTable();
                objDA.Fill(dt);
                this.GridVPV.DataSource = dt;
                GridVPV.DataBind();
                objCon = null;
                return true;
            }
            catch (Exception ex)
            {
                this.lblMensaje.Text = ex.Message;
                this.pnlAlerta.Visible = true;
                return false;
            }
        }

        private void Consultar()
        {
            try
            {
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                string strValor = this.txtCodAeropuerto.Text.Trim();
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblAEROPUERTO WHERE CODIGO LIKE '%" + strValor + "%' OR NOMBRE LIKE '%" + strValor + "%' OR CIUDAD LIKE '%" + strValor + "%' OR PAIS LIKE '%" + strValor + "%' OR ID_RESPONSABLE LIKE '%" + strValor + "%' OR ESTADO LIKE '%" + strValor + "%'", objCon);
                DataTable dt = new DataTable();
                objDA.Fill(dt);
                this.GridVPV.DataSource = dt;
                GridVPV.DataBind();
                objCon = null;
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
            this.pnlAlerta.Visible = false;
            if (!LlenarGrid())
            {
                this.pnlAlerta.Visible = true;
            }
        }

        protected void btnBuscarAe_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        #endregion


    }
}