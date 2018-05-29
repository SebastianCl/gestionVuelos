using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsUsuario
    {
        #region "Constructor"
        public clsUsuario(String strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region "Atributos"
        string strRol;
        string strNickUsuario;
        string strClave;
        string strCedula;
        int intCodUsuario;

        string strError;
        string strNombreApp;
        int intRpta;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region "Propiedades"

        public string Rol
        {
            set
            {
                strRol = value;
            }
        }

        public string NickUsuario
        {
            set
            {
                strNickUsuario = value;
            }
        }

        public string Clave
        {

            set
            {
                strClave = value;
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

        public string Cedula
        {
            set
            {
                strCedula = value;
            }
        }

        public int CodigoUsuario
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

        #endregion

        #region "Metodos Privados"
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR":
                    if (strCedula == string.Empty)
                    {
                        strError = "Debe ingresar un Codigo de Usuario para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":
                    if (strNickUsuario == string.Empty)
                    {
                        strError = "Debe ingresar un Nombre de usuario para registrar un nuevo usuario";
                        return false;
                    }
                    if (strRol == string.Empty)
                    {
                        strError = "Debe ingresar el rol para registrar un nuevo usuario";
                        return false;
                    }
                    if (strClave == string.Empty)
                    {
                        strError = "Debe ingresar una contraseña para registrar un nuevo usuario";
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
                    case "BUSCAR":
                        objParameterSQL = new SqlParameter[1];

                        objParameterSQL[0] = new SqlParameter("@NOMBRE_USUARIO", strNickUsuario);
                        break;
                    case "REGISTRAR":
                        objParameterSQL = new SqlParameter[3];
                                                
                        objParameterSQL[0] = new SqlParameter("@NOMBRE_USUARIO", strNickUsuario);
                        objParameterSQL[1] = new SqlParameter("@CLAVE_USUARIO", strClave);
                        objParameterSQL[2] = new SqlParameter("@ROL_USUARIO", strRol);
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
        public bool CrearUsuario()
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
                objConexion.SQL = "SP_CrearUsuario";
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

        public bool ObtenerCodigoUsuario()
        {
            try
            {
                if (!CrearParametros("BUSCAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ObtenerCodigoUsuario";
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
                    strError = "El usuario " + strNickUsuario + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                intCodUsuario = objReader.GetInt32(0);
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

