

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Product
 */
@WebServlet("/Product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	try {	
		
		FileInputStream inputStream = null;
		 
		 
		String url="jdbc:mysql://localhost:3306/fd";
		String user="root";
		String password="passmysql";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection(url,user,password);
		HttpSession session=request.getSession(false); 
		String n="har";
		 Statement st = con.createStatement();
		 InputStream in = new FileInputStream("new.jpeg");
		 String fname=request.getParameter("n");
			String pname=request.getParameter("pname");
			String des=request.getParameter("pdes");
			String cat=request.getParameter("pcat");
			String weight=request.getParameter("pwght");
			String exp=request.getParameter("pdate");
			String place=request.getParameter("place");
			String img=request.getParameter("img");
			File image = new File("");
			inputStream = new FileInputStream(image);
		
		String query="INSERT INTO product_details  (`pname`, `description`, `category`, `weight`, `exp_date`,'image','fname') VALUES ('hhh', 'nn', 'bb', 'bb', '2020-08-12','"+inputStream+"',"+in+")";
		
		
		
		int s=st.executeUpdate(query);
		if(s==1)
		{
			System.out.println(s);
			
		}
		else{
			
			System.out.println("no");
		}
		
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
