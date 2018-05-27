<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="prjGestionVuelos.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link href="resources/css/login.css" rel="stylesheet" />
    <link href="resources/css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Fredoka+One" rel="stylesheet"/>
    <link href="resources/css/bootstrap-theme.css" rel="stylesheet" />
    <script src="resources/js/jquery-3.1.1.min.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    <link href="resources/img/avion-ico.ico" rel="icon" type="image/png"/>
    <title>Gestion de Vuelos | LOGIN</title>
</head>
<body>
    <div class="text-center styleFondo" style="padding:50px 0">    
	<asp:Image id="imgLogin" runat="server" CssClass="img-responsive center-block" ImageUrl="~/resources/img/avion-login.png"/>      
	<!-- Main Form -->
	<div class="login-form-1">    
        <form id="frmLogin" runat="server">        
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="lg_username" class="sr-only">usuario</label>                        						
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="username"></asp:TextBox>
					</div>
					<div class="form-group">
						<label for="lg_password" class="sr-only">clave</label>
                        <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="password"></asp:TextBox>						
					</div>

					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="lg_remember" name="lg_remember"/>
						<label for="lg_remember">recordar</label>
					</div>
				</div>				
                <asp:Button ID="btnEntrar" runat="server" CssClass="login-button" Text="GO" OnClick="btnEntrar_Click"/>
			</div>
			<div class="etc-login-form">
				<p>¿Olvido su contraseña? <a href="#">click aqui</a></p>				
			</div>	
            </form>        
		
	</div>
    <asp:Panel ID="pnlAlerta" runat="server">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="alert alert-info alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <asp:Label ID="lblMensaje" runat="server" CssClass="text-center" ForeColor="#000000"></asp:Label>
            </div>
        </div>  	
    </asp:Panel>

	<!-- end:Main Form -->

</div>   
</body>
</html>
