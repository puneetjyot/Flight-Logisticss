import java.io.*;  
import javax.servlet.*;  
import javax.servlet.http.*;  
  
public class Welcome_Servlet extends HttpServlet {  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String n=request.getParameter("username");  
    out.print("Welcome "+n);  
    }  
  
}  