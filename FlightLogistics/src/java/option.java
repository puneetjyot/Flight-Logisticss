

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author PuneetJyot
 */
public class option extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               List dataList= new ArrayList<>();
               String a="";
        PrintWriter out=response.getWriter();
         String name=request.getParameter("name");
    try{    
        Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
    
     PreparedStatement pst=conn.prepareStatement("SELECT distinct flight_id FROM login1.tab where Name= ?");                     
     pst.setString(1,name);
      ResultSet rs;
  //   statement.executeQuery(queryString);
     rs=pst.executeQuery();
     
      
         
        
        while (rs.next())
        {
            
          dataList.add(rs.getString("flight_id")); 
            
         
          
        }
      
                                        rs.close();
                                      
                                        conn.close();
                                        
     
     
     
     
    }
    catch(Exception e){
        out.print(e);
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
      
    }

  
   
}
