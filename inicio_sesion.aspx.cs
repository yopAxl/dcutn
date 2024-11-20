using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DondeComerUTN_Visual
{
    public partial class inicio_sesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string email = tbCorreo.Text.Trim(); // Captura el correo electrónico ingresado
            string password = tbContra.Text.Trim(); // Captura la contraseña ingresada

            // Cadena de conexión a la base de datos
            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM vendedor WHERE correo_vendedor = @Correo AND contrasena_vendedor = @Contrasena";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Correo", email);
                        cmd.Parameters.AddWithValue("@Contrasena", password);

                        int userCount = (int)cmd.ExecuteScalar(); // Cuenta el número de filas que coinciden

                        if (userCount > 0)
                        {
                            // El usuario existe y las credenciales son correctas
                            Session["UserEmail"] = email; // Guarda el correo electrónico en la sesión
                            Response.Redirect("main.aspx"); // Redirige al usuario a la página de inicio de sesión
                        }
                        else
                        {
                            // Las credenciales no son correctas
                            string script = "alert('Credenciales incorrectas. Por favor, inténtelo de nuevo.');";
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                            tbCorreo.Text = "";
                            tbContra.Text = "";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    string script = "alert('Ocurrió un error: " + ex.Message + "');";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
            }
        }
    }
}