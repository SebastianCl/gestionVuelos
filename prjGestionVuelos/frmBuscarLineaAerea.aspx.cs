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
    public partial class frmBuscarLineaAerea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarLA_Click(object sender, EventArgs e)
        {
            SqlConnection objCon = new SqlConnection("Data Source = Localhost; Initial Catalog = CONTROLVUELO; Integrated Security = SSPI;");
            try
            {
                string strValor = this.txtCodLA.Text.Trim();
                SqlDataAdapter objDA = new SqlDataAdapter("SELECT * FROM tblLINEA_AEREA WHERE CODIGO LIKE '%" + strValor + "%' OR NOMBRE LIKE '%" + strValor + "%' OR PAIS LIKE '%" + strValor + "%'", objCon);
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