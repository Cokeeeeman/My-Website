<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="_header.jsp">
<c:param name="title" value="Home | Ziyue's Website"></c:param>
</c:import>

<div class="container-fluid bg-body text-center">
	
	<a id="sp_login" href="#"><img src="images/ziyuechen.png"></a>
	<h3>Ziyue Chen</h3>
	
	<div id="description">
		<p>Hi guys, welcome to my website!</p>

		<p>Let me introduce myself first. My name is Ziyue Chen. I'm from China. I graduated from UCI this March and got my Master's Degree in Computer Engineering. Before that, I studied Microelectronics back in college. I'm really into coding. It is the passion of my life. I really think I can do something with it, something big and make a change. </p> 

		<p>This website is still in development. I'm currently planning on adding more stuff into it. But still, you can find a lot things about me. Check out the ABOUT section.</p>

		<p>Thanks for visiting. Hope you enjoy! :D</p>
	</div>
</div>

<!-- Modal -->
  <div class="modal fade" id="login_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 style="color:black; text-align: center;"><span class="glyphicon glyphicon-lock"></span> Secret Path </h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          
            
           	<div class="form-group" style="color:black;">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Who's there?</label>
              <input type="text" class="form-control" id="psw">
            </div>
            
              <button class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Give me cheese!</button>
          
        </div>
   		<div class="modal-footer" style="color:red;" id="error">
          
        </div>
      </div>
      
    </div>
  </div> 
  
  <script>
  $(document).ready(function() {
	  $("#sp_login").click(function() {
		  $("#login_modal").modal();
		  
	  });
	  
	  $("#login_modal .btn").click(function() {
		  var psw = document.getElementById("psw").value;
		  if(psw=="cokeeeeman") {
			  window.location = "secret_path.jsp";
		  } else {
			  document.getElementById("error").innerHTML = "Access Denied!";
		  }
	  });
  });
  
  </script>

<c:import url="_footer.jsp"></c:import>