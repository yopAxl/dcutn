using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DondeComerUTN_Visual
{
    public partial class main : System.Web.UI.Page
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

            // Llama al método BindPuestos para cargar los datos
            if (!IsPostBack)
            {
                BindPuestos();
            }
        }

        protected void libtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Elimina la sesión actual
            Response.Redirect("inicio_sesion.aspx"); // Redirige al usuario a la página de inicio de sesión
        }

        private void BindPuestos()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Obtener los puestos mejor puntuados
                string queryMejoresPuntuados = "SELECT TOP 3 id_puesto, nombre_puesto, puntuacion_promedio FROM puesto ORDER BY puntuacion_promedio DESC";
                SqlCommand cmdMejoresPuntuados = new SqlCommand(queryMejoresPuntuados, conn);
                SqlDataAdapter daMejoresPuntuados = new SqlDataAdapter(cmdMejoresPuntuados);
                DataTable dtMejoresPuntuados = new DataTable();
                daMejoresPuntuados.Fill(dtMejoresPuntuados);
                rptMejoresPuntuados.DataSource = dtMejoresPuntuados;
                rptMejoresPuntuados.DataBind();

                // Obtener los puestos recién agregados
                string queryRecienAgregados = "SELECT TOP 3 id_puesto, nombre_puesto, fecha_creacion FROM puesto ORDER BY fecha_creacion DESC";
                SqlCommand cmdRecienAgregados = new SqlCommand(queryRecienAgregados, conn);
                SqlDataAdapter daRecienAgregados = new SqlDataAdapter(cmdRecienAgregados);
                DataTable dtRecienAgregados = new DataTable();
                daRecienAgregados.Fill(dtRecienAgregados);
                rptRecienAgregados.DataSource = dtRecienAgregados;
                rptRecienAgregados.DataBind();
            }
        }
    }
}