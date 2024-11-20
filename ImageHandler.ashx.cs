using System;
using System.Data.SqlClient;
using System.Web;

public class ImageHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string id = context.Request.QueryString["id"];
        string type = context.Request.QueryString["type"];

        string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                connection.Open();
                string query = type == "vendedor" ?
                    "SELECT foto_cara FROM vendedor WHERE correo_vendedor = @Id" :
                    "SELECT foto_puesto FROM puesto WHERE id_puesto = @Id";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    byte[] imageBytes = cmd.ExecuteScalar() as byte[];

                    if (imageBytes != null)
                    {
                        context.Response.ContentType = "image/png"; // Ajusta según el tipo de imagen
                        context.Response.BinaryWrite(imageBytes);
                    }
                    else
                    {
                        context.Response.ContentType = "image/png";
                        context.Response.WriteFile(context.Server.MapPath("~/imagenes/default.png")); // Imagen por defecto
                    }
                }
            }
            catch (Exception ex)
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Ocurrió un error: " + ex.Message);
            }
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
