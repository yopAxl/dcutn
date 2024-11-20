<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="puesto_seleccionado.aspx.cs" Inherits="DondeComerUTN_Visual.puesto_seleccionado" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Página principal de Donde Comer UTN">
    <meta name="generator" content="html5, css3">
    <meta name="keywords" content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donde comer UTN | Información del Puesto</title>
    <link rel="icon" href="imagenes\logo.ico">
    <link rel="stylesheet" href="estilos\esenciales.css">
    <link rel="stylesheet" href="estilos\puesto_seleccionado.css">

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdiCnMP1pEWaeZDzPUIhuvnn2wZpR4vXA"></script>
    <script>
        var currentMarker = null;

        function initMap() {
            // Obtener los valores de latitud y longitud desde los inputs
            var lat = parseFloat(document.getElementById('<%= tbLatitud.ClientID %>').value) || 21.42441595324204;
            var lng = parseFloat(document.getElementById('<%= tbLongitud.ClientID %>').value) || -104.89598823620567;

            var mapOptions = {
                center: { lat: lat, lng: lng },
                zoom: 17
            };
        
            // Crear el mapa con las opciones
            var map = new google.maps.Map(document.getElementById('map'), mapOptions);

            // Colocar el marcador inicial en la posición de lat y lng
            var initialPosition = { lat: lat, lng: lng };
            placeMarker(initialPosition, map);

            // Añadir evento para colocar un marcador cuando se haga clic en el mapa
            google.maps.event.addListener(map, 'click', function (event) {
                placeMarker(event.latLng, map);
            });
        }

        // Función para colocar un marcador en la ubicación especificada
        function placeMarker(location, map) {
            // Si ya existe un marcador, eliminarlo
            if (currentMarker) {
                currentMarker.setMap(null);
            }

            // Crear un nuevo marcador
            currentMarker = new google.maps.Marker({
                position: location,
                map: map
            });

            // Actualizar los inputs de latitud y longitud con la posición del marcador
            document.getElementById('<%= tbLatitud.ClientID %>').value = location.lat();
            document.getElementById('<%= tbLongitud.ClientID %>').value = location.lng();
        }

        // Iniciar el mapa al cargar la ventana
        google.maps.event.addDomListener(window, 'load', initMap);
    </script>

</head>
<body id="seccion">
    <a name="inicio"></a>
    <div class="spacertop layer1">
        <header>
            <a href="index.aspx"><img class="logo" src="imagenes\logo200x200.png" alt="Logo"></a>
            <h1 class="titulo">Donde comer UTN</h1>
            <nav>
                    <ul class="nav_links">
                        <li><a href="contacto.aspx">Contacto</a></li>
                    </ul>
            </nav>
            <a class="cta" href="index.aspx"><button>Inicio</button></a>
        </header>
    </div>

    <section class="info-contenedor">
        <div class="info_vendedor">
            <img src="<%= GetVendedorImageUrl() %>" alt="Foto Vendedor" class="img-circular" />
            <div class="info_texto">
                <h2><%= nombre_vendedor %> <%= apellido_vendedor %></h2>
            </div>
        </div>

        <div class="info_puesto">
            <h3>Nombre del Puesto:</h3>
            <p><%= nombre_puesto %></p>

            <h3>Descripción:</h3>
            <p><%= descripcion_puesto %></p>

            <h3>Menú:</h3>
            <p><%= menu_puesto %></p>

            <h3>Foto del Puesto:</h3>
            <img src="<%= GetPuestoImageUrl() %>" alt="Foto del Puesto" class="img-pequena" />

            <br />
            <h3>Ubicación del Puesto:</h3>
            <br />

            <form id="form1" runat="server" style="width: 70%;">
                <div id="map" style="height: 400px; width: 100%;"></div>
                <br />
                <asp:TextBox ID="tbLatitud" runat="server" placeholder="Aqui va la latitud" style="display: none"></asp:TextBox>
                <br />
                <asp:TextBox ID="tbLongitud" runat="server" placeholder="Aqui va la longitud" style="display: none"></asp:TextBox>

                <h3>Puntuación Promedio:</h3>
                <p><%= puntuacion_promedio %></p>

                <h3>Puntúa el trabajo de <%= nombre_vendedor %></h3>
                <asp:DropDownList ID="ddlCalificacion" runat="server">
                    <asp:ListItem Value="1">1 de 5 estrellas</asp:ListItem>
                    <asp:ListItem Value="2">2 de 5 estrellas</asp:ListItem>
                    <asp:ListItem Value="3">3 de 5 estrellas</asp:ListItem>
                    <asp:ListItem Value="4">4 de 5 estrellas</asp:ListItem>
                    <asp:ListItem Value="5">5 de 5 estrellas</asp:ListItem>
                </asp:DropDownList>

                <asp:Button ID="btnEnviar" runat="server" Text="Enviar mi Calificación" OnClick="btnEnviar_Click"/>
                <br />
                
            </form>
            <br />
            <a class="cta" href="main.aspx"><button>Atras</button></a>
        </div>
    </section>

    <div class="spacerbot layer2">
        <footer>
            <img src="imagenes\logo200x200.png" alt="Logo"><br>
            <h2>Donde comer UTN</h2>
            <p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
        </footer>
    </div>
</body>
</html>