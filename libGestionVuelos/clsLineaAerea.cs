using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsLineaAerea
    {
        #region CONSTRUCTOR
        
        public clsLineaAerea(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strCodLineaAerea;
        string strNombreLineaAerea;
        string strPais;     
   
        string strError;
        string strNombreApp;
        int intRpta;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPIEDADES
        public string Error
        {
            get
            {
                return strError;
            }
        }

        public int Respuesta
        {
            get
            {
                return intRpta;
            }

        }

        public string Codigo_Linea_Aerea
        {
            set
            {
                strCodLineaAerea = value;
            }
        }

        public string Nombre_Linea_Aerea
        {
            set
            {
                strNombreLineaAerea = value;
            }
        }

        public string Pais
        {
            set
            {
                strPais = value;
            }
        }
        #endregion

        #region METODOS PRIVADOS
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR":
                    if (strCodLineaAerea == string.Empty)
                    {
                        strError = "Debe ingresar un codigo de Linea Aerea para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodLineaAerea == string.Empty)
                    {
                        strError = "Debe ingresar el codigo de la Linea Aerea";
                        return false;
                    }
                    if (strNombreLineaAerea == string.Empty)
                    {
                        strError = "Debe ingresar el nombre de la Linea Aerea";
                        return false;
                    }
                    if (strPais == string.Empty)
                    {
                        strError = "Debe indicar el pais de la Linea Aerea ";
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

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodLineaAerea);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[3];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodLineaAerea);
                        objParameterSQL[1] = new SqlParameter("@NOMBRE", strNombreLineaAerea);
                        objParameterSQL[2] = new SqlParameter("@PAIS", strPais);
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
        public bool Crear_Linea_Aerea()
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
                objConexion.SQL = "SP_CrearLineaAerea";
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

        public bool ObtenerIdLineaAerea()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarLineaAerea";
                objConexion.ParametrosSQL = objParameterSQL;

                if (!objConexion.Consultar(true, true))
                {
                    strError = objConexion.Error;
                    objConexion.CerrarCnx();
                    objConexion = null;
                    return false;
                }

                objReader = objConexion.DataReader_Lleno;

                if (!objReader.HasRows)
                {
                    strError = "La Linea Aerea " + strCodLineaAerea + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strCodLineaAerea = objReader.GetString(0);
                objReader.Close();
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
