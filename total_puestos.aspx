<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="total_puestos.aspx.cs" Inherits="DondeComerUTN_Visual.total_puestos" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="author" content="VAJE">
	<meta name="description" content="Página principal de Donde Comer UTN">
	<meta name="generator" content="html5, css3">
	<meta name="keywords" content="utn, utnay, donde comer, donde comer ut, donde comer utnay, comida ut, comida utnay, universidad tecnologica de nayarit">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Donde comer UTN | Página Principal</title>

	<link rel="icon" href="imagenes\logo.ico">
	<link rel="stylesheet" href="estilos\esenciales.css">
	<link rel="stylesheet" href="estilos\total_puestos.css">
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
							<li><a href="registrar_usuario.aspx">Registrar Vendedor</a></li>
						</div>

						<li><a href="contacto.html">Contacto</a></li>
					</ul>
				</form>
			</nav>
			<a class="cta" href="index.aspx"><button>Ir al Inicio</button></a>
		</header>
	</div>

	
	<h1>Puestos Registrados</h1>
	<div class="row">
		<asp:Repeater ID="rptTodosPuestos" runat="server">
			<ItemTemplate>
				<div class="puesto">
					<a href="puesto_seleccionado.aspx?id=<%# Eval("id_puesto") %>"<h3><%# Eval("nombre_puesto") %></h3></a>
                    <br />
					<asp:Image ID="imgPuesto" runat="server" ImageUrl='<%# "~/ImageHandler.ashx?id=" + Eval("id_puesto") %>' CssClass="img-circular" />
					<p>Puntuación: <%# Eval("puntuacion_promedio") %></p>
					<p>Fecha de Creación: <%# Eval("fecha_creacion") %></p>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>

	<div class="spacerbot layer2">
		<footer>
			<img src="imagenes\logo200x200.png"><br>
			<h2>Donde comer UTN</h2>
			<p>Carretera Federal 200 Km. Xalisco, Nayarit</p>
		</footer>		
	</div>
</body>
</html>