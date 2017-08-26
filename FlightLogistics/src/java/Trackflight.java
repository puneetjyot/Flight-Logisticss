
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
public class Trackflight extends HttpServlet {




    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String flight_id=request.getParameter("flightId");

        List dataList= new ArrayList<>();
       PrintWriter out = response.getWriter();
        
       try{
     

 Class.forName("com.mysql.jdbc.Driver");
       
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
         if(conn!=null)
                        {  // out.print("Connected to database");
                        }
     
        
     PreparedStatement pst=conn.prepareStatement("SELECT * FROM login1.tab where flight_id=? ");                     
    pst.setString(1,flight_id);
     //pst.setString(2,destination);
   //  pst.setDate(3,sqlDate);
     
    
     ResultSet rs;
     rs=pst.executeQuery();
     int i=0;
      while(rs.next()){
    //   flight_id  = rs.getString("flight_id");
    
         
           dataList.add(rs.getString("flight_id"));
           dataList.add(rs.getString("Origin"));
           dataList.add(rs.getString("destination")); 
           dataList.add(rs.getString("estimate_dt"));
           dataList.add(rs.getString("departure_status"));
           dataList.add(rs.getString("arrival_status"));
          i++;
      }
         
 
     
                                        rs.close();
                                      
                                        conn.close();
                                        
        
}
catch (Exception ex)
            {
               out.println("Unable to connect to database.");
            }

      
       response.setContentType("application/json");
   response.setCharacterEncoding("UTF-8");
 Gson gson=new Gson();
    
           out.print(gson.toJson(dataList));
 //write(response,a);
// out.println(a);
     out.flush();
     

    out.close();
  

        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
       
              
    }

  
   
}
