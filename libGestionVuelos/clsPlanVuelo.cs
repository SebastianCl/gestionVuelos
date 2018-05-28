using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using libConexionBD;

namespace libGestionVuelos
{
    public class clsPlanVuelo
    {
        #region CONSTRUCTOR

        public clsPlanVuelo(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strPlanVuelo;
        string strCodVuelo;
        string strCodigoLineaA;
        string strCodigoEscalaT;
        string strAeropuertoPartida;
        string strAeropuertoLlegada;

        int intRpta;
        string strError;
        string strNombreApp;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPIEDADES

        public string PlanVuelo
        {
            get
            {
                return strPlanVuelo;
            }

            set
            {
                strPlanVuelo = value;
            }
        }

        public string CodigoLineaA
        {
            get
            {
                return strCodigoLineaA;
            }

            set
            {
                strCodigoLineaA = value;
            }
        }

        public string CodigoEscalaT
        {
            get
            {
                return strCodigoEscalaT;
            }

            set
            {
                strCodigoEscalaT = value;
            }
        }

        public string AeropuertoPartida
        {
            get
            {
                return strAeropuertoPartida;
            }

            set
            {
                strAeropuertoPartida = value;
            }
        }

        public string AeropuertoLlegada
        {
            get
            {
                return strAeropuertoLlegada;
            }

            set
            {
                strAeropuertoLlegada = value;
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
        #endregion

        #region METODOS PRIVADOS
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR":
                    if (strPlanVuelo == string.Empty)
                    {
                        strError = "Debe ingresar el código para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strPlanVuelo == string.Empty)
                    {
                        strError = "Debe ingresar el codigo del Plan de Vuelo";
                        return false;
                    }
                    if (strCodVuelo == string.Empty)
                    {
                        strError = "Debe ingresar el código de vuelo del Plan de Vuelo";
                        return false;
                    }
                    if (strCodigoLineaA == string.Empty)
                    {
                        strError = "Debe indicar el código de la Linea Aerea del Plan de Vuelo ";
                        return false;
                    }
                    if (strCodigoEscalaT == string.Empty)
                    {
                        strError = "Debe indicar el código de la Escala Técnica del Plan de Vuelo ";
                        return false;
                    }
                    if (strAeropuertoPartida == string.Empty)
                    {
                        strError = "Debe indicar el código del Aeropuerto de partida del Plan de Vuelo ";
                        return false;
                    }
                    if (strAeropuertoLlegada == string.Empty)
                    {
                        strError = "Debe indicar el código del Aeropuerto de llegada del Plan de Vuelo ";
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

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strPlanVuelo);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[6];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strPlanVuelo);
                        objParameterSQL[1] = new SqlParameter("@CODIGO_VUELO", strCodVuelo);
                        objParameterSQL[2] = new SqlParameter("@CODIGO_LINEA", strCodigoLineaA);
                        objParameterSQL[3] = new SqlParameter("@CODIGO_ESCALATECNICA", strCodigoEscalaT);
                        objParameterSQL[4] = new SqlParameter("@AEROPUERTO_PARTIDA", strAeropuertoPartida);
                        objParameterSQL[5] = new SqlParameter("@AEROPUERTO_DESTINO", strAeropuertoLlegada);
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
        public bool CrearPlanVuelo()
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
                objConexion.SQL = "SP_CrearPlanVuelo";
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

        public bool ConsultarPlanVuelo()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarPlanVuelo";
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
                    strError = "El plan de vuelo con código " + strPlanVuelo + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strPlanVuelo = objReader.GetString(0);
                strCodVuelo = objReader.GetString(1);
                strCodigoLineaA = objReader.GetString(2);
                strCodigoEscalaT = objReader.GetString(3);
                strAeropuertoPartida = objReader.GetString(4);
                strAeropuertoLlegada = objReader.GetString(5);

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
