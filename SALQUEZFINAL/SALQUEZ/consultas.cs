using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public class consultas
    {
        conexion cn = new conexion();
        public DataTable extrae(string nombresp)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombresp;
            cn.conectar();
            da.SelectCommand = cmd;
            da.Fill(dt);
            cn.cerrar();
            return dt;

        }

        public void rellenacombo(DropDownList cmb, string campover, string campovalor, string nombresp)
        {
            cmb.DataSource = extrae(nombresp);
            cmb.DataValueField = campovalor;
            cmb.DataTextField = campover;
            cmb.DataBind();
        }
    }
}