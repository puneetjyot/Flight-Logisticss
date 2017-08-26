<%@page import="java.security.MessageDigest"%>
<%// Message digests are secure one-way hash functions that take arbitrary-sized data and output a fixed-length hash value.%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page import ="java.sql.*" %>
<%
   
    
    
    
    
    
    
    try{
        String username = request.getParameter("username");  
        String password = request.getParameter("password");
       // String ps=MD5.getMD5("hello");
        // JOptionPane.showInputDialog(password);
      
        
        
        
        
        
        
        String plainText = password;
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
/*

*/
mdAlgorithm.update(plainText.getBytes());

/*
MessageDigest Update
update method is used to update string data in bytes one by one and we can use reset to reset the digest.
After the update is complete one of the method in digest is called to complete the hash.

getBytes encoding is of 2 types 
default and when charsetName is defined like-
utf-16
utf-16BE
ASCII
utf-8

It converts string in byte format according to the specified type
*/
byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    plainText = Integer.toHexString(0xFF & digest[i]);
/*returns the string representation of the unsigned integer value
  represented by the argument in hexadecimal (base 16) 
*/
    if (plainText.length() < 2) {
        plainText = "0" + plainText;
    }
// text is in hexadecimal so we are comaring length with 2 otherwise we would compare it with 32' and whenever we find a text smaller than 2 we will add 0
    hexString.append(plainText);
}

//out.print(hexString.toString());
    










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
        pst.setString(2,hexString.toString());
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Valid login credentials");        
        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>