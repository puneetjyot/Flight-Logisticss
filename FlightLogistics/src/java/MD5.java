import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
 
public class MD5 {
    public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
 
    public static void main(String[] args) throws NoSuchAlgorithmException {
        //System.out.println(getMD5("Javarmi.com"));
    }
}
/*

import java.io.IOException;
import org.eclipse.jdt.internal.compiler.batch.Main;

import java.sql.*;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Validate extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
try{
        String username = request.getParameter("username");  
        String password = request.getParameter("password");
        // JOptionPane.showInputDialog(password);
        Class.forName("com.mysql.jdbc.Driver"); 
       //returns object of class given in parameters
        // MySQL database connection
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123");     
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM registeruser WHERE name = ? AND password = ? ");
         if(conn!=null)
                        {
                               System.out.print("Connected to database");
                        }
        pst.setString(1, username);
        pst.setString(2,password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           System.out.println("Valid login credentials");        
        
        else
           System.out.println("Invalid login credentials");            
   }
   catch(Exception e){       
      System.out.println(e);       
   } 
}
}

*/