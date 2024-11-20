<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg_puesto.aspx.cs" Inherits="DondeComerUTN_Visual.reg_puesto" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Página principal de Donde Comer UTN">
    <meta name="generator" content="html5, css3">
    <meta name="keywords" content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Donde comer UTN | Registrar Puesto</title>

    <link rel="icon" href="imagenes/logo.ico">
    <link rel="stylesheet" href="estilos/esenciales.css">
    <link rel="stylesheet" href="estilos/reg_puesto.css">

     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdiCnMP1pEWaeZDzPUIhuvnn2wZpR4vXA"></script>
	 <script>
         var currentMarker = null;

         function initMap() {
             var mapOptions = {
                 center: { lat: 21.42441595324204, lng: -104.89598823620567 },
                 zoom: 17
             };
             var map = new google.maps.Map(document.getElementById('map'), mapOptions);

             google.maps.event.addListener(map, 'click', function (event) {
                 if (currentMarker) {
                     currentMarker.setMap(null);
                 }
                 placeMarker(event.latLng, map);
             });
         }

         function placeMarker(location, map) {
             if (currentMarker) {
                 currentMarker.setMap(null);
             }
             currentMarker = new google.maps.Marker({
                 position: location,
                 map: map
             });
             var tbLatitud = document.getElementById('<%= tbLatitud.ClientID %>');
             tbLatitud.value = location.lat();

             var tbLongitud = document.getElementById('<%= tbLongitud.ClientID %>');
             tbLongitud.value = location.lng();
         }
         google.maps.event.addDomListener(window, 'load', initMap);
     </script>

</head>
<body id="seccion">
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

    <div class="form-container">
        <h1>Registrar Nuevo Puesto</h1>
        <form id="form1" runat="server">
            <table>
                <!-- Nombre del Puesto -->
                <tr>
                    <td>
                        <label for="nombre">Nombre del Puesto</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbNombre" runat="server" placeholder="Mi nombre de puesto."></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfNombre" runat="server" 
                            Text=" * " ErrorMessage="El campo del Nombre es obligatorio."
                            ControlToValidate="tbNombre" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Descripción del Puesto -->
                <tr>
                    <td>
                        <label for="descripcion">Descripción corta de tu Puesto</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbDescripcion" runat="server" placeholder="Mi pequeña descripción."></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfDescripcion" runat="server" 
                            Text=" * " ErrorMessage="El campo del Descripcion es obligatorio."
                            ControlToValidate="tbDescripcion" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Imágenes del Puesto -->
                <tr>
                    <td>
                        <label for="imagenes">Introduce Imágenes de tu Puesto</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuPuesto" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfPuesto" runat="server" 
                            Text=" * " ErrorMessage="El campo del Puesto es obligatorio."
                            ControlToValidate="fuPuesto" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Menú del Puesto -->
                <tr>
                    <td>
                        <label for="menu">Ingresa el Menú de tu Puesto</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="taMenu" TextMode="MultiLine" Rows="2" Columns="20" runat="server" placeholder="-> Producto&#10;-> Producto&#10;-> Producto&#10;-> Producto"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfMenu" runat="server" 
                            Text=" * " ErrorMessage="El campo del Menu es obligatorio."
                            ControlToValidate="taMenu" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="locacion">Donde encontrar tu puesto:</label>
                    </td>
                </tr>
				<tr>
					<td>
						<div id="map" style="height: 500px; width: 90%;"></div>
					</td>
				</tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbLatitud" runat="server" placeholder="Aqui va la latitud" style="display: none"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbLongitud" runat="server" placeholder="Aqui va la longitud" style="display: none"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfCoordenadas" runat="server" 
                            Text="Error: Selecciona donde se encuentra tu puesto en el mapa." ErrorMessage="Es obligatorio marcar la ubicación de tu puesto."
                            ControlToValidate="tbLatitud" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar Información" CssClass="button" OnClick="btnEnviar_Click" />
            <asp:ValidationSummary ID="vsRegPuesto" runat="server"  CssClass="validaciones"/>
        </form>
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
