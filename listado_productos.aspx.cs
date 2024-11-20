using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DondeComerUTN_Visual
{
    public partial class listado_productos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] == null)
                {
                    // Redirige a la página de inicio de sesión si no hay sesión
                    Response.Redirect("inicio_sesion.aspx");
                }
                else
                {
                    LoadPuestos();
                }
            }
        }
        private void LoadPuestos()
        {
            // Obtener el ID del vendedor de la sesión
            string email = Session["UserEmail"].ToString();
            string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Obtener el ID del vendedor
                    string query = "SELECT id_vendedor FROM vendedor WHERE correo_vendedor = @Correo";
                    int idVendedor;
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Correo", email);
                        idVendedor = (int)cmd.ExecuteScalar();
                    }

                    // Obtener los puestos del vendedor
                    query = "SELECT id_puesto, nombre_puesto, descripcion_puesto, menu_puesto, foto_puesto, fecha_creacion FROM puesto WHERE id_vendedor = @IdVendedor";
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@IdVendedor", idVendedor);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvPuestos.DataSource = dt;
                        gvPuestos.DataBind();
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
        protected void gvPuestos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idPuesto = Convert.ToInt32(gvPuestos.DataKeys[e.RowIndex].Value);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DCUTN"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM puesto WHERE id_puesto = @idPuesto";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@idPuesto", idPuesto);
                    command.ExecuteNonQuery();
                }
            }

            LoadPuestos(); // Recargar los datos para reflejar los cambios.
        }
    }
}
