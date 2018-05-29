using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsPersona
    {
        #region CONSTRUCTOR
        public clsPersona(String strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS

        string strID;
        string strNick;
        string strNombre;
        string strCiudad;
        int intCodUsuario;

        int intRpta;
        string strError;
        string strNombreApp;        
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region PROPÍEDADES

        public string Identificacion
        {
            get
            {
                return strID;
            }

            set
            {
                strID = value;
            }
        }

        public string Nick
        {
            set
            {
                strNick = value;
            }
        }

        public string Nombre
        {
            get
            {
                return strNombre;
            }

            set
            {
                strNombre = value;
            }
        }

        public string Ciudad
        {
            get
            {
                return strCiudad;
            }

            set
            {
                strCiudad = value;
            }
        }

        public int CodUsuario
        {
            get
            {
                return intCodUsuario;
            }

            set
            {
                intCodUsuario = value;
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
                    if (strNombre == string.Empty)
                    {
                        strError = "Debe ingresar un Nombre de Usuario para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strID == string.Empty)
                    {
                        strError = "Debe ingresar una identificación para registrar un nuevo usuario";
                        return false;
                    }
                    if (strNombre == string.Empty)
                    {
                        strError = "Debe ingresar un Nombre para registrar un nuevo usuario";
                        return false;
                    }
                    
                    if (strCiudad == string.Empty)
                    {
                        strError = "Debe ingresar una ciudad para registrar un nuevo usuario";
                        return false;
                    }
                    if (strNick == string.Empty)
                    {
                        strError = "Debe ingresar un nick para registrar un nuevo usuario";
                        return false;
                    }
                    break;
                case "VALIDAR":
                    if (strID == string.Empty)
                    {
                        strError = "Debe ingresar una identificación";
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

                        objParameterSQL[0] = new SqlParameter("@NOMBRE_USUARIO", strNick);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[4];

                        objParameterSQL[0] = new SqlParameter("@ID", strID);
                        objParameterSQL[1] = new SqlParameter("@NOMBRE", strNombre);
                        objParameterSQL[2] = new SqlParameter("@CIUDAD", strCiudad);
                        objParameterSQL[3] = new SqlParameter("@COD_USUARIO", intCodUsuario);
                        break;
                    case "VALIDAR":
                        objParameterSQL = new SqlParameter[1];

                        objParameterSQL[0] = new SqlParameter("@ID", strID);
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

        #region "Metodos Publicos"
        public bool CrearPersona()
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
                objConexion.SQL = "SP_CrearPersona";
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

        public bool ConsultarPersona()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarPersona";
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
                    strError = "El usuario con nick " + strNick + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strID = objReader.GetString(0);
                strNombre = objReader.GetString(1);
                strCiudad = objReader.GetString(2);
                intCodUsuario = objReader.GetInt32(3);
                objReader.Close();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ValidarIdentificacion()
        {
            try
            {
                if (!CrearParametros("VALIDAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ValidarPersona";
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
                    strError = "El usuario con identificación " + strID + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                //intRpta = objReader.GetInt32(0);
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
