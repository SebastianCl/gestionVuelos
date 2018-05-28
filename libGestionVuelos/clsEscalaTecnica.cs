using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsEscalaTecnica
    {
        #region CONSTRUCTOR
        public clsEscalaTecnica(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strCodigoAeropuerto;
        string strCodEscalaTecnica;

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

        public string CodEscalaTecnica
        {
            get
            {
                return strCodEscalaTecnica;
            }

            set
            {
                strCodEscalaTecnica = value;
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
                case "BUSCAR":
                    if (strCodEscalaTecnica == string.Empty)
                    {
                        strError = "Debe ingresar el codigo de la Escala Técnica para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodigoAeropuerto == string.Empty)
                    {
                        strError = "Debe ingresar el codigo del Aeropuerto";
                        return false;
                    }
                    if (strCodEscalaTecnica == string.Empty)
                    {
                        strError = "Debe ingresar el codigo de la Escala Técnica";
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

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodEscalaTecnica);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[2];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodEscalaTecnica);
                        objParameterSQL[1] = new SqlParameter("@COD_AEROPUERTO", strCodigoAeropuerto);                       
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
        public bool CrearEscalaTecnica()
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
                objConexion.SQL = "SP_CrearEscalaTecnica";
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

        public bool ConsultarEscalaTenica()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarEscalaTecnica";
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
                    strError = "La escala técnica con codigo: " + strCodEscalaTecnica + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strCodEscalaTecnica = objReader.GetString(0);
                strCodigoAeropuerto = objReader.GetString(1);
                
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
