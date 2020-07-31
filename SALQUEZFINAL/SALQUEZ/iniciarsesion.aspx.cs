using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Windows;
using System.Data;
using System.Data.SqlClient;

namespace SALQUEZ
{
    public partial class iniciarsesion : System.Web.UI.Page
    {
        consultas datitos = new consultas();
        conexion cn = new conexion();

        string tipousuario;
        string nombres;
        string apellidos;
        int idusuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtusuario.Focus();
            }
        }

        protected void btniniciar_sesion_Click(object sender, EventArgs e)
        {
            string passwordencriptado = Encrypt.GetSHA256(txtpassword.Text);

            cn.conectar();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "sesionusuario";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtusuario.Text;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = passwordencriptado;

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                   
                    tipousuario = (string)reader[4];
                    nombres = (string)reader[1];
                    apellidos= (string)reader[2];
                    idusuario = (int)reader[0];

                }
                cn.cerrar();
            }

            if (tipousuario != "")
            {
                if (tipousuario == "Cliente")
                {
                    Session["tipousuario"] = tipousuario;
                    Session["Nombres"] = nombres;
                    Session["Apellidos"] = apellidos;
                    Session["IDUsuario"] = idusuario;
       


                    Response.Redirect("index.aspx");
                }
                else
                if (tipousuario == "Arrendatario")
                {
                    Session["tipousuario"] = tipousuario;
                    Session["Nombres"] = nombres;
                    Session["Apellidos"] = apellidos;
                    Session["IDUsuario"] = idusuario;



                    Response.Redirect("index.aspx");
                }
            }

        }
    }
}