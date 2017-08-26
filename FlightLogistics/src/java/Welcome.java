import com.google.gson.Gson;
import java.sql.*;
import java.io.*;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Welcome extends HttpServlet {  

  //Setting JSP page

  String page="Welcome.jsp";
List dataList= new ArrayList<>();


     

 
public void dopost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
    
/*
Content types are included in HTTP responses because the same, byte for byte sequence of values in the content could be interpreted in more than one way
*/
PrintWriter out = response.getWriter();

try{
     
 Class.forName("com.mysql.jdbc.Driver"); 
       //returns object of class given in parameters
        // MySQL database connection
  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
        //PreparedStatement pst = conn.prepareStatement("SELECT * FROM registeruser WHERE username = ? AND password = ?");
         if(conn!=null)
                        {    out.print("Connected to database");}
     String queryString="select * from login1.tab";                     
     Statement statement=conn.createStatement();
         
     
     ResultSet rs;
     statement.executeQuery(queryString);
     rs=statement.getResultSet();
     
      
         
        
        while (rs.next()) {
            
          out.print(dataList.add(rs.getString(1))); 
            dataList.add(rs.getString("Carrier_Name"));
          dataList.add(rs.getDate("arrival_time"));
           dataList.add(rs.getDate("departure_time"));
           //e=rs.getDate(5);
           ///f=rs.getDate(6);
           dataList.add(rs.getString("Origin"));
          dataList.add(rs.getString("destination"));
          out.print(dataList);
         // System.out.print(a+b+c+d+e+f);
          
        }
      
                                        rs.close();
                                       statement.close();
                                        conn.close();
                                        
        
}
catch (Exception ex) {
    out.println("Unable to connect to database.");
            }

       
     String json = new Gson().toJson(dataList);
     out.print(json);
     out.flush();
  response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    //response.getWriter().write(json);
//request.setAttribute("data",dataList);

  //Disptching request

 // RequestDispatcher dispatcher = request.getRequestDispatcher(page);

 // if (dispatcher != null){

 // dispatcher.forward(request, response);

 // } 

}
public void doget(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
     System.out.println("in doget");
     //doPost(request, response); 
 }   
      
}
