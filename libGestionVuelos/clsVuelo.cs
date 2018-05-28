using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsVuelo
    {
        #region CONSTRUCTOR
        public clsVuelo(String strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS

        string strCodVuelo;
        DateTime dtFechaPartida;
        DateTime dtFechaLlegada;
        int intPlazasVacias;
        string strIdPiloto;
        string strCodAvion;


        int intRpta;
        string strError;
        string strNombreApp;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPIEDADES

        public string CodigoVuelo
        {
            get
            {
                return strCodVuelo;
            }

            set
            {
                strCodVuelo = value;
            }
        }

        public DateTime FechaPartida
        {
            get
            {
                return dtFechaPartida;
            }

            set
            {
                dtFechaPartida = value;
            }
        }

        public DateTime FechaLlegada
        {
            get
            {
                return dtFechaLlegada;
            }

            set
            {
                dtFechaLlegada = value;
            }
        }

        public int PlazasVacias
        {
            get
            {
                return intPlazasVacias;
            }

            set
            {
                intPlazasVacias = value;
            }
        }

        public string IDPiloto
        {
            get
            {
                return strIdPiloto;
            }

            set
            {
                strIdPiloto = value;
            }
        }

        public string CodigoAvion
        {
            get
            {
                return strCodAvion;
            }

            set
            {
                strCodAvion = value;
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
                    if (strCodVuelo == string.Empty)
                    {
                        strError = "Debe ingresar el código del vuelo para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodVuelo == string.Empty)
                    {
                        strError = "Debe ingresar el código del Vuelo";
                        return false;
                    }
                    if (dtFechaPartida == null)
                    {
                        strError = "Debe ingresar la fecha de partida del Vuelo";
                        return false;
                    }
                    if (dtFechaLlegada == null)
                    {
                        strError = "Debe ingresar la fecha de llegada del Vuelo";
                        return false;
                    }
                    if (intPlazasVacias < 0)
                    {
                        strError = "Debe ingresar la cantidad de plazas vacias del Vuelo";
                        return false;
                    }
                    if (strIdPiloto == null)
                    {
                        strError = "Debe ingresar la identificación del Piloto";
                        return false;
                    }
                    if (strCodAvion == null)
                    {
                        strError = "Debe ingresar el código del Avión";
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

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodVuelo);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[6];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodVuelo);
                        objParameterSQL[1] = new SqlParameter("@FECHA_partida", dtFechaPartida);
                        objParameterSQL[2] = new SqlParameter("@FECHA_llegada", dtFechaLlegada);
                        objParameterSQL[3] = new SqlParameter("@PLAZAS_VACIAS", intPlazasVacias);
                        objParameterSQL[4] = new SqlParameter("@IDPILOTO", strIdPiloto);
                        objParameterSQL[5] = new SqlParameter("@COD_AVION", strCodAvion);
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
        public bool CrearVuelo()
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
                objConexion.SQL = "SP_CrearVuelo";
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

        public bool ConsultarVuelo()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarVuelo";
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
                    strError = "El vuelo con código: " + strCodVuelo + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strCodVuelo = objReader.GetString(0);
                dtFechaPartida = objReader.GetDateTime(1);
                dtFechaLlegada = objReader.GetDateTime(2);
                intPlazasVacias = objReader.GetInt32(3);
                strIdPiloto = objReader.GetString(4);
                strCodAvion = objReader.GetString(5);
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
