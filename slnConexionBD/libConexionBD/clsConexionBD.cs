using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Referenciar y usar
using System.Data;
using System.Data.SqlClient;

//Referenciar y usar
using libParametros;

namespace libConexionBD
{
    public class clsConexionBD
    {
        #region "Constructor"
        public clsConexionBD(string NombreAplicacion)
        {
            strNombreApp = NombreAplicacion;
            blnHayCnx = false;
            objCnx = new SqlConnection();      //Para la Conexión
            objCmd = new SqlCommand();         //Para la Transacción
            objAdapter = new SqlDataAdapter(); //Para la llenar el DataSet
            dsDatos = new DataSet();            //Para el DataSet
        }
        #endregion

        #region "Atríbutos"
        private string strNombreApp;             //Para el nombre de la aplicación
        private string strCadenaCnx;       //Para la cadena de conexón a la BD
        private object objVrUnico;         //Para la captura y retorno del Vr. único(método: ConsultarValorUnico)) 
        private string strSQL;             //Para la sentencia SQL a ejecutarse en la BD
        private string strError;           //Para el mensaje de error
        private bool blnHayCnx;            //Para saber si hay o no Cnx a la BD
        private SqlConnection objCnx;      //Para el objeto Conexión
        private SqlCommand objCmd;         //Para el objeto Command (realiza la transacción)
        private SqlDataReader objReader;   //Para el objeto DataReader (contenedor de info)
        private SqlDataAdapter objAdapter; //Para el objeto DataAdapter (para llenar el DataSet, entre otros)
        private DataSet dsDatos;            //Para el objeto DataSet (contenedor de info)
        private SqlParameter[] objSqlParam;
        #endregion

        #region "Propiedades"
        public string SQL                     //Para ingresar la sentencia SQL a ejecutarse en la BD      
        {
            set
            {
                strSQL = value;
            }
        }
        public object Valor_Unico             //Para retornar el valor obtenido al invocar el método:  ConsultarValorUnico
        {
            get
            {
                return objVrUnico;
            }
        }
        public SqlDataReader DataReader_Lleno //Para retornar el DataReader con la info obtenida al invocar el método: Consultar
        {
            get
            {
                return objReader;
            }
        }
        public DataSet DataSet_Lleno          //Para retornar el DataSet con la info obtenida al invocar el método: LlenarDataSet
        {
            get
            {
                return dsDatos;
            }
        }
        public string Error                   //Para retornar el mensaje de error
        {
            get
            {
                return strError;
            }
        }

        public SqlParameter[] ParametrosSQL
        {
            set
            {
                objSqlParam = value;
            }
        }
        #endregion

