

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;


@WebServlet("/Flogin")
public class Flogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Flogin() {
        super();
    
    }
	
	String url="jdbc:mysql://localhost:3306/fd";
	String user="root";
	String password="passmysql";
	String query ="select * from farmer";
	String query2="select * from fsession";
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String uname="hari";
		String pas="hari123";
		PrintWriter out=response.getWriter();
		Flogin fl=new Flogin();
		boolean b = false;
		try {
			b = fl.Session(uname, request, response);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(b==true)
		{
		try {
		
			int flag=0;

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection(url,user,password);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while (rs.next()) 
            {
                String name=rs.getString("uname");
                String pass=rs.getString("password");
                if(uname.equals(name)&& pas.equals(pass))
                {
                	HttpSession session=request.getSession();  
  			        session.setAttribute("name",name); 
  			        out.println(name);
  			        String query3="UPDATE fsession SET status = active WHERE fid="+name;
  			      	int rs1=st.executeUpdate(query3);
                	flag=1;
                	break;
                	
                	
                }
                
            }
			if(flag==1)
			{
				out.println("success");
				
			}
			else
			{
				out.println("invalid");
			}
            rs.close();
            st.close();
            con.close();

			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
	public boolean Session(String name,HttpServletRequest req,HttpServletResponse res) throws Exception
    {
		Class.forName("com.mysql.cj.jdbc.Driver");
	
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fd","root","passmysql");
        String query="Insert into fsession values(?,?)";
        PrintWriter out=res.getWriter();
        PreparedStatement ps=con.prepareStatement(query);
        ps.setString(1,name);
        ps.setString(2,"ACTIVE");
        int row=ps.executeUpdate();
        if(row==1)
        {
            return true;
        }
        ps.close();
        con.close();

        return false;

    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
