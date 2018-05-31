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
    public partial class frmBusqueda : System.Web.UI.Page
    {
        #region METODOS PRIVADOS
        private bool LlenarGrid()
        {
            try
            {
                string strValor = this.txtCodLA.Text.Trim();
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblLINEA_AEREA", objCon);
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
                string strValor = this.txtCodLA.Text.Trim();
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblLINEA_AEREA WHERE CODIGO LIKE '%" + strValor + "%' OR NOMBRE LIKE '%" + strValor + "%' OR PAIS LIKE '%" + strValor + "%'", objCon);
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

        protected void btnBuscarLA_Click(object sender, EventArgs e)
        {
            Consultar();
        }
        #endregion
    }
}