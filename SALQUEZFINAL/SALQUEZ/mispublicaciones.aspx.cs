using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class mispublicaciones : System.Web.UI.Page
    {
        consultas datitos = new consultas();
        conexion cn = new conexion();
        string url;
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand);
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand2);
            if (!Page.IsPostBack)
            {
               
                if ((string)Session["tipousuario"] != "Arrendatario")

                {
                    Response.Redirect("~/iniciarsesion.aspx");
                }else{
                    BindDepaRepeater();
                    
                }
                rellenardatos();
            }
        }

        public void rellenardatos()
        {
            DateTime dd = DateTime.Now;
            datitos.rellenacombo(cmbdepartamento, "Departamento", "IDDepartamento", "listardepartamentos");
            cmbdepartamento.Items.Insert(0, new ListItem("--Seleccionar Departamento--", "0"));
            cmbprovincia.Items.Insert(0, new ListItem("--Seleccionar Provincia--", "0"));
            cmbdistrito.Items.Insert(0, new ListItem("--Seleccionar Distrito--", "0"));
            txtfecha.Text = dd.ToString("dd/MM/yyyy H:mm:ss");
        }

        protected void cmbprovincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int IDProvincia = Convert.ToInt32(cmbprovincia.SelectedValue);
            cn.conectar();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "listardistrito";
            cmd.Parameters.Add("@IDProvincia", SqlDbType.Int).Value = +IDProvincia;
            cmd.ExecuteNonQuery();

            cmbdistrito.DataSource = cmd.ExecuteReader();
            cmbdistrito.DataTextField = "Distrito";
            cmbdistrito.DataValueField = "IDDistrito";
            cmbdistrito.DataBind();
            cmbdistrito.Items.Insert(0, new ListItem("--Seleccionar Distrito--", "0"));

            cn.cerrar();
            update1.Update();

        }

        protected void cmbdepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            int IDDepartamento = Convert.ToInt32(cmbdepartamento.SelectedValue);
            cn.conectar();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "listarprovincia";
            cmd.Parameters.Add("@IDDepartamento", SqlDbType.Int).Value = +IDDepartamento;
            cmd.ExecuteNonQuery();

            cmbprovincia.DataSource = cmd.ExecuteReader();
            cmbprovincia.DataTextField = "Provincia";
            cmbprovincia.DataValueField = "IDProvincia";
            cmbprovincia.DataBind();
            cmbprovincia.Items.Insert(0, new ListItem("--Seleccionar Provincia--", "0"));

            cn.cerrar();
            update1.Update();
        }
        public void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Contactar")
            {
                string idinmueble = ((Button)e.CommandSource).CommandArgument;
                Response.Redirect("detalleinmueble.aspx?inmueble=" + idinmueble);

            }
        }

        public void Repeater_ItemCommand2(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                string idinmueble = ((Button)e.CommandSource).CommandArgument;
                

                cn.conectar();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = cn.cadena;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "listarmipublicacion";
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
                            lblidinmueble.Text = Convert.ToString((int)reader[0]);
                        lblidusuario.Text = Convert.ToString((int)reader[1]);
                        cmbtipoinmueble.Text = (string)reader[2];
                        cmbtipoperacion.Text = (string)reader[3];
                        txtnombre.Text = (string)reader[4];
                            txtubicacion.Text = (string)reader[5];
                     
                     
                        txtdescripcion.Text = (string)reader[9];
                        txtprecio.Text = Convert.ToString((int)reader[10]); 
                        txtdormitorios.Text = Convert.ToString((int)reader[11]) ;
                        txtbaños.Text = Convert.ToString((int)reader[12]);
                        txtsuperficie.Text= Convert.ToString((int)reader[13]);
                       
                        

                    }

                        cn.cerrar();
                    }
                    cn.cerrar();
                

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                update1.Update();
            }
        }

        private void BindDepaRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindMisPublicaciones", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater.DataSource = dt;
                    Repeater.DataBind();
                }
            }
        }

        protected void btneditar_Click(object sender,EventArgs e)
        {
           
            if (fileupload.HasFile)
            {
                string archivo = fileupload.FileName;
                string ruta = Path.GetExtension(archivo);
                fileupload.SaveAs(MapPath("Img/Departamentos/" + archivo));
                url = ("Img/Departamentos/" + archivo);
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "editarinmueble";
            cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = lblidinmueble.Text;
            cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = lblidusuario.Text;
            cmd.Parameters.Add("@TipoInmueble", SqlDbType.NVarChar).Value = cmbtipoinmueble.SelectedValue;
            cmd.Parameters.Add("@TipoOperacion", SqlDbType.NVarChar).Value = cmbtipoperacion.SelectedValue;
            cmd.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = txtnombre.Text; ;
            cmd.Parameters.Add("@Ubicacion", SqlDbType.NVarChar).Value = txtubicacion.Text;
            cmd.Parameters.Add("@IDDepartamento", SqlDbType.Int).Value = cmbdepartamento.SelectedValue;
            cmd.Parameters.Add("@IDProvincia", SqlDbType.Int).Value = cmbprovincia.SelectedValue;
            cmd.Parameters.Add("@IDDistrito", SqlDbType.Int).Value = cmbdistrito.SelectedValue;
            cmd.Parameters.Add("@Descripcion", SqlDbType.NVarChar).Value = txtdescripcion.Text;
            cmd.Parameters.Add("@Precio", SqlDbType.Int).Value = txtprecio.Text;
            cmd.Parameters.Add("@Dormitorios", SqlDbType.Int).Value = txtdormitorios.Text;
            cmd.Parameters.Add("@Baños", SqlDbType.Int).Value = txtbaños.Text;
            cmd.Parameters.Add("@Superficie", SqlDbType.Int).Value = txtsuperficie.Text;
            cmd.Parameters.Add("@FechaPublicacion", SqlDbType.DateTime).Value = txtfecha.Text;
            cmd.Parameters.Add("@Imagen", SqlDbType.NVarChar).Value = url.ToString();

            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            Response.Write("<Script>alert('Inmueble Editado');</script>");
            BindDepaRepeater();
        }

    }
}