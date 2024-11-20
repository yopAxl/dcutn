using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DondeComerUTN_Visual
{
    public partial class contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string autorMensaje = tbCorreo.Text;
            string mensaje = tbComentarios.Text;

            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO contacto (autor_mensaje, mensaje, status) VALUES (@AutorMensaje, @Mensaje, 'no leido')";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@AutorMensaje", autorMensaje);
                    cmd.Parameters.AddWithValue("@Mensaje", mensaje);

                    try
                    {
                        connection.Open();
                        cmd.ExecuteNonQuery();
                        string script = "alert('Comentario enviado con éxito!');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                    catch (Exception ex)
                    {
                        // Manejo de errores
                        string script = $"alert('Error al enviar comentario: {ex.Message}');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                }
            }
        }
    }
}