using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class Page2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                diviniciarsesion.Visible = false;


                if (Session["Nombres"] != null)
                {
                    lblhello.InnerText += Session["Nombres"].ToString() + " " + Session["Apellidos"].ToString();
                    lbltipousuario.InnerText += Session["tipousuario"].ToString();
                    diviniciarsesion.Visible = true;


                }
            }

        }
        protected void btnsalir_Click(object sender, EventArgs e)
        {
            Session["Nombres"] = null;
            Session["Apellidos"] = null;
            Session["tipousuario"] = null;
            Session["IDUsuario"] = null;

            Response.Redirect("Index.aspx");
        }
    }
}