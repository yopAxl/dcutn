using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace DondeComerUTN_Visual
{
    public partial class reg_puesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("inicio_sesion.aspx");
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            if (fuPuesto.HasFile)
            {
                byte[] fotoPuestoData = fuPuesto.FileBytes;

                string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();

                        string email = Session["UserEmail"].ToString();
                        string query = "SELECT id_vendedor FROM vendedor WHERE correo_vendedor = @Correo";
                        int idVendedor = 0;
                        using (SqlCommand cmd = new SqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@Correo", email);
                            idVendedor = (int)cmd.ExecuteScalar();
                        }

                        query = "INSERT INTO puesto (id_vendedor, nombre_puesto, descripcion_puesto, menu_puesto, foto_puesto, fecha_creacion, latitud, longitud) VALUES (@IdVendedor, @NombrePuesto, @DescripcionPuesto, @MenuPuesto, @FotoPuesto, @FechaCreacion, @Latitud, @Longitud)";
                        using (SqlCommand cmd = new SqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@IdVendedor", idVendedor);
                            cmd.Parameters.AddWithValue("@NombrePuesto", tbNombre.Text.Trim());
                            cmd.Parameters.AddWithValue("@DescripcionPuesto", tbDescripcion.Text.Trim());
                            cmd.Parameters.AddWithValue("@MenuPuesto", taMenu.Text);
                            cmd.Parameters.AddWithValue("@FotoPuesto", fotoPuestoData);
                            cmd.Parameters.AddWithValue("@FechaCreacion", DateTime.Now);
                            cmd.Parameters.AddWithValue("@Latitud", tbLatitud.Text.Trim());
                            cmd.Parameters.AddWithValue("@Longitud", tbLongitud.Text.Trim());

                            cmd.ExecuteNonQuery();
                        }

                        string script = "alert('Puesto registrado correctamente.');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                        Response.Redirect("listado_productos.aspx");
                    }
                    catch (Exception ex)
                    {
                        string script = "alert('Ocurrió un error: " + ex.Message + "');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                }
            }
            else
            {
                string script = "alert('No se ha seleccionado un archivo.');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
        }
    }
}