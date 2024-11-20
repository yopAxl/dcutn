<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="DondeComerUTN_Visual.contacto" %>

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

	<title>Donde comer UTN | Contacto</title>

	<!--	ETIQUETAS DE ENLACES EXTERNOS	-->
	<link rel="icon" href="imagenes\logo.ico">
	<link rel="stylesheet" href="estilos\esenciales.css">
	<link rel="stylesheet" href="estilos\contacto.css">

</head>
<body id="seccion">
		<a name="inicio"></a>
		<div class="spacertop layer1">
			<header>
				<a href="index.aspx"><img class="logo" src="imagenes\logo200x200.png"></a>
				<h1 class="titulo">Donde comer UTN</h1>
				<nav>
					<ul class="nav_links">

					</ul>
				</nav>
				<a class="cta" href="main.aspx"><button>Menú Principal</button></a>
			</header><!--	FIN HEADER	-->
		</div>
		<section>
			<h3>Contacto</h3>
			<h1>Hola!, ¿Cómo podemos ayudarte? </h1>
		</section>

	<div class="contenedores">
		<form id="form1" runat="server">
			<table class="form-table">
				<tr>
					<td colspan="2">
						<label for="informacion">No lo olvides, para un contacto directo puedes escribir a WhatsApp al número:</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="telefono">+52 33 2199 3127</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="comentarios">Comentarios:</label>
					</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="tbComentarios" runat="server" TextMode="MultiLine" Rows="4" CssClass="styledTextBox noResize"></asp:TextBox>
					</td>
					<td>
                        <asp:RequiredFieldValidator ID="rfCoemntarios" runat="server" 
                            Text=" * " ErrorMessage="El campo del Correo Electrónico es obligatorio."
                            ControlToValidate="tbComentarios" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td>
						<label for="correo">Correo Electrónico para Contacto:</label>
					</td>
				</tr>
				<tr>
					<td>
						<asp:TextBox ID="tbCorreo" runat="server" CssClass="styledTextBox" TextMode="Email"></asp:TextBox>
					</td>
					<td>
                        <asp:RequiredFieldValidator ID="rfCorreo" runat="server" 
                            Text=" * " ErrorMessage="El campo del Correo Electrónico es obligatorio."
                            ControlToValidate="tbCorreo" CssClass="validaciones">
                        </asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<asp:Button ID="btnEnviar" runat="server" Text="Enviar Comentarios" CssClass="reg" OnClick="btnEnviar_Click" />
					</td>
				</tr>
			</table>
            <br />
			<asp:ValidationSummary ID="vsContacto" runat="server"  CssClass="validaciones"/>
		</form>
	</div>


		<div  class="spacerbot layer2">
			<footer>
				<img src="imagenes\logo200x200.png"><br>
				<h2>Donde comer UTN</h2>
				<p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
				<a href="index.aspx" class="ancla"><strong>Ir al Inicio</strong></a>
			</footer>		
		</div>
</body>
</html>

