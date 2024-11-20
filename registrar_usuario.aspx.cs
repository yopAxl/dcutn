
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using objWord = Microsoft.Office.Interop.Word;

namespace DondeComerUTN_Visual
{
    public partial class registrar_usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbNombre.Attributes.Add("placeholder", "Ingrese su Nombre");
                tbApellido.Attributes.Add("placeholder", "Ingrese su Apellido");
                tbCorreo.Attributes.Add("placeholder", "Ingrese un Correo");
                tbContra.Attributes.Add("placeholder", "Ingrese una Contraseña");
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (fuFotoCara.HasFile && fuFotoCredencial.HasFile)
            {
                byte[] fotoCaraData = fuFotoCara.FileBytes;
                byte[] fotoCredencialData = fuFotoCredencial.FileBytes;

                string connectionString = "Data Source=localhost\\SQLEXPRESS; Initial Catalog=DCUTN; Integrated Security=True";
                string query = "SELECT COUNT(*) FROM vendedor WHERE correo_vendedor = @Correo";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();

                        using (SqlCommand cmd = new SqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@Correo", tbCorreo.Text);
                            int userCount = (int)cmd.ExecuteScalar();

                            if (userCount > 0)
                            {
                                string script = "alert('Usuario ya existente!');";
                                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                            }
                            else
                            {
                                query = "INSERT INTO vendedor (nombre_vendedor, apellido_vendedor, correo_vendedor, contrasena_vendedor, foto_cara, foto_credencial) VALUES (@Nombre, @Apellido, @Correo, @Contrasena, @FotoCara, @FotoCredencial)";

                                using (SqlCommand command = new SqlCommand(query, connection))
                                {
                                    command.Parameters.AddWithValue("@Nombre", tbNombre.Text);
                                    command.Parameters.AddWithValue("@Apellido", tbApellido.Text);
                                    command.Parameters.AddWithValue("@Correo", tbCorreo.Text);
                                    command.Parameters.AddWithValue("@Contrasena", tbContra.Text);
                                    command.Parameters.AddWithValue("@FotoCara", fotoCaraData);
                                    command.Parameters.AddWithValue("@FotoCredencial", fotoCredencialData);

                                    int result = command.ExecuteNonQuery();

                                    if (result > 0)
                                    {
                                        string script = "alert('Usuario creado correctamente!');";
                                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                                        Response.Redirect("inicio_sesion.aspx");
                                    }
                                    else
                                    {
                                        string script = "alert('Error al registrar usuario.');";
                                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        string script = $"alert('Error: {ex.Message}');";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
                    }
                }
            }
            else
            {
                string script = "alert('Por favor, seleccione ambos archivos.');";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
            }
        }

        protected void btnGuardaInformacion_Click(object sender, EventArgs e)
        {
            /*  Declaración de Variables.   */
            string licNombre, licApellido, licCorreo, licContra;
            
            licNombre = tbNombre.Text;
            licApellido = tbApellido.Text;
            licCorreo = tbCorreo.Text;
            licContra = tbContra.Text;

            string ruta = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
            objWord.Application objAplicacion = new objWord.Application();
            objWord.Document objDocumento = objAplicacion.Documents.Add();

            /*  Parrafo 1 */
            objWord.Paragraph objParrafo1 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo1.Range.Text = "\nInformación de Registro de Cuenta en DCUTN";
            objParrafo1.Range.Font.Size = 16;
            objParrafo1.Range.Font.Bold = 1;
            objParrafo1.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo1.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphCenter;
            objParrafo1.Range.InsertParagraphAfter();

            /*  Parrafo 2 */
            objWord.Paragraph objParrafo2 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo2.Range.Font.Size = 11;
            objParrafo2.Range.Font.Bold = 1;
            objParrafo2.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo2.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphCenter;
            objParrafo2.Range.Text = "Documento generado el día: " + DateTime.Now.ToString("dd/MM/yyyy");
            objParrafo2.Range.InsertParagraphAfter();

            /*  Parrafo 3 */
            objWord.Paragraph objParrafo3 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo3.Range.Text = "\nNombre del Usuario: " + licNombre;
            objParrafo3.Range.Font.Size = 13;
            objParrafo3.Range.Font.Bold = 1;
            objParrafo3.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo3.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphLeft;
            objParrafo3.Range.InsertParagraphAfter();

            /*  Parrafo 4 */
            objWord.Paragraph objParrafo4 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo4.Range.Text = "Apellido: " + licApellido;
            objParrafo4.Range.Font.Size = 13;
            objParrafo4.Range.Font.Bold = 1;
            objParrafo4.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo4.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphLeft;
            objParrafo4.Range.InsertParagraphAfter();

            /*  Parrafo 5 */
            objWord.Paragraph objParrafo5 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo5.Range.Text = "Correo: " + licCorreo;
            objParrafo5.Range.Font.Size = 13;
            objParrafo5.Range.Font.Bold = 1;
            objParrafo5.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo5.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphLeft;
            objParrafo5.Range.InsertParagraphAfter();

            /*  Parrafo 6 */
            objWord.Paragraph objParrafo6 = objDocumento.Paragraphs.Add(Type.Missing);
            objParrafo6.Range.Text = "Contraseña: " + licContra;
            objParrafo6.Range.Font.Size = 13;
            objParrafo6.Range.Font.Bold = 1;
            objParrafo6.Range.Font.Color = objWord.WdColor.wdColorBlack;
            objParrafo6.Alignment = objWord.WdParagraphAlignment.wdAlignParagraphLeft;
            objParrafo6.Range.InsertParagraphAfter();

            /*  Parrafo 7 */
            string imagePath = Server.MapPath("~/imagenes/logo.png");
            objWord.InlineShape picture = objDocumento.InlineShapes.AddPicture(imagePath);
            picture.Width = 75;  // Ajustar el ancho de la imagen
            picture.Height = 75; // Ajustar la altura de la imagen

            objDocumento.SaveAs2(ruta + "\\InformacionRegistroDCUTN.docx");
            objDocumento.Close();
            objAplicacion.Quit();

            string script = "alert('Documento Generado para impresión Correctamente');";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, true);
        }
    }
}