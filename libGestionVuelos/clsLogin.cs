using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsLogin
    {
        #region CONSTRUCTOR
        public clsLogin(string strNombreAplicacion)
        {
            strNombreApp = strNombreAplicacion;
            strError = string.Empty;
        }
        #endregion

        #region ATRIBUTOS
        private string strNombreApp;
        private string strUsuario;
        private string strClave;
        private string strError;
        private int intRpta;
        private string strRol;
        private SqlParameter[] objParamSQL;
        private SqlDataReader objReader;
        #endregion

        #region PROPIEDADES
        public string Usuario
        {
            set
            {
                strUsuario = value;
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

        public string Rol
        {
            get
            {
                return strRol;
            }            
        }
        #endregion

        #region METODOS PRIVADOS
        private bool Validar()
        {
            if (string.IsNullOrEmpty(strUsuario.Trim()))
            {
                strError = "Debe ingresar el nombre de usuario";
                return false;
            }
            if (string.IsNullOrEmpty(strClave.Trim()))
            {
                strError = "Debe ingresar su contraseña";
                return false;
            }
            return true;
        }

        private bool CrearParametros(string strTipo)
        {
            try
            {
                switch (strTipo)
                {
                    case "Logueo":
                        objParamSQL = new SqlParameter[2];
                        objParamSQL[0] = new SqlParameter("@usuario", strUsuario);
                        objParamSQL[1] = new SqlParameter("@clave", strClave);                        
                        break;
                    case "CONSULTAR_ROL":
                        objParamSQL = new SqlParameter[1];

                        objParamSQL[0] = new SqlParameter("@NOMBRE_USUARIO", strUsuario);
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
        public bool Logueo()
        {
            try
            {
                if (!Validar())
                {
                    return false;
                }
                if (!CrearParametros("Logueo"))
                {
                    strError = "Error en la creación de parametros";
                    return false;
                }
                clsConexionBD objCnx = new clsConexionBD(strNombreApp);
                objCnx.SQL = "SP_ValidarCredencialesDeAcceso";
                objCnx.ParametrosSQL = objParamSQL;
                if (!objCnx.ConsultarValorUnico(true, true))
                {
                    strError = objCnx.Error;
                    objCnx.CerrarCnx();
                    objCnx = null;
                    return false;
                }
                intRpta = Convert.ToInt16(objCnx.Valor_Unico);
                objCnx.CerrarCnx();
                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ConsultarROl()
        {
            try
            {
                if (!CrearParametros("CONSULTAR_ROL"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarRol";
                objConexion.ParametrosSQL = objParamSQL;

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
                    strError = objConexion.Error;
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strRol = objReader.GetString(0);

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
