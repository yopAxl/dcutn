using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using objWord = Microsoft.Office.Interop.Word;


namespace DondeComerUTN_Visual
{
    public partial class puesto_seleccionado : System.Web.UI.Page
    {
        protected string nombre_puesto;
        protected string descripcion_puesto;
        protected string menu_puesto;
        protected string puntuacion_promedio;
        protected string nombre_vendedor;
        protected string apellido_vendedor;
        protected string email_vendedor;
        protected string latitud;
        protected string longitud;

        protected void Page_Load(object sender, EventArgs e)
        {
            string idPuesto = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idPuesto))
            {
                LoadPuestoInfo(idPuesto);
            }
        }

        protected void libtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon(); // Elimina la sesión actual
            Response.Redirect("inicio_sesion.aspx"); // Redirige al usuario a la página de inicio de sesión
        }

        private void LoadPuestoInfo(string idPuesto)
        {
            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Obtener información del puesto
                    string queryPuesto = "SELECT nombre_puesto, descripcion_puesto, menu_puesto, foto_puesto, puntuacion_promedio, id_vendedor, latitud, longitud FROM puesto WHERE id_puesto = @IdPuesto";
                    using (SqlCommand cmdPuesto = new SqlCommand(queryPuesto, connection))
                    {
                        cmdPuesto.Parameters.AddWithValue("@IdPuesto", idPuesto);
                        using (SqlDataReader reader = cmdPuesto.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nombre_puesto = reader["nombre_puesto"].ToString();
                                descripcion_puesto = reader["descripcion_puesto"].ToString();
                                menu_puesto = reader["menu_puesto"].ToString();
                                puntuacion_promedio = reader["puntuacion_promedio"].ToString();
                                tbLatitud.Text = reader["latitud"].ToString();
                                tbLongitud.Text = reader["longitud"].ToString();
                                email_vendedor = GetVendedorEmail(reader["id_vendedor"].ToString());
                            }
                        }
                    }

                    // Obtener información del vendedor
                    string queryVendedor = "SELECT nombre_vendedor, apellido_vendedor FROM vendedor WHERE correo_vendedor = @EmailVendedor";
                    using (SqlCommand cmdVendedor = new SqlCommand(queryVendedor, connection))
                    {
                        cmdVendedor.Parameters.AddWithValue("@EmailVendedor", email_vendedor);
                        using (SqlDataReader reader = cmdVendedor.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nombre_vendedor = reader["nombre_vendedor"].ToString();
                                apellido_vendedor = reader["apellido_vendedor"].ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                }
            }
        }

        private string GetVendedorEmail(string idVendedor)
        {
            // Lógica para obtener el correo del vendedor basado en id_vendedor
            string email = "";
            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT correo_vendedor FROM vendedor WHERE id_vendedor = @IdVendedor";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@IdVendedor", idVendedor);
                    connection.Open();
                    object result = cmd.ExecuteScalar();
                    email = result != null ? result.ToString() : "";
                }
            }
            return email;
        }

        public string GetVendedorImageUrl()
        {
            return $"ImageHandler.ashx?id={email_vendedor}&type=vendedor";
        }

        public string GetPuestoImageUrl()
        {
            return $"ImageHandler.ashx?id={Request.QueryString["id"]}&type=puesto";
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string calificacion = ddlCalificacion.SelectedValue;

            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
                    UPDATE puesto 
                    SET 
                        puntuacion = puntuacion + @Calificacion,
                        veces_puntuado = veces_puntuado + 1 
                    WHERE 
                        id_puesto = @IdPuesto";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@IdPuesto", Request.QueryString["id"]);
                    cmd.Parameters.AddWithValue("@Calificacion", calificacion);
                    cmd.ExecuteNonQuery();
                    string script = "alert('Calificación Enviada!');";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                }
            }

            // Recargar la información del puesto después de enviar la calificación
            string idPuesto = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(idPuesto))
            {
                LoadPuestoInfo(idPuesto);
            }
        }


    }
}
