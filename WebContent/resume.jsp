<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="_header.jsp">
<c:param name="title" value="Resume | Ziyue's Website"></c:param>
</c:import>

<div class="container-fluid bg-body text-center">
	<h1>RESUME</h1>
	<div class="resume">
		<h3>Skills</h3><hr>
		<p><b>Programming Languages : </b> Java, JSP, JSTL, HTML, CSS, Javascript, JQuery, PHP, Ruby on Rails, SQL</p>
		<p><b>IDEs and Tools :</b> Eclipse, Sublime, MySQL, Bash, GitHub, BitBucket, Heroku, Cloud9</p>

		<h3>Certifications</h3><hr>
		<p><span class="glyphicon glyphicon-certificate"></span> Oracle Certified Professional, Java SE6 Programmer</p>

		<h3>Projects</h3><hr>
		<h4><span class="glyphicon glyphicon-wrench"></span> Property Management System</h4>
		<p> - Implemented a simple system in Rails which is able to manage resources like rooms and guests;</p>
		    
		
		<h4><span class="glyphicon glyphicon-wrench"></span> Web Forum</h4>
		<p> - Designed and implemented a small forum in Java which is able to perform basic operations like post, reply, delete, modify and search keywords;<br>
		    - Utilized Java Bean, JSP, JDBC, Apache Tomcat v7.0, and CKEditor.</p>
		
		<h4><span class="glyphicon glyphicon-wrench"></span> Web Search Engine</h4>
		<p> - Implemented a simple search engine in Java; <br>
		    - Crawled the ics.uci.edu domain with Crawler4j, an open source library;  <br>
		    - Applied TF-IDF, NDCG, cosine distance, anchor text to optimize and evaluate searching performance;</p>
		
		<h4><span class="glyphicon glyphicon-wrench"></span> Tank War</h4>
		<p> - Implemented a tank shooting game in Java imitating the classic game Battle City.</p>

		<h3>Education</h3><hr>
		<h4>University of California, Irvine, USA (Sept.2013 - Mar.2015)</h4>
		<p>Master of Science in Computer Engineering</p>
		<h4>Sun Yat-sen University, China (Sept.2009 - June 2013)</h4>
		<p>Bachelor of Engineering in Microelectronics</p>
		
	</div>
</div>

<c:import url="_footer.jsp"></c:import>