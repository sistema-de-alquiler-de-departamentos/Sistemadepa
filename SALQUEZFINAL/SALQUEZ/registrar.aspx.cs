using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SALQUEZ
{
    public partial class Publica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/regisquierobuscar.aspx");
        }

        protected void btnarrendador_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/regisquieropublicar.aspx");
        }
    }
}