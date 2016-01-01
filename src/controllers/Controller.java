package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;


/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject json = new JSONObject();
		PrintWriter pw = response.getWriter();
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			try {
				json.put("success", false);
				json.put("msg", "Failed to load MySQL Driver!");
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		Connection conn = null;
		
		try {
			String user_name = "root";
			
//			String user_password = "VFEfpv16481";
//			String URL =  "jdbc:mysql://node5354-ziyuechen.pai.ontopcorp.com/mywebsite";
			
			String user_password = "root"; //local server
			String URL =  "jdbc:mysql://localhost:3306/mywebsite";
			conn = (Connection)DriverManager.getConnection(URL, user_name, user_password);
			 
		} catch (SQLException e) {
			try {
				json.put("success", false);
				json.put("msg", "Failed to connect to the database!");
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		String action = request.getParameter("action");
		if(action==null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else if(action.equals("message")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String comments = request.getParameter("comments");
			
			try {
				if(name==null || name.trim().length()==0) {
					json.put("emptyName", true);
				} else {
					json.put("emptyName", false);
				}
				
				if(email==null || email.trim().length()==0) {
					json.put("emptyEmail", true);
				} else {
					json.put("emptyEmail", false);
				}
				
				if(comments==null || comments.trim().length()==0) {
					json.put("emptyComments", true);
				} else {
					json.put("emptyComments", false);
				}
				
				if(json.getBoolean("emptyName") || json.getBoolean("emptyEmail") 
						|| json.getBoolean("emptyComments")) {
					
					json.put("success", false);
					
				} else {
					java.util.Date uDate = new java.util.Date();
					java.sql.Date sDate = new java.sql.Date(uDate.getTime());

					String sql = "insert into message (name, email, comments, date) values (?, ?, ?, ?)";
					PreparedStatement stmt = conn.prepareStatement(sql);
					
					stmt.setString(1, name);
					stmt.setString(2, email);
					stmt.setString(3, comments);
					stmt.setString(4, sDate.toString());
					
					stmt.executeUpdate();
					stmt.close();
					
					json.put("success", true);
				}
				 
				
				pw.print(json.toString());
			} catch (SQLException e) {
				
				e.printStackTrace();
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		} else if(action.equals("delete")) {
			String id = request.getParameter("msg_id");
			
			
			String sql = "delete from message where idmessage=" + id;
			System.out.println(sql);
			
			PreparedStatement stmt;
			
			try {
				stmt = conn.prepareStatement(sql);
				stmt.executeUpdate();
				stmt.close();
				
				request.getRequestDispatcher("/secret_path.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
	}

}
