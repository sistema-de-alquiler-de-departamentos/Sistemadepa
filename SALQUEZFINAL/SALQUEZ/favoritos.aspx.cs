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
    public partial class favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater.ItemCommand += new RepeaterCommandEventHandler(Repeater_ItemCommand);
            if (!IsPostBack)
            {
                BindDepaRepeater();
             

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

        private void BindDepaRepeater()
        {
            String CS = ConfigurationManager.ConnectionStrings["conectar"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            using (SqlCommand cmd = new SqlCommand("SP_BindInmuebleFavoritos", con))
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
    }
}