        #region "Métodos Privados"
        private bool GenerarCadenaCnx()
        {
            try
            {
                if (string.IsNullOrEmpty(strNombreApp))
                {
                    strError = "Debe ingresar el nombre de la aplicación para generar la cadena de conexión";
                    return false;
                }
                clsParametros _objParams = new clsParametros();
                if (!_objParams.GenerarCadenaCnx(strNombreApp))
                {
                    strError = _objParams.Error;
                    _objParams = null;
                    return false;
                }
                strCadenaCnx = _objParams.CadenaCnx;
                _objParams = null;
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private bool AbrirCnx()
        {
            try
            {
                if (!GenerarCadenaCnx())
                {
                    return false;
                }

                objCnx.ConnectionString = strCadenaCnx;
                objCnx.Open();
                blnHayCnx = true;
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private bool AgregarParametro(SqlParameter[] PobjSqlParametros)
        {
            try
            {
                foreach (SqlParameter _objParam in PobjSqlParametros)
                {
                    objCmd.Parameters.AddWithValue(_objParam.ParameterName, _objParam.Value);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region "Métodos Públicos"
        public void CerrarCnx()
        {
            try
            {
                objCnx.Close();
                objCnx = null;
                blnHayCnx = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Consultar(bool PblnParametros, bool PblnProcAlmacenado)
        {
            try
            {
                if (string.IsNullOrEmpty(strSQL))
                {
                    strError = "No definió la instrucción SQL";
                    return false;
                }
                if (!blnHayCnx)
                {
                    if (!AbrirCnx())
                    {
                        return false;
                    }
                }
                //Preparar el Comando para ejecutar la transacción SQL en la BD
                objCmd.Connection = objCnx;
                objCmd.CommandText = strSQL;
                
                //Si vamos a ejecutar un Procedimiento Almacenado
                if (PblnProcAlmacenado)
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                }
                else //Si se va a ejecutar una sentencia SQL
                {
                    objCmd.CommandType = CommandType.Text;
                }
                //Si debemos agregar los parametros
                if (PblnParametros)
                {
                    if (!AgregarParametro(objSqlParam))
                    {
                        return false;
                    }
                }                
                objReader = objCmd.ExecuteReader();  //Realizar la transacción en la BD
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ConsultarValorUnico(bool PblnParametros, bool PblnProcAlmacenado)
        {
            try
            {
                if (string.IsNullOrEmpty(strSQL))
                {
                    strError = "No definió la instrucción SQL";
                    return false;
                }
                if (!blnHayCnx)
                {
                    if (!AbrirCnx())
                    {
                        return false;
                    }
                }
                //Preparar el Comando para ejecutar la transacción SQL en la BD
                objCmd.Connection = objCnx;
                objCmd.CommandText = strSQL;

                //Si vamos a ejecutar un Procedimiento Almacenado
                if (PblnProcAlmacenado)
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                }
                else //Si se va a ejecutar una sentencia SQL
                {
                    objCmd.CommandType = CommandType.Text;
                }
                //Si debemos agregar los parametros
                if (PblnParametros)
                {
                    if (!AgregarParametro(objSqlParam))
                    {
                        return false;
                    }
                }                
                objVrUnico = objCmd.ExecuteScalar();  //Realizar la transacción en la BD
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool EjecutarSentencia(bool PblnParametros, bool PblnProcAlmacenado)
        {
            try
            {
                if (string.IsNullOrEmpty(strSQL))
                {
                    strError = "No definió la instrucción SQL";
                    return false;
                }
                if (!blnHayCnx)
                {
                    if (!AbrirCnx())
                    {
                        return false;
                    }
                }
                //Preparar el Comando para ejecutar la transacción SQL en la BD
                objCmd.Connection = objCnx;
                objCmd.CommandText = strSQL;

                //Si vamos a ejecutar un Procedimiento Almacenado
                if (PblnProcAlmacenado)
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                }
                else //Si se va a ejecutar una sentencia SQL
                {
                    objCmd.CommandType = CommandType.Text;
                }
                //Si debemos agregar los parametros
                if (PblnParametros)
                {                    
                    if (!AgregarParametro(objSqlParam))
                    {
                        return false;
                    }
                }                
                objCmd.ExecuteNonQuery();   //Realizar la transacción en la BD
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool LlenarDataSet(bool PblnParametros, bool PblnProcAlmacenado)
        {
            try
            {
                if (string.IsNullOrEmpty(strSQL))
                {
                    strError = "No definió la instrucción SQL";
                    return false;
                }
                if (!blnHayCnx)
                {
                    if (!AbrirCnx())
                    {
                        return false;
                    }
                }
                //Preparar el Comando para el DataAdapter
                objCmd.Connection = objCnx;
                objCmd.CommandText = strSQL;

                //Si vamos a ejecutar un Procedimiento Almacenado
                if (PblnProcAlmacenado)
                {
                    objCmd.CommandType = CommandType.StoredProcedure;
                }
                else //Si se va a ejecutar una sentencia SQL
                {
                    objCmd.CommandType = CommandType.Text;
                }
                //Si debemos agregar los parametros
                if (PblnParametros)
                {                    
                    if (!AgregarParametro(objSqlParam))
                    {
                        return false;
                    }
                }                
                //Preparar el DataAdapter para el uso del comando en la BD
                objAdapter.SelectCommand = objCmd; //El DataAdapter Utiliza el Command para la transacción
                objAdapter.Fill(dsDatos);//Realizar la transacción en la BD y el llenado del DataSet/Datatable
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
