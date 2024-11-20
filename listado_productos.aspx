<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listado_productos.aspx.cs" Inherits="DondeComerUTN_Visual.listado_productos" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Etiquetas de metadatos -->
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Listado de productos registrados por el vendedor">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Listado de Productos</title>

    <!-- Enlaces externos -->
    <link rel="icon" href="imagenes/logo.ico">
    <link rel="stylesheet" href="estilos/esenciales.css">
    <link rel="stylesheet" href="estilos/listado_productos.css">
</head>
<body>
    <div class="spacertop layer1">
        <header>
            <a href="index.aspx"><img class="logo" src="imagenes/logo200x200.png"></a>
            <h1 class="titulo">Donde comer UTN</h1>
            <nav>
                <ul class="nav_links">

                </ul>
            </nav>
            <a class="cta" href="index.aspx"><button>Ir al Inicio</button></a>
        </header>
    </div>

    <div class="table-container">
        <h1>Listado de tus Productos</h1>
        <form id="form1" runat="server">
            <asp:GridView ID="gvPuestos" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id_puesto" OnRowDeleting="gvPuestos_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="nombre_puesto" HeaderText="Nombre Puesto" />
                    <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha de Creación" DataFormatString="{0:MM-dd-yyyy}" />
                    <asp:BoundField DataField="id_puesto" HeaderText="Código de Puesto" />
                    <asp:BoundField DataField="descripcion_puesto" HeaderText="Información del Proyecto" />
                    <asp:TemplateField HeaderText="Gestionar">
                        <ItemTemplate>
                            <div class="action-cell">
                                <a href="modif_puesto.aspx?id=<%# Eval("id_puesto") %>" class="edit-link">Editar Información</a>
                                <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Delete" CommandArgument='<%# Eval("id_puesto") %>' CssClass="delete-link">Eliminar</asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
        <a href="index.aspx"><button class="exit-button">Salir</button></a>
    </div>

    <div class="spacerbot layer2">
        <footer>
            <img src="imagenes/logo200x200.png"><br>
            <h2>Donde comer UTN</h2>
            <p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
        </footer>        
    </div>
</body>
</html>
