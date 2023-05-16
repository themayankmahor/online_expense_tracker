<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!--CSS-->
<%@include file="component/all_css.jsp"%>
<style type="text/css">
.card-shadow {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<!--Navbar-->
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class="card card-shadow">

					<div class="card-header">
						<h3 class="text-center fs-3">Login Page</h3>
						<c:if test="${not empty msg}">
							<h5 class="text-center text-danger">${msg}</h5>
							<c:remove var="msg" />
						</c:if>
					</div>
					<div class="card-body">

						<form action="login" method="post">

							<!--Email  -->
							<div class="mb-3">
								<label>Email</label> <input type="email" name="email"
									class="form-control">
							</div>

							<!-- Password -->
							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									class="form-control">
							</div>

							<button class="btn btn-success col-md-12">Login</button>

							<div class="text-center mt-2">
								Don't have account?<a href="register.jsp">Create One...</a>
							</div>

						</form>

					</div>
				</div>

			</div>

		</div>

	</div>

</body>
</html>