

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		PrintWriter out=response.getWriter();
	
		String url="jdbc:mysql://localhost:3306/fd";
		String user="root";
		String password="passmysql";
		String query ="select * from admin";
		String uname=request.getParameter("uname");
		String pas=request.getParameter("pass");
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,user,password);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while (rs.next()) 
            {
                String name=rs.getString("username");
                String pass=rs.getString("passwd");
                if(uname.equals(name)&& pas.equals(pass))
                {
                    
                	out.println("successfull");
                }
                else {
                	out.println("not successfull");
                
                }
            }
            rs.close();
            st.close();
            con.close();

			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
}
		/*String name=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String un="admin";
		String pas="mca";
		if(name.equals(un) && pass.equals(pas))
		{
			System.out.println("login successfull");
		}
		else {
			System.out.println("login  not successfull");
			
		}
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
