

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dealer
 */
@WebServlet("/Dealer")
public class Dealer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dealer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		String fname=request.getParameter("fname");
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String city=request.getParameter("city");
		int  pincode=Integer.parseInt(request.getParameter("pincode"));
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String passwd=request.getParameter("password");
		long mno=Long.parseLong(request.getParameter("mno"));
		String address=request.getParameter("address");
		
		
		
		
		try {
		String url="jdbc:mysql://localhost:3306/fd";
		String user="root";
		String password="passmysql";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,user,password);
		String query="insert into Dealer values (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2,uname);
		ps.setString(3,email);
		ps.setLong(4,mno);
		ps.setString(5,gender);
		ps.setString(6,address);
		ps.setString(7,city);
		ps.setInt(8,pincode);
		ps.setString(9,state);
		ps.setString(10,country);
		ps.setString(11, passwd);
		
		int rs=ps.executeUpdate();	
		out.println(rs);
		
         con.close();
			
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
