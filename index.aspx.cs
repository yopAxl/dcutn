using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DondeComerUTN_Visual
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                userSessionTrue.Style["display"] = "inline-block";
            }
            else
            {
                userSessionFalse.Style["display"] = "inline-block";
            }
        }

        protected void libtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Elimina la sesión actual
            Response.Redirect("inicio_sesion.aspx"); // Redirige al usuario a la página de inicio de sesión
        }
    }
}