<%-- 
    Document   : newjsp
    Created on : Jul 11, 2017, 10:36:34 AM
    Author     : PuneetJyot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <form action="NewServlet">  
        <input list="Destination"  name="Destination"  style="margin-right: 250px;" >
                       
         <datalist id="Destination">
                                         <option value="Delhi">
                                            <option value="Mumbai">
                                            <option value="Chennai">
                                            <option value="Jaipur">    
                                            <option value="Banglore"> 
                                            <option value="Hyderabad"> 
                                            <option value="Kolkata">
                                            <option value="Goa">
                                            <option value="Amritsar">
                                            <option value="Pune">  
                                    </datalist>
             <div class="input-container">  

        
       
      </div>
        <button id="submit">
        </button>
         </form>
</body>
</html>
