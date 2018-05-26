using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsPiloto
    {
        #region "Constructor"
        public clsPiloto(String strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region "Atributos"

        string strID;
        string strNombre;
        string strDireccion;
        string strCiudad;
        string strTelefono;        
        string strCodLinea;
        string strNick;
        int intCodUsuario;

        string strError;
        string strNombreApp;
        int intRpta;
        SqlParameter[] objParameterSQL;
        SqlDataReader objReader;
        #endregion

        #region "Propiedades"

        public string Direccion
        {
            set
            {
                strDireccion = value;
            }
        }

        public string Telefono
        {
            set
            {
                strTelefono = value;
            }
        }

        public string CodigoLinea
        {
            set
            {
                strCodLinea = value;
            }
        }


        public string Nombre
        {
            set
            {
                strNombre = value;
            }
        }


        public string Nick
        {
            set
            {
                strNick = value;
            }
        }
        public string Ciudad
        {

            set
            {
                strCiudad = value;
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

        public string Identificacion
        {
            set
            {
                strID = value;
            }
        }

        #endregion

        #region "Metodos Privados"
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
                        strError = "Debe ingresar una identificación para registrar un nuevo piloto";
                        return false;
                    }
                    if (strNombre == string.Empty)
                    {
                        strError = "Debe ingresar un Nombre para registrar un nuevo piloto";
                        return false;
                    }

                    if (strCiudad == string.Empty)
                    {
                        strError = "Debe ingresar una ciudad para registrar un nuevo piloto";
                        return false;
                    }
                    if (strNick == string.Empty)
                    {
                        strError = "Debe ingresar un nick para registrar un nuevo piloto";
                        return false;
                    }
                    if (strCodLinea == string.Empty)
                    {
                        strError = "Debe ingresar un codigo de linea para registrar un nuevo piloto";
                        return false;
                    }
                    if (strDireccion == string.Empty)
                    {
                        strError = "Debe ingresar una direccion para registrar un nuevo piloto";
                        return false;
                    }
                    if (strTelefono == string.Empty)
                    {
                        strError = "Debe ingresar un número de télefono para registrar un nuevo piloto";
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
                        objParameterSQL = new SqlParameter[7];

                        objParameterSQL[0] = new SqlParameter("@ID", strID);
                        objParameterSQL[1] = new SqlParameter("@NOMBRE", strNombre);
                        objParameterSQL[2] = new SqlParameter("@DIRECCION",strDireccion);
                        objParameterSQL[3] = new SqlParameter("@CIUDAD_RESIDENCIA", strCiudad);
                        objParameterSQL[4] = new SqlParameter("@CODIGO_LINEA", strCodLinea);
                        objParameterSQL[5] = new SqlParameter("@COD_USUARIO", intCodUsuario);
                        objParameterSQL[6] = new SqlParameter("@TELEFONO", strTelefono);
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
        public bool CrearPiloto()
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
                objConexion.SQL = "SP_CrearPiloto";
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

        public bool ConsultarIdUsuario()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarIdUsuario";
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
                    strError = "El usuario con nombre " + strNombre + " no existe";
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
