<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio_sesion.aspx.cs" Inherits="DondeComerUTN_Visual.inicio_sesion" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <!-- ETIQUETAS DE METADATOS -->
    <meta charset="UTF-8">
    <meta name="author" content="VAJE">
    <meta name="description" content="Página principal de Donde Comer UTN">
    <meta name="generator" content="html5, css3">
    <meta name="keywords" content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Donde comer UTN | Inicio de Sesión</title>

    <!-- ETIQUETAS DE ENLACES EXTERNOS -->
    <link rel="icon" href="imagenes\logo.ico">
    <link rel="stylesheet" href="estilos\esenciales.css">
    <link rel="stylesheet" href="estilos\login.css">
</head>
<body id="seccion">
    <div class="spacertop layer1">
        <header>
            <a href="index.aspx"><img class="logo" src="imagenes\logo200x200.png"></a>
            <h1 class="titulo">Donde comer UTN</h1>
                <nav>
			        <ul class="nav_links">
						<li><a href="registrar_usuario.aspx">Registrar Vendedor</a></li>
					</ul>
                </nav>
            <a class="cta" href="main.aspx"><button>Menú Principal</button></a>
        </header><!-- FIN HEADER -->
    </div>

    <!--CUADRO DE INICIO DE SESIÓN-->
    <div class="formulario">
        <h1>Iniciar Sesión</h1>

        <form id="form1" runat="server">
            <br />
            <table width="100%">
                <tr>
                    <td>
                        <div class="username">
                            <asp:TextBox ID="tbCorreo" runat="server" CssClass="username" placeholder=" " ></asp:TextBox>
                            <asp:Label ID="lblCorreo" runat="server" AssociatedControlID="tbCorreo" CssClass="username-label" Text="Correo Electrónico"></asp:Label>
                        </div>
                        <br /><br />
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="reCorreo" runat="server"
                            Text=" * " ErrorMessage="El formato del Correo Electrónico no es el correcto."
                            ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="validaciones"
                            ControlToValidate="tbCorreo"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfCorreo" runat="server" 
                            Text=" * " ErrorMessage="El campo del Correo Electrónico es obligatorio."
                            ControlToValidate="tbCorreo" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="username">
                            <asp:TextBox ID="tbContra" runat="server" TextMode="Password" CssClass="username" placeholder=" " ></asp:TextBox>
                            <asp:Label ID="lblContra" runat="server" AssociatedControlID="tbContra" CssClass="username-label" Text="Contraseña"></asp:Label>
                        </div>
                        <br />
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="reContra" runat="server"
                            Text=" * " ErrorMessage="El formato del Correo Electrónico no es el correcto."
                            ValidationExpression="^[A-Za-z0-9]*[-]*[_]*[.]*[@]*$" CssClass="validaciones"
                            ControlToValidate="tbContra"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfContra" runat="server" 
                            Text=" * " ErrorMessage="El campo del Contraseña es obligatorio."
                            ControlToValidate="tbContra" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" CssClass="submit-button" OnClick="btnIniciarSesion_Click"/>
            <div class="recordar">
                <br />
                <a href="#">¿Olvidó su contraseña?</a>
            </div>
            <div class="registrarse">
                <a href="registrar_usuario.aspx">Registrarme</a>
            </div>
            <asp:ValidationSummary ID="vsLogin" runat="server"  CssClass="validaciones"/>
        </form>
    </div>
    <hr class="espacio">
    <!--FIN DE CUADRO-->

    <div class="spacerbot layer2">
        <footer>
            <img src="imagenes\logo200x200.png"><br>
            <h2>Donde comer UTN</h2>
            <p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
        </footer>      
    </div>
</body>
</html>
