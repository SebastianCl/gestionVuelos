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
    public partial class frmABusquedaVU : System.Web.UI.Page
    {
        #region EVENTOS

        protected void Page_Load(object sender, EventArgs e)
        {
            this.pnlAlerta.Visible = false;
            if (!LlenarGrid())
            {
                this.pnlAlerta.Visible = true;
            }
        }

        protected void btnBuscarVu_Click(object sender, EventArgs e)
        {
            Consultar();
        }

        #endregion

        #region METODOS PRIVADOS
        private void Consultar()
        {            
            try
            {
                string strValor = this.txtCodVuelo.Text.Trim();
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblVUELO WHERE CODIGO LIKE '%" + strValor + "%' OR FECHA_partida LIKE '%" + strValor + "%' OR FECHA_llegada LIKE '%" + strValor + "%' OR PLAZAS_VACIAS LIKE '%" + strValor + "%' OR IDPILOTO LIKE '%" + strValor + "%' OR COD_AVION LIKE '%" + strValor + "%'", objCon);
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

        private bool LlenarGrid()
        {
            try
            {
                string strValor = this.txtCodVuelo.Text.Trim();
                string strInstancia = "SEBASTIAN\\SQLEXPRESS";
                SqlConnection objCon = new SqlConnection("Data Source = " + strInstancia + "; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblVUELO ", objCon);
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
        #endregion
    }
}