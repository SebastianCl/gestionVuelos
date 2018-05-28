using libConexionBD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace libGestionVuelos
{
    public class clsAeropuerto
    {
        #region CONSTRUCTOR
        public clsAeropuerto(string strNomApp)
        {
            strNombreApp = strNomApp;
            strError = string.Empty;
            intRpta = -1;
        }
        #endregion

        #region ATRIBUTOS
        string strCodigoAeropuerto;
        string strNombre;
        string strCiudad;
        string strDireccion;
        string strPais;
        string strTelefono;

        string strError;
        string strNombreApp;
        int intRpta;
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

        public string Pais
        {
            get
            {
                return strPais;
            }

            set
            {
                strPais = value;
            }
        }

        public string Error
        {
            get
            {
                return strError;
            }            
        }

        public string Direccion
        {
            get
            {
                return strDireccion;
            }

            set
            {
                strDireccion = value;
            }
        }



        public string Telefono
        {
            get
            {
                return strTelefono;
            }

            set
            {
                strTelefono = value;
            }
        }

        public int Respuesta
        {
            get
            {
                return intRpta;
            }

            set
            {
                intRpta = value;
            }
        }
        #endregion

        #region METODOS PRIVADOS
        private bool Validar(string strOpcion)
        {
            switch (strOpcion)
            {
                case "BUSCAR":
                    if (strCodigoAeropuerto == string.Empty)
                    {
                        strError = "Debe ingresar el codigo del Aeropuerto para realizar una busqueda";
                        return false;
                    }
                    break;
                case "REGISTRAR":

                    if (strCodigoAeropuerto == string.Empty)
                    {
                        strError = "Debe ingresar el codigo del Aeropuerto";
                        return false;
                    }
                    if (strNombre == string.Empty)
                    {
                        strError = "Debe ingresar el nombre del Aeropuerto";
                        return false;
                    }
                    if (strCiudad == string.Empty)
                    {
                        strError = "Debe indicar la ciudad del Aeropuerto ";
                        return false;
                    }
                    if (strPais == string.Empty)
                    {
                        strError = "Debe indicar el pais del Aeropuerto ";
                        return false;
                    }
                    if (strDireccion == string.Empty)
                    {
                        strError = "Debe indicar la dirección del Aeropuerto ";
                        return false;
                    }
                    if (strTelefono == string.Empty)
                    {
                        strError = "Debe indicar el telefono del Aeropuerto ";
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
                        objParameterSQL = new SqlParameter[6];

                        objParameterSQL[0] = new SqlParameter("@CODIGO", strCodigoAeropuerto);
                        objParameterSQL[1] = new SqlParameter("@NOMBRE", strNombre);
                        objParameterSQL[2] = new SqlParameter("@CIUDAD", strCiudad);
                        objParameterSQL[3] = new SqlParameter("@PAIS", strPais);
                        objParameterSQL[4] = new SqlParameter("@DIRECCION", strDireccion);
                        objParameterSQL[5] = new SqlParameter("@TELEFONO", strTelefono);
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
        public bool CrearAeropuerto()
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
                objConexion.SQL = "SP_CrearAeropuerto";
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

        public bool ConsultarAeropuerto()
        {
            try
            {
                if (!CrearParametros("CONSULTAR"))
                {
                    strError = "Hubo un error al crear los parametros SQL";
                    return false;
                }
                clsConexionBD objConexion = new clsConexionBD(strNombreApp);
                objConexion.SQL = "SP_ConsultarAeropuerto";
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
                    strError = "El Aeropuerto " + strCodigoAeropuerto + " no existe";
                    objReader.Close();
                    objConexion = null;
                    return false;
                }
                objReader.Read();
                strCodigoAeropuerto = objReader.GetString(0);
                strNombre = objReader.GetString(1);
                strCiudad = objReader.GetString(2);
                strPais = objReader.GetString(3);
                strDireccion = objReader.GetString(4);
                strTelefono = objReader.GetString(5);
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
