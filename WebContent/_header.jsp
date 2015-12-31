<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<title>${param.title}</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  	<link href='https://fonts.googleapis.com/css?family=Play' rel='stylesheet' type='text/css'>
  	<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  	<link rel="stylesheet" type="text/css" href="css/custom.css">

  	<script type="text/javascript">
		$(document).ready(function() {
			$(".bg-footer img").mouseenter(function() {
				$(this).animate({bottom:'5px'}, 200);
			});
			$(".bg-footer img").mouseleave(function() {
				$(this).animate({bottom:'0'}, 200);
			});
		});
	</script>
</head>
<body>

<nav class="navbar navbar-default dd">
 	<div class="container">
    	<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span> 
      		</button>
      		<a class="navbar-brand" href="index.jsp">ZIYUE CHEN</a>
    	</div>
    	<div class="collapse navbar-collapse" id="myNavbar">
      		<ul class="nav navbar-nav navbar-right">
	        	<li><a href="index.jsp">HOME</a></li>
	        	<li><a href="about.jsp">ABOUT</a></li>
	        	<li><a href="resume.jsp">RESUME</a></li>
	        	<li><a href="contact.jsp">CONTACT</a></li>
      		</ul>
    	</div>
  	</div>
</nav>