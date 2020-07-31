using SALQUEZ;
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
using System.Web.Script.Serialization;
using System.Net;





namespace SALQUEZ
{
    public partial class iniciarsesionn : System.Web.UI.Page
    {
        public const string FaceBookAppKey = "cc62f66d3987a4704c82563b210c58e5";

        consultas datitos = new consultas();
        conexion cn = new conexion();

        string tipousuario;
        string nombres;
        string apellidos;
        int idusuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["access_token"])) return; //ERROR! No token returned from Facebook!!

            //let's send an http-request to facebook using the token            
            string json = GetFacebookUserJSON(Request.QueryString["access_token"]);

            //and Deserialize the JSON response
            JavaScriptSerializer js = new JavaScriptSerializer();
            FacebookUser oUser = js.Deserialize<FacebookUser>(json);
            if (oUser != null)
            {
                Response.Write("Welcome, " + oUser.name);
                Response.Write("<br />id, " + oUser.id);
                Response.Write("<br />email, " + oUser.email);
                Response.Write("<br />first_name, " + oUser.first_name);
                Response.Write("<br />last_name, " + oUser.last_name);
                Response.Write("<br />gender, " + oUser.gender);
                Response.Write("<br />link, " + oUser.link);
                Response.Write("<br />updated_time, " + oUser.updated_time);
                Response.Write("<br />birthday, " + oUser.birthday);
                Response.Write("<br />locale, " + oUser.locale);
                Response.Write("<br />picture, " + oUser.picture);
                if (oUser.location != null)
                {
                    Response.Write("<br />locationid, " + oUser.location.id);
                    Response.Write("<br />location_name, " + oUser.location.name);
                }
            }
        }

        private static string GetFacebookUserJSON(string access_token)
        {
            string url = string.Format("https://graph.facebook.com/me?access_token={0}&fields=email,name,first_name,last_name,link", access_token);

            WebClient wc = new WebClient();
            Stream data = wc.OpenRead(url);
            StreamReader reader = new StreamReader(data);
            string s = reader.ReadToEnd();
            data.Close();
            reader.Close();

            return s;
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
                    apellidos = (string)reader[2];
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