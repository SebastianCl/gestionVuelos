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
    public partial class frmVuelo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarVu_Click(object sender, EventArgs e)
        {
            SqlConnection objCon = new SqlConnection("Data Source = Localhost; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
            try
            {
                string strValor = this.txtCodVuelo.Text.Trim();
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblVUELO WHERE CODIGO LIKE '%" + strValor + "%' OR FECHA_partida LIKE '%" + strValor + "%' OR FECHA_llegada LIKE '%" + strValor + "%' OR PLAZAS_VACIAS LIKE '%" + strValor + "%' OR IDPILOTO LIKE '%" + strValor + "%' OR COD_AVION LIKE '%" + strValor + "%'", objCon);
                DataTable dt = new DataTable();
                objDA.Fill(dt);
                this.GridVPV.DataSource = dt;
                GridVPV.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}