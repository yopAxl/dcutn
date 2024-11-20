<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrar_usuario.aspx.cs" Inherits="DondeComerUTN_Visual.registrar_usuario" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<!--	ETIQUETAS DE METADATOS	-->
	<meta charset="UTF-8">
	<meta name="author" content="VAJE">
	<meta name="description" content="Página principal de Donde Comer UTN">
	<meta name="generator" content="html5, css3">
	<meta name="keywords" content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Donde comer UTN | Principal</title>

	<!--	ETIQUETAS DE ENLACES EXTERNOS	-->
	<link rel="icon" href="imagenes\logo.ico">
	<link rel="stylesheet" href="estilos\esenciales.css">
	<link rel="stylesheet" href="estilos\registro_usuario.css">
</head>
<body id="seccion">
		<div class="spacertop layer1">
			<header>
				<img class="logo" src="imagenes\logo200x200.png">
				<h1 class="titulo">Donde comer UTN</h1>
				<nav>
					<ul class="nav_links">
						<li><a href="inicio_sesion.aspx">Iniciar Sesion</a></li>
					</ul>
				</nav>
				<a class="cta" href="main.aspx"><button>Menú Principal</button></a>
			</header><!--	FIN HEADER	-->
		</div>

		<!--CUADRO DE REGISTRO-->
		<section class="form-register">
            <form id="form1" runat="server">
				<h1>Registrar nueva cuenta</h1>
                <table width="100%">
                    <tr>
                        <td>
							<asp:Label ID="lbNombre" runat="server" Text="Nombre" required="true"></asp:Label>
                        </td>
                    </tr>
					<tr>
						<td>
							<asp:TextBox ID="tbNombre" runat="server" CssClass="controls" placeholder="Ingresa tu Nombre" ></asp:TextBox>
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfNombre" runat="server" 
								Text=" * " ErrorMessage="El campo del Nombre es obligatorio."
								ControlToValidate="tbNombre" CssClass="validaciones">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="reNombre" runat="server" 
								Text=" * " ErrorMessage="En el campo de Nombre solo se permiten letras y espacios en blanco." 
								ValidationExpression="^[A-Za-z\s]*$" CssClass="validaciones"
								 ControlToValidate="tbNombre">
							</asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="lbApellido" runat="server" Text="Apellido"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="tbApellido" runat="server" CssClass="controls" placeholder="Ingresa tu Apellido" ></asp:TextBox>
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfApellido" runat="server" 
								Text=" * " ErrorMessage="El campo del Apellido es obligatorio."
								ControlToValidate="tbApellido" CssClass="validaciones">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="reApellido" runat="server" 
								Text=" * " ErrorMessage="En el campo de Apellido solo se permiten letras y espacios en blanco." 
								ValidationExpression="^[A-Za-z\s]*$" CssClass="validaciones"
								 ControlToValidate="tbApellido">
							</asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="lbCorreo" runat="server" Text="Correo Electrónico"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="tbCorreo" runat="server" CssClass="controls" placeholder="Ingresa tu Correo" ></asp:TextBox>
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfCorreo" runat="server" 
								Text=" * " ErrorMessage="El campo del Correo es obligatorio."
								ControlToValidate="tbCorreo" CssClass="validaciones">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
								Text=" * " ErrorMessage="En el campo de Correo no tiene el formato correcto." 
								ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="validaciones"
								 ControlToValidate="tbCorreo">
							</asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="lbContra" runat="server" Text="Contraseña"></asp:Label>
						</td>
					</tr>
					<tr>
						<td>
							<asp:TextBox ID="tbContra" runat="server" CssClass="controls" placeholder="Ingresa tu Contraseña" TextMode="Password"></asp:TextBox>
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfContra" runat="server" 
								Text=" * " ErrorMessage="El campo del Contraseña es obligatorio."
								ControlToValidate="tbCorreo" CssClass="validaciones">
							</asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="reContra" runat="server" 
								Text=" * " ErrorMessage="En el campo de Contraseña no tiene el formato correcto." 
								ValidationExpression="^[A-Za-z0-9]*[-]*[_]*[.]*[@]*$" CssClass="validaciones"
								 ControlToValidate="tbContra">
							</asp:RegularExpressionValidator> 
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="lbFotoCara" runat="server" Text="Foto de Perfil"></asp:Label><br />
						</td>
					</tr>
					<tr>
						<td>
							<asp:FileUpload ID="fuFotoCara" runat="server" /><br /><br />
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfFotoCara" runat="server" 
								Text=" * " ErrorMessage="El campo del Foto de tu Cara es obligatorio."
								ControlToValidate="fuFotoCara" CssClass="validaciones">
							</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label ID="lbFotoCredencial" runat="server" Text="Foto de Credencial UTN"></asp:Label><br />
						</td>
					</tr>
					<tr>
						<td>
							<asp:FileUpload ID="fuFotoCredencial" runat="server" /><br /><br />
						</td>
						<td>
							<asp:RequiredFieldValidator ID="rfFotoCredencial" runat="server" 
								Text="        * " ErrorMessage="El campo del Foto de tu Credencial es obligatorio."
								ControlToValidate="fuFotoCredencial" CssClass="validaciones">
							</asp:RequiredFieldValidator>
						</td>
					</tr>
                </table>
				<asp:Button ID="btnEnviar" runat="server" Text="Registrarme" CssClass="botons" OnClick="btnEnviar_Click" />
				<p><a href="inicio_sesion.aspx">Ya tengo una Cuenta</a></p>

				<asp:Button ID="btnGuardaInformacion" runat="server" Text="Guardar Información Actual" CssClass="botons" OnClick="btnGuardaInformacion_Click"/>

				<asp:ValidationSummary ID="vsSignIn" runat="server"  CssClass="validaciones"/>
            </form>

		</section>
		<br> <br>
		<hr class="espacio">
		<!--FIN DE CUADRO-->

		<div  class="spacerbot layer2">
			<footer>
				<img src="imagenes\logo200x200.png"><br>
				<h2>Donde comer UTN</h2>
				<p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
				<a href="#inicio" class="ancla"><strong>Ir al Inicio</strong></a>
			</footer>		
		</div>
</body>
</html>
