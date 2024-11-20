using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace DondeComerUTN_Visual
{
    public partial class modif_puesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("inicio_sesion.aspx");
            }

            if (!IsPostBack)
            {
                string idStr = Request.QueryString["id"];
                if (int.TryParse(idStr, out int id))
                {
                    LoadPuestoInfo(id);
                }
                else
                {
                    Response.Write("ID de puesto inválido.");
                }
            }
        }

        private void LoadPuestoInfo(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;
            string query = "SELECT nombre_puesto, descripcion_puesto, menu_puesto, foto_puesto, latitud, longitud FROM puesto WHERE id_puesto = @IdPuesto";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@IdPuesto", id);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    tbNombrePuesto.Text = reader["nombre_puesto"].ToString();
                    tbDescripcionPuesto.Text = reader["descripcion_puesto"].ToString();
                    tbMenuPuesto.Text = reader["menu_puesto"].ToString();
                    tbLatitud.Text = reader["latitud"].ToString();
                    tbLongitud.Text = reader["longitud"].ToString();

                    if (reader["foto_puesto"] != DBNull.Value)
                    {
                        byte[] fotoPuesto = (byte[])reader["foto_puesto"];
                        imgFotoPuesto.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(fotoPuesto);
                    }
                }
                else
                {
                    Response.Write("Puesto no encontrado.");
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;
            string query = "UPDATE puesto SET nombre_puesto = @nombre, descripcion_puesto = @descripcion, menu_puesto = @menu, foto_puesto = @foto, latitud = @latitud, longitud = @longitud WHERE id_puesto = @id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@nombre", tbNombrePuesto.Text);
                    command.Parameters.AddWithValue("@descripcion", tbDescripcionPuesto.Text);
                    command.Parameters.AddWithValue("@menu", tbMenuPuesto.Text);
                    command.Parameters.AddWithValue("@latitud", tbLatitud.Text);
                    command.Parameters.AddWithValue("@longitud", tbLongitud.Text);
                    command.Parameters.AddWithValue("@id", Request.QueryString["id"]);

                    // Manejar la imagen si se ha subido una nueva
                    if (fuFotoPuesto.HasFile)
                    {
                        byte[] imageData;
                        using (MemoryStream ms = new MemoryStream())
                        {
                            fuFotoPuesto.PostedFile.InputStream.CopyTo(ms);
                            imageData = ms.ToArray();
                        }
                        command.Parameters.Add("@foto", SqlDbType.VarBinary).Value = imageData;
                    }
                    else
                    {
                        // Si no se ha subido una nueva imagen, obtener la imagen existente
                        byte[] currentImageData = GetCurrentImageData(Request.QueryString["id"]);
                        command.Parameters.Add("@foto", SqlDbType.VarBinary).Value = currentImageData ?? (object)DBNull.Value;
                    }

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    // Aquí puedes manejar el resultado de la operación
                    Response.Redirect("listado_productos.aspx");
                }
            }
        }

        private byte[] GetCurrentImageData(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;
            string query = "SELECT foto_puesto FROM puesto WHERE id_puesto = @id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id", id);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != DBNull.Value)
                    {
                        return (byte[])result;
                    }
                    return null;
                }
            }
        }
    }
}
