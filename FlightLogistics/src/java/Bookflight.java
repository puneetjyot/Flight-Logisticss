//travelboutiqueonline.com
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
public class Bookflight extends HttpServlet {




    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       // String name=request.getParameter("userName");
        //String n=(String)session.getAttribute("userName");  
       String flight_id[] = null;
       List dataList= new ArrayList<>();
       PrintWriter out = response.getWriter();
        String origin=request.getParameter("Origin");
   // out.print(origin);
      String destination=request.getParameter("Destination");
      String sdate=request.getParameter("date");
      String name=request.getParameter("user");
              //
     /* try{
          
      HttpSession Session=request.getSession(true);
      String name=Session.getAttribute("username").toString();
      System.out.print(name);
      }
      
      catch(Exception e){
         out.print(e);
      }
      */
     java.sql.Date sqlDate = null;
        try{
     java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
     //out.print(date);
      sqlDate = new java.sql.Date(date.getTime());
     // out.print(sqlDate);
      }
      catch(Exception e){
          out.print("Date error");
      }

       try{
     

 Class.forName("com.mysql.jdbc.Driver");
       
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
         if(conn!=null)
                        {  // out.print("Connected to database");
                        }
     
        
     PreparedStatement pst=conn.prepareStatement("SELECT distinct *,if(Name=?,'Booked','Not Booked') as book_status FROM login1.tab where Origin=? and destination= ? and  date(estimate_dt)=? and estimate_dt > current_timestamp() and seats_avail>'0'");                     
    pst.setString(1,name);
     pst.setString(2,origin);
     pst.setString(3,destination);
    pst.setDate(4,sqlDate);
     
    
     ResultSet rs;
  //   statement.executeQuery(queryString);
     rs=pst.executeQuery();
     int i=0;
      while(rs.next()){
    //   flight_id  = rs.getString("flight_id");
    
           request.setAttribute("flightid", flight_id);
           dataList.add(rs.getString("flight_id"));
            dataList.add(rs.getString("Carrier_Name"));
          dataList.add(rs.getString("estimate_dt"));
           dataList.add(rs.getString("estimate_at"));
          dataList.add(rs.getString("Duration"));
          dataList.add(rs.getString("book_status")); 
          dataList.add(rs.getInt("price")); 
            
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
