<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="database.Tshirts"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="navbar justify-content-between"
		style="background-color: #e3f2fd;">
		<h1>Product Search</h1>
		<form class="form-inline" action="logout">
			<span class="p-1">Welcome @${username}</span><input type="submit"
				class="btn btn-outline-danger" value="Logout">
		</form>
	</nav>

	<div class="m-1">
		<div class="p-4">
			<form action="search" method="post">
				<div class="form-group row">
					<label class="col-2">Color</label><input type="text" class="col-3"
						id="color" name="color" placeholder="Enter color" required />
				</div>
				<div class="form-group row">
					<label class="col-2">Size</label><input type="text" class="col-3"
						name="size" placeholder="S/M/L, etc." required />
				</div>
				<div class="form-group row">
					<label class="col-2">Gender Preference</label><input type="text"
						class="col-3" name="genderPreference" placeholder="M, F or U"
						required />
				</div>
				<div class="form-group row">
					<label class="col-2">Sort By</label>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							name="priceCheckbox" value="yes"> <label
							class="form-check-label">Price</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox"
							name="ratingCheckbox" value="yes"> <label
							class="form-check-label">Rating</label>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-10">
						<input type="submit" class="btn btn-outline-info" value="Search" />
					</div>
				</div>
			</form>
		</div>

		<div class="table-responsive p-4">
			<table class="table table-bordered table-hover p-1">
				<thead class="thead-light">
					<th>ID</th>
					<th>Name</th>
					<th>Color</th>
					<th>Gender</th>
					<th>Size</th>
					<th>Price</th>
					<th>Rating</th>
				</thead>
				<tbody>
					<%
						try {
							String color = request.getParameter("color");
							String size = request.getParameter("size");
							String gender = request.getParameter("genderPreference");
							String price = request.getParameter("priceCheckbox");
							String rating = request.getParameter("ratingCheckbox");
							SessionFactory factory = new Configuration().configure("tshirts.cfg.xml").buildSessionFactory();
							Session dbsession = factory.openSession();

							if (color == null) {
								String query = "from Tshirts";
								Query q = dbsession.createQuery(query);

								List<Tshirts> ls = q.list();
								System.out.println("dcdvc" + ls.size());
								int cnt = 1;
								for (Tshirts ts : ls) {
					%>
					<tr>
						<td><%=ts.getId()%></td>
						<td><%=ts.getName()%></td>
						<td><%=ts.getColor()%></td>
						<td><%=ts.getGender()%></td>
						<td><%=ts.getSize()%></td>
						<td><%=ts.getPrice()%></td>
						<td><%=ts.getRating()%></td>
					<tr>
						<%
							}
						%>
						<caption>List of all products</caption>
						<%
							}

								else {

									String query = "from Tshirts where color=:co and gender=:gen and size=:sz";

									if (price != null && rating != null) {
										query += " order by rating desc, price";
									} else if (price != null) {
										query += " order by price";
									} else if (rating != null) {
										query += " order by rating desc";
									} else {
										query += " order by id";
									}

									System.out.println("\n\n" + query + "\n\n\n\n");
									Query q = dbsession.createQuery(query);
									q.setParameter("co", color);
									q.setParameter("gen", gender);
									q.setParameter("sz", size);
									List<Tshirts> ls = q.list();
									if (ls.isEmpty()) {
						%><caption>No records found</caption>
						<%
							} else {
										for (Tshirts ts : ls) {
						%>
					
					<tr>
						<td><%=ts.getId()%></td>
						<td><%=ts.getName()%></td>
						<td><%=ts.getColor()%></td>
						<td><%=ts.getGender()%></td>
						<td><%=ts.getSize()%></td>
						<td><%=ts.getPrice()%></td>
						<td><%=ts.getRating()%></td>
					<tr>
						<%
							}
						%><caption>Search results</caption>
						<%
							}

								}
								dbsession.close();
								factory.close();
							} catch (Exception e) {

								System.out.println(e);
							}
						%>
					
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
