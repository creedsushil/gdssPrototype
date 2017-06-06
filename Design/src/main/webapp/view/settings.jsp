
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Setting</title>



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" />
<link rel='stylesheet prefetch'
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900' />
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' />
<link rel="stylesheet" type="text/css" href="../resource/css/style.css" />

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<link rel="stylesheet" href="../resource/css/stylesMain.css"
	type="text/css" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
</head>

<body>

	<section id="body" class="width"> <aside id="sidebar"
		class="column-left"> <header><%--  <img
		src="<%=request.getContextPath()%>/image/5840eb5b-7a9e-417c-8b61-6311c1c4575e_angry-wolf-pictures-pretty"
		alt="Profile_Pic" /> --%>
	<h1>
		<a href="#" style="text-transform: uppercase;">ABC</a>
	</h1>

	</header> <nav id="mainnav">
	<ul>
		<li class="navBtns" id="home"><a href="../view/dashboard.jsp">Home</a></li>
		<li class="navBtns" id="group"><a href="../view/group.jsp">My
				Discussion</a></li>
		<li class="navBtns" id="createGroup"><a href="../view/createNew.jsp">Create
				New Discussion</a></li>
		<li class="navBtns selected-item" id="settings"><a>Settings</a></li>
		<li><a href="../login.jsp">Sign out</a></li>
	</ul>
	</nav> </aside> <section id="content" class="column-right"> <article>
	<div class="container"
		style="max-width: 700px; margin: 0 0 0 0; float: left;">
		<div class="card" style="display: none;"></div>
		<div class="card" style="padding: 0 !important;">
			<h1 class="title">Setting</h1>
			<div class="card" style="display: none;"></div>
			<div class="card">
				<div>
					<div class="toggle"></div>
					<c:if test="${not empty message}">
						<h2 class="error" id="registerError" style="color: red;">${message}</h2>
					</c:if>
					<form action="settings" id="setting" method="POST">
						<div id="image" style="">
							<input type="file" id="pp" name="profilePic"
								style="display: none;" /> <label id="defImage"
								style="color: #6fab4f; background-color: #fbbec9; position: relative; left: 160px;"><i
								class="fa fa-user" style="font-size: 100px;" aria-hidden="true"></i></label>
						</div>
						<div class="input-container">
							<label for="#{label}" class="label">Email</label> <input
								type="email" id="#{label}" required="required" value="${email }"
								style="color: lightblue;" readonly="readonly" />
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<label for="#{label}" class="label">Username</label> <input
								type="text" id="#{label}" required="required"
								style="text-transform: uppercase; color: lightblue;"
								value="${username }" readonly="readonly" />
							<div class="bar"></div>
						</div>

						<div class="input-container">
							<input type="password" id="#{label}" required="required"
								value="${password }" name="password" /> <label for="#{label}">Password</label>
							<div class="bar"></div>
						</div>
						<div class="input-container">
							<input type="password" id="passwordre" required="required"
								value="${password }" /> <label for="#{label}">Repeat
								Password</label>
							<div class="bar"></div>
						</div>
						<div class="button-container" onclick="submitForm();">
							<button disabled="disabled">
								<span>Update</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	</article> <footer class="clear">
	<p>&copy; Group decesion support system</p>
	</footer> </section>

	<div class="clear"></div>
	<div class="modal">
		<!-- overlay or cover -->
	</div>
	<div class="chatBox">
		<div class="chatHead">
			<span class="chatSpan"></span><span
				style="top: 5px; left: 25px; position: relative;"><i
				class='fa fa-times' style="position: fixed; cursor: pointer;"
				onclick="closeChat()"></i></span>
		</div>
		<div class="chatBody"></div>
		<div style="margin-left: 5px;">
			<textarea class="chatMsg" id="chatMessage" style="resize: none"></textarea>
			<button class="chatBtn" id="send" onclick="submitChat();">Send</button>
		</div>
	</div>
	</section>
	<script type="text/javascript" src="../resource/js/index.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#defImage').click(function(e) {
				e.preventDefault();
				$('#pp').click();
			});
		});

		function submitForm() {
			$.ajax({
				url : "settings",
				type : "POST",
				data : $("#setting").serialize(),
				success : function(resp) {
					$("#main").html(resp);
				},
				error : function() {

				}
			});
		}
	</script>
</body>
</html>