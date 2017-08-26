
import com.google.gson.Gson;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URL;
import org.eclipse.jdt.internal.compiler.batch.Main;

import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import static javax.servlet.SessionTrackingMode.URL;
import javax.servlet.http.*;  
import javax.swing.JOptionPane;
  
public class Validate1 extends HttpServlet {  
    public HttpSession session;
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
    response.setContentType("text/html");  
   session = request.getSession(true);
/*
Content types are included in HTTP responses because the same, byte for byte sequence of values in the content could be interpreted in more than one way
*/
PrintWriter out = response.getWriter();
try{
        String username = request.getParameter("name");  
        String password = MD5.getMD5(request.getParameter("pwd"));
        // JOptionPane.showInputDialog(password);
        Class.forName("com.mysql.jdbc.Driver"); 
       //returns object of class given in parameters
        // MySQL database connection
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM registeruser WHERE name = ? AND password = ? ");
        
        pst.setString(1, username);
        pst.setString(2,password);

        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
            // int i=pst.executeUpdate();
            //JOptionPane.showInputDialog("hii");
            

           
             // response.setContentType("application/json");
             //response.setCharacterEncoding("UTF-8");
          out.print("true");  
           
         //RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("/Welcome.jsp");
         //RequetsDispatcherObj.forward(request, response);  
          session.setAttribute("username", username);

                  // response.sendRedirect("Welcome.jsp?name="+username);
                
                  // out.print(username); 

        }
        else{
             
          // out.println("false");            
            // RequestDispatcher rd=request.getRequestDispatcher("/index.html");  
              //rd.include(request, response); 
            }
}

   catch(Exception e){       
      System.out.println(e);       
   } 
}
public void doGet(HttpServletRequest Request,HttpServletResponse Response)throws ServletException, IOException{
     String username = Request.getParameter("name"); 
     session.setAttribute("username","username");
}
}
