<% 
	String id = (String)session.getAttribute("id");
	if(id == null){ %>
		<jsp:forward page="index.jsp"/>
	<%}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale:1.0">
		<meta charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="myFirstCss.css"/>
		<title>AP EAPCET</title>
	</head>
	<body>		
		<section class="nav">
			<a href="">Home</a>
			<a href="">Contact us</a>
			<a href="">College/Dept.Login</a>
		</section>
		<section class="headers">
			<img id="aplogo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgW7LSWg8Vd2QmOc-IAI0YiU7JXe79OMRaug&s" alt="APSCHE LOGO" height="85px" width="100"/>
			<img id="govlogo" height="85px" width="100" src="https://e7.pngegg.com/pngimages/694/117/png-clipart-andhra-pradesh-uttar-pradesh-states-and-territories-of-india-telangana-chief-minister-andhrapradesh-miscellaneous-logo-thumbnail.png"/>
			<h1 class="s1"> Deparment of Technical Education </h1>
			<h1 id="title1"> AP EAPCET - 2024 ADMISSIONS </h1>
			<h1 class="s1"> (Admissions into Engineering & Pharmacy Courses - M.P.C Stream) </h1>
		</section>
		<section class="anno">
			<h4 class="s2"><img src="https://eapcet-sche.aptonline.in/EAPCET/images/new.gif" alt="new"/> Allotment of seats have been enabled. </h4>
		</section>
		
		<div>
			<span id="form1">
				<ul class="custom-bullets">
					<lh><center>FORMS</center></lh>
					<li><img src="https://eapcet-sche.aptonline.in/EAPCET/images/new.gif" alt="new"/><a href="https://eapcet-sche.aptonline.in/EAPCET/eapAllotment">Download of Allotment Order</a></li>
					<li><img src="https://eapcet-sche.aptonline.in/EAPCET/images/new.gif" alt="new"/><a href="https://eapcet-sche.aptonline.in/EAPCET/collegeWiseAllotedReport"> College wise Allotment </a></li>

				</ul>
			</span>
			<span id="info">
				<ul class="custom-bullets">
					<lh><center>INFORMATION BULLETIN / DOWNLOADS</center></lh>
					<li> Institute Profile </li>
					<li> List of Courses </li>
					<li> List of Colleges and Courses </li>
					<li> Self-supporting course for JNTKSS </li>
					<li> EAPCET-2024 detailed notification </li>
					<li> List of HLCS </li>
					<li> Public notice </li>
				</ul>
			</span>
			<span id="dates">
				<ul class="custom-bullets">
					<lh><center>IMPORTANT DATES</center></lh>
					<li><img src="https://eapcet-sche.aptonline.in/EAPCET/images/new.gif" alt="new"/> Allotment of Seats: 17.07.2024 </li>
					<li> Self Reporting & Reporting at college: 17.07.2024 to 22.07.2024 </li>
					<li> Commencement of class work 19.07.2024 </li>
				</ul>
			</span>		
		</div>

		<footer>
			<span class="left1"> &copy; Copy Rights Reserved with Hemanth Sai V </span>
			<span class="right1"> Designed and Developed by Hemanth Sai V </span>
		</footer>
	</body>
</html>