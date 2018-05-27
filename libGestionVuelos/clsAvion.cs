using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using libConexionBD;

namespace libGestionVuelos
{
    public class clsAvion
    {
        #region CONSTRCUTOR
        public clsAvion(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strCodigoAvion;
        string strModelo;
        int    intCapacidad;
        string strCodLinea;
        string strError;
        string strNombreApp;
        int intRpta;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPIEDADES
        public string CodigoAvion
        {
            get
            {
                return strCodigoAvion;
            }

            set
            {
                strCodigoAvion = value;
            }
        }

        public string Modelo
        {
            get
            {
                return strModelo;
            }

            set
            {
                strModelo = value;
            }
        }

        public int Capacidad
        {
            get
            {
                return intCapacidad;
            }

            set
            {
                intCapacidad = value;
            }
        }

        public string CodLinea
        {
            get
            {
                return strCodLinea;
            }

            set
            {
                strCodLinea = value;
            }
        }

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


        #endregion
                
        #region METODOS PRIVADOS
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR":
                    if (strCodigoAvion == string.Empty)
                    {
                        strError = "Debe ingresar un codigo para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodigoAvion == string.Empty)
                    {
                        strError = "Debe ingresar un codigo para registrar un nuevo avión";
                        return false;
                    }
                    if (strModelo == string.Empty)
                    {
                        strError = "Debe especificar el modelo para registrar un nuevo avión";
                        return false;
                    }
                    if (intCapacidad == 0)
                    {
                        strError = "Debe especificar la capacidad para registrar un nuevo avión";
                        return false;
                    }
                    if (strCodLinea == string.Empty)
                    {
                        strError = "Debe ingresar el codigo de la linea aerea para registrar un nuevo avión";
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

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodigoAvion);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[4];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodigoAvion);
                        objParameterSQL[1] = new SqlParameter("@MODELO", strModelo);
                        objParameterSQL[2] = new SqlParameter("@CAPACIDAD", intCapacidad);
                        objParameterSQL[3] = new SqlParameter("@CODIGO_LINEA", strCodLinea);
                        break;
                    case "VALIDAR":
                        objParameterSQL = new SqlParameter[1];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodigoAvion);
                        break;
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }

        #endregion

        #region METODOS PUBLICOS
        public bool CrearAvion()
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
                objConexion.SQL = "SP_CrearAvion";
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

        public bool ConsultarAvion()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarAvion";
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
                    strError = "El avion " + strCodigoAvion + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strCodigoAvion = objReader.GetString(0);
                strModelo = objReader.GetString(1);
                intCapacidad = objReader.GetInt32(2);
                strCodLinea = objReader.GetString(3);
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
