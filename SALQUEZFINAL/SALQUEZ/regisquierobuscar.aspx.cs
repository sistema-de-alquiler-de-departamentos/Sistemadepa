using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class regisquierobuscar : System.Web.UI.Page
    {
        consultas datitos = new consultas();
        conexion cn = new conexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregistrar_Click(object sender, EventArgs e)
        {
            string passwordencriptado = Encrypt.GetSHA256(txtpassword.Text);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "registrarusuarios";
            cmd.Parameters.Add("@Nombres", SqlDbType.NVarChar).Value = txtnombres.Text;
            cmd.Parameters.Add("@Apellidos", SqlDbType.NVarChar).Value = txtapellidos.Text;
            cmd.Parameters.Add("@DNI", SqlDbType.Int).Value = txtdni.Text;
            cmd.Parameters.Add("@Tipo", SqlDbType.NVarChar).Value = "Cliente";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtemail.Text;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = passwordencriptado;
            cmd.Parameters.Add("@Telefono", SqlDbType.Int).Value = txttelefono.Text;
            cmd.Parameters.Add("@Direccion", SqlDbType.NVarChar).Value = txtdireccion.Text;

            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            Response.Write("<Script>alert('Registrado correctamente');</script>");
        }
    }
}