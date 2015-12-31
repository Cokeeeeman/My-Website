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
          			<input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        		</div>
        		<div class="col-sm-6 form-group">
          			<input class="form-control" id="email" name="email" placeholder="Email" type="email"  required>
        		</div>
      		</div>
      		<textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      		<div class="row">
        		<div class="col-sm-12 form-group">
          			<button class="btn btn-default pull-right" type="submit">Send</button>
        		</div>
      		</div>
      		</form> 
    	</div>
  	</div>
  	
	
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div> -->
    </div>

  </div>
</div>

<script>
$(document).ready(function() {
	
	$("form").submit(function(event) {
		var formData = {
				'action'	: $('input[name=action]').val(),
				'name'		: $('input[name=name]').val(),
				'email'		: $('input[name=email]').val(),
				'comments'	: $('textarea[name=comments]').val()
		};
		
		var contextPath = "${pageContext.request.contextPath}";
		
		$.ajax({
			type		: 'post',
			url			: contextPath + '/message_center',
			data		: formData,
			dataType	: 'json',
			success		: function(data) {
				
	               			if(!data.success) {
	               				$(".modal-content").removeClass("alert-success");
	               				$(".modal-content").addClass("alert-danger");
	               				
	               				$(".modal-header h4").html("Oops!");
	               				
	               				if(data.emptyName) {
	               					$(".modal-body").append('<p><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Do you mind telling me your name? </p>');
	               				}
	               				
	               				if(data.emptyEmail) {
	               					$(".modal-body").append('<p><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Please leave me your email so I can reach back to you. </p>');
	               				}
	               				
	               				if(data.emptyComments) {
	               					$(".modal-body").append('<p><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Don' + "'t you wanna make a comment? </p>");
	               				}
	               				
	               				$("#myModal").modal();
	               				
	               				$(".modal-header button").click(function() {
	               					$(".modal-body p").remove();
	               				});
	               				
	               				
	               			} else {
	               				$(".modal-content").removeClass("alert-danger");
	               				$(".modal-content").addClass("alert-success");
	               				$(".modal-header h4").html("Congratulations!");
	               				$(".modal-body").append('<p><span class="glyphicon glyphicon-check"></span> Your message has been sent!</p>');
	               				$("#myModal").modal();
	               				$(".modal-header button").click(function() {
	               					$(".modal-body p").remove();
	               				});
	               			}
	          			  }		
		});
		
		event.preventDefault();
		
	});
	
});

</script>



<c:import url="_footer.jsp"></c:import>