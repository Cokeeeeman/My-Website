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
		PrintWriter pw = response.getWriter();
		request.setAttribute("msg", "");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			pw.println("Can't load database driver!");
		}
		
		Connection conn = null;
		
		try {
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mywebsite", "root", "root");
		} catch (SQLException e) {
			pw.println("Can't connect to the database!");
		}
		
		pw.println("Connected to the database!");
		
		String action = request.getParameter("action");
		if(action==null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else if(action.equals("message")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String comments = request.getParameter("comments");
			
			String sql = "insert into message (name, email, comments) values (?, ?, ?)";
			PreparedStatement stmt;
			
			try {
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, name);
				stmt.setString(2, email);
				stmt.setString(3, comments);
				
				stmt.executeUpdate();
				stmt.close();
				
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				request.setAttribute("comments", comments);
				request.setAttribute("succeed", "true");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
	}

}
