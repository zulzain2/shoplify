<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>


<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

	<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
     <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon1.png"/>
		<title>MyCafe</title>
	
		 <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
		<link rel="stylesheet" href="indexassets/css/main.css" />
		<noscript><link rel="stylesheet" href="indexassets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
        <form id="form2" runat="server">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>MyCafe</h1>
						<p>Fast &nbsp;&bull;&nbsp; Easy &nbsp;&bull;&nbsp; Powerful</p>
						<nav>
							<ul>
                               
								<li> <h5 class="font-weight-bold">Staff<asp:ImageButton ID="Button1" runat="server" ImageUrl="~/assets/images/staff.png" style="height:100%; width:100%;"/></h5></li>
                                <li></li>
								<li>  <h5 class="font-weight-bold">Customer<asp:ImageButton ID="Button2" runat="server" ImageUrl="~/assets/images/customer.png" style="height:100%; width:100%;"/></h5></li>
								
                                    
							</ul>
						</nav>
					</header>

				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; 2019 My Cafe </span>
					</footer>

			</div>
		</div>
		<script>
			window.onload = function() { document.body.classList.remove('is-preload'); }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
            </form>
	</body>
</html>


