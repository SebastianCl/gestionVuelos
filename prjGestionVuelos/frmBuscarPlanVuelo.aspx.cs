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
    public partial class frmBuscarPlanVuelo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarPV_Click(object sender, EventArgs e)
        {
            SqlConnection objCon = new SqlConnection("Data Source = Localhost; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
            try
            {
                string strValor = this.txtCodPlanV.Text.Trim(); 
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblPROGRAMA_VUELO WHERE CODIGO LIKE '%" + strValor + "%' OR CODIGO_VUELO LIKE '%" + strValor + "%' OR CODIGO_ESCALATECNICA LIKE '%" + strValor + "%' OR CODIGO_LINEA LIKE '%"+ strValor + "%' OR AEROPUERTO_PARTIDA LIKE '%" + strValor + "%' OR AEROPUERTO_DESTINO LIKE '%" + strValor + "%'", objCon);
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