using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace prjGestionVuelos
{
    public partial class frmBuscarAvion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarAvi_Click(object sender, EventArgs e)
        {
            SqlConnection objCon = new SqlConnection("Data Source = Localhost; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
            try
            {
                string strValor = this.txtCodAvion.Text.Trim();
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblAVION WHERE CODIGO LIKE '%" + strValor + "%' OR MODELO LIKE '%" + strValor + "%' OR CAPACIDAD LIKE '%" + strValor + "%' OR CODIGO_LINEA LIKE '%" + strValor + "%'", objCon);
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