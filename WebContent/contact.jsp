<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="_header.jsp">
<c:param name="title" value="Contact | Ziyue's Website"></c:param>
</c:import>

<% 

String name = request.getAttribute("name") == null ? "" : (String)request.getAttribute("name");
String email = request.getAttribute("email") == null ? "" : (String)request.getAttribute("email");
String comments = request.getAttribute("comments") == null ? "" : (String)request.getAttribute("comments");

%> 

<div class="container-fluid bg-body">
	
	<h1 class="text-center">CONTACT</h1>
  	<div class="row">
    	<div class="col-sm-5">
      		<p>Leave me a message or email me by clicking the address below.</p>
		    <a class="email-link" href="mailto:ziyuechen@yahoo.com"><span class="glyphicon glyphicon-envelope"></span> ziyuechen@yahoo.com</a>
    	</div>
    	
   		<div class="col-sm-7">
   			<form action="<c:url value="/message_center" />" method="post">
   			<input type="hidden" name="action" value="message">
      		<div class="row">
        		<div class="col-sm-6 form-group">
          			<input class="form-control" id="name" name="name" placeholder="Name" type="text" value="<%=name %>" required>
        		</div>
        		<div class="col-sm-6 form-group">
          			<input class="form-control" id="email" name="email" placeholder="Email" type="email" value="<%=email %>" required>
        		</div>
      		</div>
      		<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5" value="<%=comments %>"></textarea><br>
      		<div class="row">
        		<div class="col-sm-12 form-group">
          			<button class="btn btn-default pull-right" type="submit">Send</button>
        		</div>
      		</div>
      		</form> 
    	</div>
  	</div>
	
</div>

<% String msg = (String)request.getAttribute("succeed"); %>
<% if(msg!=null && msg.equals("true")) { %>
<div class="alert alert-success">
  	Your message has been successfully submitted!
</div>
<% } else { %>
<div class="alert alert-danger">
  	Message submission failed!
</div>
<% }  %>

<c:import url="_footer.jsp"></c:import>