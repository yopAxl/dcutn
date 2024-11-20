<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DondeComerUTN_Visual.index" %>

<!DOCTYPE html>
<html lang="es">

<head runat="server">
    <!--	ETIQUETAS DE METADATOS	-->
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Página principal de Donde Comer UTN">
    <meta name="generator" content="html5, css3">
    <meta name="keywords"
          content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Donde comer UTN | Inicio</title>

    <!--	ETIQUETAS DE ENLACES EXTERNOS	-->
    <link rel="icon" href="imagenes\logo.ico">
    <link rel="stylesheet" href="estilos\esenciales.css">
    <link rel="stylesheet" href="estilos\index.css">
</head>

<body id="seccion">
    <a name="inicio"></a>
    <div class="spacertop layer1">
        <header>
            <a href="index.aspx"><img class="logo" src="imagenes\logo200x200.png"></a>
            <h1 class="titulo">Donde comer UTN</h1>
            <nav>
                <form id="form1" runat="server">
                    <ul class="nav_links">
                        <div id="userSessionTrue" runat="server" style="display: none;">
                            <li><a href="reg_puesto.aspx">Registrar nuevo Puesto</a></li>
                            <li><a href="listado_productos.aspx">Mis Productos</a></li>
                            <li><asp:LinkButton ID="libtnCerrarSesion" runat="server" OnClick="libtnCerrarSesion_Click">Cerrar Sesión</asp:LinkButton></li>
                        </div>

                        <div id="userSessionFalse" runat="server" style="display: none;">
                            <li><a href="inicio_sesion.aspx">Iniciar Sesion</a></li>
                        </div>
                        <li><a href="#aboutus">Acerca de nosotros</a></li>
                    </ul>
                </form>
            </nav>
            <a class="cta" href="main.aspx"><button>Ir al Inicio</button></a>
        </header><!--	FIN HEADER	-->
    </div>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v21.0"></script>

    <section>
        <div class="cont_redondo">
            <h1>Comienza a Usarla</h1>
            <p>
                Si deseas comenzar a utilizar la aplicación de <strong>Donde comer UTN</strong>, presiona el siguiente
                <strong>botón.</strong>
            </p>
            <a class="cta" href="main.aspx"><button><strong>¡Presiona aquí!</strong></button></a>
        </div>
    </section>

    <section class="row">
        <div class="wrap_img">
            <img src="imagenes\aboutus.png">
        </div>
        <div class="wrap_content">
            <h1>Acerca de Nosotros</h1>
            <a name="aboutus"></a>
            <p>
                Somos estudiantes de la carrera de "Tecnologías de la información", esta página fue creada para que los
                estudiantes de la Universidad Tecnológica (UT), tengan una herramienta con el que se les facilite la
                búsqueda de puntos de venta y comercio de alimentos para estudiantes, docentes e incluso personas que
                visiten la universidad.
            </p>
            <p>
                Con la facilidad de un clic, puedes consultar tus productos favoritos, vendedores de confianza y precios
                accesibles.
            </p>
        </div>
    </section>


    <br /><br />

    <h1>Enterate de Cambios</h1>
    <div class="fb-page" data-href="https://www.facebook.com/profile.php?id=61569347570125" data-tabs="timeline, events, messages" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/profile.php?id=61569347570125" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/profile.php?id=61569347570125">Donde Comer UTN</a></blockquote></div>
    
    <br />
    <div class="fb-like" data-href="https://www.facebook.com/profile.php?id=61569347570125" data-width="" data-layout="button" data-action="like" data-size="large" data-share="true"></div>

    <br /><br />
    <div class="spacerbot layer2">
        <footer>
            <img src="imagenes\logo200x200.png"><br>
            <h2>Donde comer UTN</h2>
            <p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
            <a href="#inicio" class="ancla"><strong>Ir al Inicio</strong></a>
        </footer>
    </div>
</body>

</html>