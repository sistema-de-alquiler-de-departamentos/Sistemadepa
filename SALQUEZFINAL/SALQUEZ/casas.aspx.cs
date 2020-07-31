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
    public partial class casas : System.Web.UI.Page
    {
        consultas datitos = new consultas();
        conexion cn = new conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand);
            if (!IsPostBack)
            {
                BindDepaRepeater();
                rellenardatos();



            }
        }

        public void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Contactar")
            {
                string idinmueble = ((Button)e.CommandSource).CommandArgument;
                Response.Redirect("detalleinmueble.aspx?inmueble=" + idinmueble);

            }
        }

        public void rellenardatos()
        {
            datitos.rellenacombo(cmbdepartamento, "Departamento", "IDDepartamento", "listardepartamentos");
            cmbdepartamento.Items.Insert(0, new ListItem("--Seleccionar Departamento--", "0"));
            cmbprovincia.Items.Insert(0, new ListItem("--Seleccionar Provincia--", "0"));
            cmbdistrito.Items.Insert(0, new ListItem("--Seleccionar Distrito--", "0"));
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

        private void BindDepaRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindCasa", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater.DataSource = dt;
                    Repeater.DataBind();
                }
            }
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindInmuebleBuscar", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Ubicacion", string.IsNullOrEmpty(txtubicacion.Text) ? (object)DBNull.Value : txtubicacion.Text);
                int departamento = 0;
                int.TryParse(cmbdepartamento.SelectedValue.ToString(), out departamento);
                cmd.Parameters.AddWithValue("@IDDepartamento", departamento == 0 ? (object)DBNull.Value : departamento);
                int provincia = 0;
                int.TryParse(cmbprovincia.SelectedValue.ToString(), out provincia);
                cmd.Parameters.AddWithValue("@IDProvincia", provincia == 0 ? (object)DBNull.Value : provincia);
                int distrito = 0;
                int.TryParse(cmbdistrito.SelectedValue.ToString(), out distrito);
                cmd.Parameters.AddWithValue("@IDDistrito", distrito == 0 ? (object)DBNull.Value : distrito);
                int dormitorios = 0;
                int.TryParse(cmbdormitorios.SelectedValue.ToString(), out dormitorios);
                cmd.Parameters.AddWithValue("@Dormitorios", dormitorios == 0 ? (object)DBNull.Value : dormitorios);
                int baños = 0;
                int.TryParse(cmbbaños.SelectedValue.ToString(), out baños);
                cmd.Parameters.AddWithValue("@Baños", baños == 0 ? (object)DBNull.Value : baños);
                int tipoinmueble = 0;
                int.TryParse(cmbtipoinmueble.SelectedValue.ToString(), out tipoinmueble);
                cmd.Parameters.AddWithValue("@TipoInmueble", tipoinmueble == 0 ? (object)DBNull.Value : cmbtipoinmueble.SelectedItem.Text);
                int tipooperacion = 0;
                int.TryParse(cmboperacion.SelectedValue.ToString(), out tipooperacion);
                cmd.Parameters.AddWithValue("@TipoOperacion", tipooperacion == 0 ? (object)DBNull.Value : cmboperacion.SelectedItem.Text);

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater.DataSource = dt;
                    Repeater.DataBind();
                }
            }
            updatePanel.Update();
        }
        }
}