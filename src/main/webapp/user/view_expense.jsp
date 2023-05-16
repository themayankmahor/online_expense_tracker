<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/all_css.jsp"%>
</head>
<body>

	<c:if test="${empty loginUser}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<!--Navbar-->
	<%@include file="../component/navbar.jsp"%>

	<div class="container">

		<div class="row">

			<div class="col-md-8 offset-md-2">
				<div class="card">

					<div class="card-header">
						<h3 class="text-center">All Expenses</h3>
						<c:if test="${not empty msg}">
							<h5 class="text-center text-success">${msg}</h5>
							<c:remove var="msg" />
						</c:if>
					</div>

					<div class="card-body">

						<table class="table">
							<thead>


								<tr>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>


							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("loginUser");

								ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
								List<Expense> expenseList = expenseDao.getAllExpense(user);

								for (Expense ex : expenseList) {
								%>
								<tr>
									<th scope="row"><%=ex.getTitle()%></th>
									<td><%=ex.getDescription()%></td>
									<td><%=ex.getDate()%></td>
									<td><%=ex.getTime()%></td>
									<td>Rs. <%=ex.getPrice()%></td>
									<td><a href="edit_expense.jsp?id=<%=ex.getId()%>"
										class="btn btn-sm btn-primary me-1">Edit</a> <a
										href="../deleteExpense?id=<%=ex.getId()%>"
										class="btn btn-sm btn-danger me-1">Delete</a></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>

				</div>

			</div>
		</div>

	</div>

</body>
</html>