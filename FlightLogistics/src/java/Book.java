/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PuneetJyot
 */
public class Book extends HttpServlet {

  public void doGet(HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException {
  PrintWriter out=response.getWriter();
  int user_id=0;
  int seats=0;
  String flight_id=request.getParameter("f_id");
 String name=request.getParameter("user");
      try{
        Class.forName("com.mysql.jdbc.Driver");
    Connection conn;
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/login1","root","army#123"); 
    
      PreparedStatement pst1=conn.prepareStatement("Select * from login1.registeruser where Name= ?");   
     pst1.setString(1,name);
      ResultSet rs;
      rs=pst1.executeQuery();
       while(rs.next()){
       user_id= rs.getInt("user_id");
    
      }
            PreparedStatement pst2=conn.prepareStatement("insert into book_flights(user_id,flight_id) values(?,?);");   
           pst2.setInt(1,user_id);
           pst2.setString(2,flight_id);
           int i=pst2.executeUpdate(); 
//out.print(i);
            if(i>0)  {                
                PreparedStatement pst4=conn.prepareStatement("select * from flight_information where flight_id= ? ");   
                pst4.setString(1, flight_id);
                ResultSet rs1;
                rs1=pst4.executeQuery();
                while(rs1.next()){
                    seats=rs1.getInt("seats_avail");
                   
                }
                
                 if(seats<=0){
                        out.print("All Seats are booked" );
                    }
                 else{
                           PreparedStatement pst3=conn.prepareStatement("update flight_information \n" +
"                           set seats_avail=seats_avail-1\n" +
"                           where flight_id=?;");   
                            pst3.setString(1,flight_id);
                            int k=pst3.executeUpdate();
 
               if(k>0) 
            out.print("Booked");  
            }
            }
            else{
                out.print("Sorry");
            }
            }
            
    catch(Exception e){
        System.out.print(e);
  
    }
  }
}