<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<hr />
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
		 <a class="navbar-brand" href="#">STUDENT_APPLICATION</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#StdAdminMenu" aria-controls="StdAdminMenu" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <div class="collapse navbar-collapse" style="text-align: center;"  id="StdAdminMenu">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        			<li class="nav-item">
          				<a class="nav-link active" aria-current="page" href="ShowStudents.jsp">Students</a>
        			</li>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AddClass.jsp">Classes</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AddTeacher.jsp">Teachers</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AddSubject.jsp">Subjects</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AddSubj_Cls_Mapp.jsp">Assign Subject</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AddSubj_Cls_Tcher_Mapp.jsp">Assign Teacher</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="AdminLogout.jsp">Logout</a>
			        </li>
			   </ul>
		</div>
	  </div>
</nav>
<hr />
</body>
</html>