


import java.io.*;  
import static java.lang.Math.random;
import java.sql.*;  
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Register extends HttpServlet { 
    static int a=10,k=7;
    @Override  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
 PrintWriter out = response.getWriter();
      //  out.print("Hey guys");
response.setContentType("text/html");  
/*
Content types are included in HTTP responses because the same, byte for byte sequence of values in the content could be interpreted in more than one way
*/
  
          
String n=request.getParameter("username");  
String p=MD5.getMD5(request.getParameter("userPass"));  
String e=request.getParameter("userEmail");  
String c=request.getParameter("userCountry");  
  int f= (int) (Math.random() * 5000);    
  
try{  
 //  out.print(e);
    Class.forName("com.mysql.jdbc.Driver"); 
       //returns object of class given in parameters
        // MySQL database connection
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
        //PreparedStatement pst = conn .prepareStatement("SELECT * FROM registeruser WHERE username = ? AND password = ?");
         if(conn!=null)
                        {
                         //     out.print("Connected to database");
                        }
       PreparedStatement ps=conn.prepareStatement("insert into registeruser(user_id,Name,Password,Email,Country) values(?,?,?,?,?)");  

ps.setInt(1,f);   
ps.setString(2,n);  
ps.setString(3,p);  
ps.setString(4,e);  
ps.setString(5,c);

//out.print(ps);
          
int i=ps.executeUpdate(); 
//out.print(i);
if(i>0)  {
out.print("You are successfully registered..."); 
/*
String redirect="index.html";
response.sendRedirect(redirect);
response.sendRedirect("index.html");
*/
out.println("alert(\"Registered\");");
RequestDispatcher requestDispatcher; 

requestDispatcher = request.getRequestDispatcher("index.html");
requestDispatcher.forward(request, response);

}

else{
    out.print("Not registered");
}
          
}
  
catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
 
}

}
