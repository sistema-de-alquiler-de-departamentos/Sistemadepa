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
    public partial class alertas : System.Web.UI.Page
    {
        string idinmueblenumero;
        consultas datitos = new consultas();
        conexion cn = new conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand);
            Repeater2.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand2);
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand3);
            Repeater2.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand4);

            if (!IsPostBack)
            {
                BindDepaRepeater();
                BindDepaRepeater2();



            }
        }

        public void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Veranuncio")
            {
                string idinmueble = ((LinkButton)e.CommandSource).CommandArgument;
                Response.Redirect("detalleinmueble.aspx?inmueble=" + idinmueble);

            }
        }

        public void Repeater_ItemCommand2(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Veranuncio2")
            {
                string idinmueble = ((LinkButton)e.CommandSource).CommandArgument;
                Response.Redirect("detalleinmueble.aspx?inmueble=" + idinmueble);

            }
        }
        private void BindDepaRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindAlertas", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
                cmd.Parameters.Add("@TipoAlerta", SqlDbType.NVarChar).Value = "Quiero que me llamen";
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater.DataSource = dt;
                    Repeater.DataBind();
                }
            }
        }

        private void BindDepaRepeater2()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindAlertas2", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDUsuario", SqlDbType.Int).Value = Convert.ToString((int)Session["IDUsuario"]);
                cmd.Parameters.Add("@TipoAlerta", SqlDbType.NVarChar).Value = "Consulta";
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater2.DataSource = dt;
                    Repeater2.DataBind();
                }
            }
        }

        protected void lnkllamar_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            UpdatePanel4.Update();
            cargardatos();

            

        }

        protected void lnkresponderconsulta_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModalConsulta').modal();", true);
            update1.Update();
            cargardatos();



        }

        public void Repeater_ItemCommand3(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Vernumero")
            {
                idinmueblenumero = ((LinkButton)e.CommandSource).CommandArgument;

                cn.conectar();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.cadena;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "cargardatosalerta";
                cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueblenumero;

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        lbltelefonocontacto.Text = (string)reader[6];
                 


                    }

                    cn.cerrar();
                }
                cn.cerrar();
            }



        }


        public void Repeater_ItemCommand4(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ResponderConsulta")
            {
                idinmueblenumero = ((LinkButton)e.CommandSource).CommandArgument;

                cn.conectar();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.cadena;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "cargardatosalertaconsulta";
                cmd.Parameters.Add("@IDInmueble", SqlDbType.Int).Value = idinmueblenumero;

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        lblemailconsulta.Text = (string)reader[4];
                        lblmensajeconsulta.Text= (string)reader[7];



                    }

                    cn.cerrar();
                }
                cn.cerrar();
            }



        }

        protected void btncerrar_Click(object sender, EventArgs e)
        {
             ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal('hide');", true);

        }

        protected void btncerrarconsulta_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModalConsulta').modal('hide');", true);

        }

        
        protected void btnenviarconsulta_Click(object sender, EventArgs e)
        {
            //correo electronico
        }

        public void cargardatos()
        {
           
        }
    }
}