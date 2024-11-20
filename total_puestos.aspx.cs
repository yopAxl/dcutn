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
    public partial class total_puestos : System.Web.UI.Page
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

        private void BindPuestos()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Obtener todos los puestos
                string queryTodosPuestos = "SELECT id_puesto, nombre_puesto, puntuacion_promedio, fecha_creacion FROM puesto ORDER BY id_puesto ASC";
                SqlCommand cmdTodosPuestos = new SqlCommand(queryTodosPuestos, conn);
                SqlDataAdapter daTodosPuestos = new SqlDataAdapter(cmdTodosPuestos);
                DataTable dtTodosPuestos = new DataTable();
                daTodosPuestos.Fill(dtTodosPuestos);
                rptTodosPuestos.DataSource = dtTodosPuestos;
                rptTodosPuestos.DataBind();
            }
        }

        protected void libtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Elimina la sesión actual
            Response.Redirect("inicio_sesion.aspx"); // Redirige al usuario a la página de inicio de sesión
        }
    }
}