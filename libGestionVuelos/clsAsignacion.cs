using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsAsignacion
    {
        #region CONSTRUCTOR
        public clsAsignacion(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strCodigoAeropuerto;
        string strCodLineaAerea;

        int intRpta;
        string strError;
        string strNombreApp;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPIEDADES


        public string CodigoAeropuerto
        {
            get
            {
                return strCodigoAeropuerto;
            }

            set
            {
                strCodigoAeropuerto = value;
            }
        }

        public string CodigoLineaAerea
        {
            get
            {
                return strCodLineaAerea;
            }

            set
            {
                strCodLineaAerea = value;
            }
        }

        public int Respuesta
        {
            get
            {
                return intRpta;
            }            
        }

        public string Error
        {
            get
            {
                return strError;
            }
        }
        #endregion

        #region METODOS PRIVADOS
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR_LineaAerea":
                    if (strCodigoAeropuerto == string.Empty)
                    {
                        strError = "Debe ingresar el código del Aeropuerto";
                        return false;
                    }
                    if (strCodLineaAerea == string.Empty)
                    {
                        strError = "Debe ingresar el código de la Linea Aerea";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodigoAeropuerto == string.Empty)
                    {
                        strError = "Debe ingresar el código del Aeropuerto";
                        return false;
                    }
                    if (strCodLineaAerea == string.Empty)
                    {
                        strError = "Debe ingresar el código de la Linea Aerea";
                        return false;
                    }

                    break;
            }
            return true;
        }

        private bool CrearParametros(string strTipo)
        {
            try
            {
                switch (strTipo)
                {
                    case "CONSULTAR":
                        objParameterSQL = new SqlParameter[1];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodigoAeropuerto);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[2];

                        objParameterSQL[0] = new SqlParameter("@CODIGO_AEROPUERTO", strCodigoAeropuerto);
                        objParameterSQL[1] = new SqlParameter("@CODIGO_LINEA", strCodLineaAerea);
                        break;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        #endregion

        #region METODOS PUBLICOS
        public bool AsginarAero_LineaAerea()
        {
            try
            {
                if (!Validar("REGISTRAR"))
                {
                    return false;
                }
                if (!CrearParametros("REGISTRAR"))
                {
                    strError = "Hubo un error al momento de crear los parametros";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_AsignarAero_LineaAerea";
                objConexion.ParametrosSQL = objParameterSQL;

                if (!objConexion.ConsultarValorUnico(true, true))
                {
                    strError = objConexion.Error;
                    objConexion.CerrarCnx();
                    objConexion = null;
                    return false;
                }
                intRpta = Convert.ToInt16(objConexion.Valor_Unico);
                objConexion.CerrarCnx();
                objConexion = null;
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        #endregion
    }
}
