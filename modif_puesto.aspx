<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modif_puesto.aspx.cs" Inherits="DondeComerUTN_Visual.modif_puesto" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Modificar información del puesto">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modificar Puesto</title>

    <link rel="icon" href="imagenes/logo.ico">
    <link rel="stylesheet" href="estilos/esenciales.css">
    <link rel="stylesheet" href="estilos/modif_puesto.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdiCnMP1pEWaeZDzPUIhuvnn2wZpR4vXA"></script>
    <script>
        var currentMarker = null;

        function initMap() {
            var lat = parseFloat(document.getElementById('<%= tbLatitud.ClientID %>').value) || 21.42441595324204;
            var lng = parseFloat(document.getElementById('<%= tbLongitud.ClientID %>').value) || -104.89598823620567;

            var mapOptions = {
                center: { lat: lat, lng: lng },
                zoom: 17
            };
        
            var map = new google.maps.Map(document.getElementById('map'), mapOptions);

            // Colocar marcador inicial
            var initialPosition = new google.maps.LatLng(lat, lng);
            placeMarker(initialPosition, map);

            // Añadir evento al hacer clic en el mapa
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
<body>
    <div class="spacertop layer1">
        <header>
            <a href="index.aspx"><img class="logo" src="imagenes/logo200x200.png"></a>
            <h1 class="titulo">Donde comer UTN</h1>
            <nav>
                <ul class="nav_links">
                    <li><a href="cerrar_sesion.aspx">Cerrar Sesión</a></li>
                    <li><a href="#">Reportar un Problema</a></li>
                </ul>
            </nav>
            <a class="cta" href="index.aspx"><button>Ir al Inicio</button></a>
        </header>
    </div>

    <div class="form-container">
        <h1>Modificar Información del Puesto</h1>
        <form id="form1" runat="server">
            <table>
                <!-- Nombre del Puesto -->
                <tr>
                    <td>
                        <label for="nombre">Nombre del Puesto:</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbNombrePuesto" runat="server" CssClass="input-field"></asp:TextBox>
                    </td>
                    <td>
						<asp:RequiredFieldValidator ID="rfNombrePuesto" runat="server" 
							Text=" * " ErrorMessage="El campo del Nombre del Puesto es obligatorio."
							ControlToValidate="tbNombrePuesto" CssClass="validaciones">
						</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Descripción del Puesto -->
                <tr>
                    <td>
                        <label for="descripcion">Descripción del Puesto:</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbDescripcionPuesto" runat="server" TextMode="MultiLine" CssClass="input-field"></asp:TextBox>
                    </td>
                    <td>
						<asp:RequiredFieldValidator ID="rfDescripcionPuesto" runat="server" 
							Text=" * " ErrorMessage="El campo del Descripcion del Puesto es obligatorio."
							ControlToValidate="tbDescripcionPuesto" CssClass="validaciones">
						</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Menú del Puesto -->
                <tr>
                    <td>
                        <label for="menu">Menú del Puesto:</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbMenuPuesto" runat="server" CssClass="input-field"></asp:TextBox>
                    </td>
                    <td>
						<asp:RequiredFieldValidator ID="rfMenuPuesto" runat="server" 
							Text=" * " ErrorMessage="El campo del Menu del Puesto es obligatorio."
							ControlToValidate="tbMenuPuesto" CssClass="validaciones">
						</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <!-- Foto del Puesto -->
                <tr>
                    <td>
                        <label for="foto">Foto del Puesto:</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:FileUpload ID="fuFotoPuesto" runat="server" />
                    </td>
                    <td>
						<asp:RequiredFieldValidator ID="rfFotoPuesto" runat="server" 
							Text=" * " ErrorMessage="El campo del Foto del Puesto es obligatorio."
							ControlToValidate="tbMenuPuesto" CssClass="validaciones">
						</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="imgFotoPuesto" runat="server" CssClass="img-preview" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="locacion">Donde encontrar tu puesto:</label>
                    </td>
                </tr>
				<tr>
					<td>
						<div id="map" style="height: 500px; width: 100%;"></div>
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
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="save-button" OnClick="btnGuardar_Click" />
                <a href="listado_productos.aspx"><button class="exit-button">Cancelar</button></a>

            <asp:ValidationSummary ID="vsModify" runat="server"  CssClass="validaciones"/>
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
