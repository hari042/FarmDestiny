

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Logout() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String url="jdbc:mysql://localhost:3306/fd";
		String user="root";
		String password="passmysql";
		String query2="select * from fsession";
		HttpSession session=request.getSession();  
		String name= (String) session.getAttribute("name");
		String query3="UPDATE fsession SET status = "+"offline"+ "WHERE fid="+name;
		PrintWriter out=response.getWriter(); 
		
        session.invalidate(); 
        
        
        
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
