using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SALQUEZ
{
    public class conexion
    {

        public SqlConnection cadena = new SqlConnection(@"Data Source=localhost;Initial Catalog=SALQUEZ;Integrated Security=True");
        //public SqlConnection cadena = new SqlConnection(@"Data Source=SQL5063.site4now.net;Initial Catalog=DB_A64E59_SALQUEZ;User Id = DB_A64E59_SALQUEZ_admin; Password=51220000c;");
        public void conectar()
        {
            cadena.Open();
        }
        
        public void cerrar()
        {
            cadena.Close();
        }
    }
}