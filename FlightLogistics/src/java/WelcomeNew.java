
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
/**
 *
 * @author PuneetJyot
 */
public class WelcomeNew extends HttpServlet {

String a="";



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       // String name=request.getParameter("userName");
        //String n=(String)session.getAttribute("userName");  
       List dataList= new ArrayList<>();
       PrintWriter out = response.getWriter();
       String name=request.getParameter("user");
  
try{
      
 Class.forName("com.mysql.jdbc.Driver");
       
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
         if(conn!=null)
                        {  // out.print("Connected to database");
                        }
     
   
     PreparedStatement pst=conn.prepareStatement("select * from tab where name=? and estimate_dt between current_date() and date_add(current_date(), interval 10 day)");                     
         
     
     
     pst.setString(1,name);
     ResultSet rs;
  //   statement.executeQuery(queryString);
     rs=pst.executeQuery();
     
      
         
        
        while (rs.next())
        {
            
          dataList.add(rs.getString("flight_id")); 
            dataList.add(rs.getString("Carrier_Name"));
          dataList.add(rs.getString("estimate_at"));
           dataList.add(rs.getString("estimate_dt"));
           
           dataList.add(rs.getString("Origin"));
          dataList.add(rs.getString("destination"));
         
          
        }
      
                                        rs.close();
                                      
                                        conn.close();
                                        
        
}
catch (Exception ex)
            {
             //  out.println("Unable to connect to database.");
            }

      
       response.setContentType("application/json");
   response.setCharacterEncoding("UTF-8");

    a = new Gson().toJson(dataList);
 //write(response,a);
 out.println(a);
     out.flush();
     

    out.close();

        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
         HttpSession session = request.getSession(false);
        out.print(session.getAttribute("username"));
              
    }

    private void write(HttpServletResponse response, String a) throws IOException {
    response.setContentType("application/json");
   response.setCharacterEncoding("UTF-8");
    //response.getWriter().write(a);
    PrintWriter out=response.getWriter();
            out.print(a);
            out.flush();
           
    }
   
}
