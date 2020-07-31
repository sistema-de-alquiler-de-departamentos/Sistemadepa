using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class detalleinmueble : System.Web.UI.Page
    {
        string idinmueble;
        consultas datitos = new consultas();
        conexion cn = new conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
          
                


                if (Request.Params["inmueble"] != null)
                {
                    idinmueble = Request.Params["inmueble"];
                    cargardatos();
                    cargarfavoritos();
                    BindDepaRepeater();

            }
            

        }
        private void BindDepaRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindDetalleInmueble", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater.DataSource = dt;
                    Repeater.DataBind();
                }
            }
        }

        public void cargardatos()
        {
            cn.conectar();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "detalleinmueble";
            cmd.Parameters.Add("@IDInmueble", SqlDbType.NVarChar).Value = idinmueble;

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    lblidusuario.Text = Convert.ToString((int)reader[1]);
                    //lblemail.Text = (string)reader[2];
                    lbltelefonocontacto.Text = Convert.ToString((int)reader[3]);
                    lbltipoinmueble.Text = (string)reader[4];
                    lbltipooperacion.Text = (string)reader[5];
                    lblnombre.Text = (string)reader[6];
                    lblubicacion.Text = (string)reader[7];
                    lbldepartamento.Text = (string)reader[8];
                    lblprovincia.Text = (string)reader[9];
                    lbldistrito.Text = (string)reader[10];
                    lbldescripcion.Text = (string)reader[11];
                    lblprecio.Text = Convert.ToString((int)reader[12]);
                    lbldormitorios.Text = Convert.ToString((int)reader[13]);
                    lblbaños.Text = Convert.ToString((int)reader[14]);
                    lblsuperficie.Text = Convert.ToString((int)reader[15]);
                    lblfechapublicacion.Text = Convert.ToString((DateTime)reader[16]);
                    latitud.Value= (string)reader[18];
                    longitud.Value= (string)reader[19];
                    lblnombreinmueble.Text = lblnombre.Text;
                    lbldireccioninmueble.Text = lblubicacion.Text + ", " + lbldepartamento.Text + ", " + lblprovincia.Text + ", " + lbldistrito.Text;

                }

                cn.cerrar();
            }
            cn.cerrar();
        }

        protected void btndesagregar_Click(object sender, EventArgs e)
        {
            btndesagregar.Visible = false;
            btnfavoritos.Visible = true;
            borrarfavorito();
           
        }
        public void borrarfavorito()
        {
          
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "speliminarfavoritos";
            cmd.Parameters.Add("@IDFavoritos", SqlDbType.Int).Value = lblidfavoritos.Text;
            cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
            cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);

            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            cargardatos();
            cargarfavoritos();
        }

        protected void btnfavoritos_Click(object sender, EventArgs e)
        {
            guardarfavorito();
            btnfavoritos.Visible = false;
            btndesagregar.Visible = true;
            cargardatos();
            cargarfavoritos();
        }

        public void cargarfavoritos()
        {
            if (Session["IDUsuario"] != null)
            {

                cn.conectar();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.cadena;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spBuscarSiTieneFavoritos";
                cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
                cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        //lblidusuario.Text = (string)reader[1];
                        //lblemail.Text = (string)reader[2];
                        //lbltelefono.Text = (string)reader[3];
                        lblidfavoritos.Text = Convert.ToString((int)reader[0]);
                        lblestado.Text = (string)reader[3];
                        btndesagregar.Visible = true;
                        btnfavoritos.Visible = false;

                    }

                    cn.cerrar();
                }
                cn.cerrar();
            }
        }

        public void guardarfavorito()
        {
            if (Session["IDUsuario"] == null) {
                Response.Redirect("~/iniciarsesion.aspx");
            }
                cn.conectar();
            //String myquery = "select Numero from Resolucion";
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.CommandText = "spBuscarSiTieneFavoritos";
            cmd2.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
            cmd2.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
            cmd2.Connection = cn.cadena;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd2;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cn.cerrar();
            if (ds.Tables[0].Rows.Count < 1)
            {
                SqlCommand cmd3 = new SqlCommand();

                cmd3.Connection = cn.cadena;
                cmd3.CommandType = CommandType.StoredProcedure;
                cmd3.CommandText = "agregarfavorido";
                cmd3.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
                cmd3.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
                cmd3.Parameters.Add("@Estado", SqlDbType.NVarChar).Value = "Favorito";
                cn.conectar();
                cmd3.ExecuteNonQuery();
                cn.cerrar();
            }
            else
            {
                btnfavoritos.Visible = false;
            }
            
        }

        protected void btnllamar_Click(object sender, EventArgs e)
        {
            
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                update1.Update();
            
            cargardatosusuario();
           
        }

        protected void btnconsulta_Click(object sender, EventArgs e)
        {
           
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModalLabel", "$('#myModalConsulta').modal();", true);
            UpdatePanel2.Update();
            
            cargardatosusuario();

        }

        

        protected void btnenviar_Click(object sender, EventArgs e)
        {
            string IDUsuario;
            if (Session["IDUsuario"] == null)
            {
                IDUsuario = "0";
            }
            else
            {
                IDUsuario = Convert.ToString((int)Session["IDUsuario"]);
            }

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "insertarconsulta";
            cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
            cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = IDUsuario;
            cmd.Parameters.Add("@IDUsuarioDestino", SqlDbType.Int).Value = lblidusuario.Text;
            cmd.Parameters.Add("@TipoAlerta", SqlDbType.NVarChar).Value = "Quiero que me llamen";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtemailllamar.Text;
            cmd.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = txtnombrellamar.Text;
            cmd.Parameters.Add("@Telefono", SqlDbType.Int).Value = txttelefonollamar.Text;
            cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar).Value = "";
            cmd.Parameters.Add("@Estado", SqlDbType.NVarChar).Value = "Pendiente";

            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            txtemailllamar.Text = "";
            txtnombrellamar.Text = "";
            txttelefonollamar.Text = "";
            updatePanelTop.Update();
            Response.Write("<Script>alert('Se comunicaran contigo al instante');</script>");

        }

        

        protected void btntelefono_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal3').modal();", true);
            update1.Update();
        }
        public void cargardatosusuario()
        {

        }

        protected void btnenviarconsulta_Click(object sender, EventArgs e)
        {
            string IDUsuario;
            if (Session["IDUsuario"] == null)
            {
                IDUsuario = "0";
            }
            else
            {
                IDUsuario = Convert.ToString((int)Session["IDUsuario"]);
            }

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "insertarconsulta";
            cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueble;
            cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = IDUsuario;
            cmd.Parameters.Add("@IDUsuarioDestino", SqlDbType.Int).Value = lblidusuario.Text;
            cmd.Parameters.Add("@TipoAlerta", SqlDbType.NVarChar).Value = "Consulta";
            cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtemailconsulta.Text;
            cmd.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = txtnombreconsulta.Text;
            cmd.Parameters.Add("@Telefono", SqlDbType.Int).Value = txttelefonoconsulta.Text;
            cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar).Value = txtmensajeconsulta.Text;
            cmd.Parameters.Add("@Estado", SqlDbType.NVarChar).Value = "Pendiente";

            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            txtemailconsulta.Text = "";
            txtnombreconsulta.Text="";
            txttelefonoconsulta.Text = ""; ;
            txtmensajeconsulta.Text = "";
            updatePanelTop.Update();
            Response.Write("<Script>alert('Se comunicaran contigo al instante');</script>");
        }
    }
}