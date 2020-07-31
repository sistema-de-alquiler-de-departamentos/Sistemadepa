using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class PublicarDepa : System.Web.UI.Page
    {
        consultas datitos = new consultas();
        conexion cn = new conexion();
        string url;
        string url2;
        string url3;
        int IDUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if ((string)Session["tipousuario"] != "Arrendatario")
                {
                    Response.Redirect("~/iniciarsesion.aspx");
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
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
           
            cargarfileupload();
            if (fileupload.HasFile)
            {
                string archivo = fileupload.FileName;
                string ruta = Path.GetExtension(archivo);
                fileupload.SaveAs(MapPath("Img/Inmuebles/" + archivo));
                url = ("Img/Inmuebles/" + archivo);
            }
            if (fileupload1.HasFile)
            {
                string archivo = fileupload1.FileName;
                string ruta = Path.GetExtension(archivo);
                fileupload1.SaveAs(MapPath("Img/Inmuebles/" + archivo));
                url2 = ("Img/Inmuebles/" + archivo);
            }
            if (fileupload2.HasFile)
            {
                string archivo = fileupload2.FileName;
                string ruta = Path.GetExtension(archivo);
                fileupload2.SaveAs(MapPath("Img/Inmuebles/" + archivo));
                url3 = ("Img/Inmuebles/" + archivo);
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn.cadena;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "publicarinmueble";
            cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
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
            cmd.Parameters.Add("@FechaPublicacion", SqlDbType.DateTime).Value = DateTime.ParseExact(txtfecha.Text, "dd/MM/yyyy H:mm:ss", null);
            cmd.Parameters.Add("@Imagen", SqlDbType.NVarChar).Value = url.ToString();
            cmd.Parameters.Add("@Imagen2", SqlDbType.NVarChar).Value = url2.ToString();
            cmd.Parameters.Add("@Imagen3", SqlDbType.NVarChar).Value = url3.ToString();
            cmd.Parameters.Add("@Latitud", SqlDbType.NVarChar).Value = txtlatitud.Text;
            cmd.Parameters.Add("@Longitud", SqlDbType.NVarChar).Value = txtlongitud.Text;


            cn.conectar();
            cmd.ExecuteNonQuery();
            cn.cerrar();
            vaciarformulario();
            Response.Write("<Script>alert('Inmueble Agregado');</script>");
            
        }

        public void vaciarformulario()
        {
            cmbtipoinmueble.Items.FindByValue("0");
            cmbtipoperacion.Items.FindByValue("0");
            txtnombre.Text = "";
            txtubicacion.Text = "";
           cmbdepartamento.Items.FindByValue("0");
            cmbprovincia.Items.FindByValue("0");
            cmbdistrito.Items.FindByValue("0");
            txtdescripcion.Text="";
            txtprecio.Text="";
            txtdormitorios.Text="";
           txtbaños.Text="";
            txtsuperficie.Text="";
            txtfecha.Text="";
            url="";
            url2="";
            url3="";
            txtlatitud.Text="";
            txtlongitud.Text="";

        }

        public void cargarfileupload()
        {
            //if (fileupload.HasFile)
            //{
            //    string archivo = fileupload.FileName;
            //    string ruta = Path.GetExtension(archivo);
            //    fileupload.SaveAs(MapPath("Img/Departamentos/" + archivo));
            //    url = ("Img/Departamentos/" + archivo);
            //}
        }
    }
}