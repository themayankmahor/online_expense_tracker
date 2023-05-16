<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<a class="navbar-brand" href="#"><i
		class="fa-solid fa-money-bill-transfer mr-1"></i>Expense Tracker</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">

			<c:if test="${empty loginUser}">

				<li class="nav-item"><a class="nav-link active"
					href="index.jsp">Home</a></li>

			</c:if>


			<c:if test="${not empty loginUser}">

				<li class="nav-item"><a class="nav-link active"
					href="home.jsp">Home</a></li>


				<li class="nav-item"><a class="nav-link active"
					href="add_expense.jsp"><i class="fa-solid fa-plus mr-1"></i>Add
						Expense</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="view_expense.jsp"><i class="fa-solid fa-eye mr-1"></i>View
						All Expense</a></li>

			</c:if>
		</ul>

		<ul class="navbar-nav ml-auto">

			<c:if test="${not empty loginUser}">

				<li class="nav-item"><a class="nav-link active" href="#"><i
						class="fa-solid fa-user mr-1"></i></i>${loginUser.fullName }</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="../logout"><i class="fa-solid fa-right-from-bracket mr-1"></i></i>Logout</a></li>

			</c:if>


			<c:if test="${empty loginUser}">
				<li class="nav-item"><a class="nav-link active"
					href="login.jsp"><i class="fa-solid fa-right-to-bracket mr-1"></i>Login</a></li>

				<li class="nav-item"><a class="nav-link active"
					href="register.jsp"><i class="fa-solid fa-user-plus mr-1"></i>Register</a></li>
			</c:if>
		</ul>
	</div>
</nav>