
<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<%@page import= "javax.*" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Flight Logistics</title>

    <meta name="description" content="Contains user Flight Information">
    <meta name="author" content="PuneetJyot">
<!--link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
 <!--   <link href="C:/Users/G J Singh/Documents/NetBeansProjects/hhh/web/css/style.css" rel="stylesheet"> -->
    <style type="text/css">
        .active{
             background-color: red;
         }
    #paral 
  { 
  display: inline-block;      
  background-color:#899898;
  height:60px;
  width:386.4px;
  color:#000;
  font-family:Arial;
  font-size:25px;
  
  }

    </style>
        <script type="text/javascript" src="js/jquery.min.js"></script>
           <%String user=(String)session.getAttribute("username"); 
          
           %>
           
    <script>
       var user = "<%=user%>";
        $(document).ready(function(){
 // $("#somebutton").click(function() {
  
        
  
$.ajax({
        type: 'get',
        url: 'WelcomeNew',
        cache:false,
       data: {"user":user},
      
        success: function(responseJson){
         
            
          
                  a=responseJson;
          
       // alert(responseJson.length);
         var ul = $("#tab").appendTo($("#tablediv")); 
                   var trHTML='';

        //   $.each(responseJson,function(index,item) { // Iterate over the JSON array.
        
                                   

           
       /* for(i=0;i<1;i++){
        $("<td>").text(item).appendTo(ul);      // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
         // alert("length");
        
           }
        */             i=0;
                        j=responseJson.length;
                       // alert(j);
                        while(i<j)
                        {
                       
                            trHTML += '<tr><td>' +responseJson[i] +
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i]+
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i]+
                                '</td><td>' + responseJson[++i]+
                                 '</td></tr>';
                         i++;
                        }
            //});
   // });
    $('#tab').append(trHTML);
        },
        error: function(){alert("failed");}
        
});
//});
        
    
})
</script>
    <script type="text/javascript">
        
    
  
    
    </script>
  </head>
  <body style="background-color: #FAE5D3;">
    
    <div class="container-fluid">
	<div class="row">
	<div class="d-header clearfix">
		<div class="col-md-3">
                 

			 <span class="label label-primary" style="font-size: 30px; line-height: 130px;">WELCOME <%=session.getAttribute("username")%>
</span>
                                                  
		</div>
		<div class="col-md-6">
			<div class="page-header">
				<h1 style="color:#7c795d; font-family: 'Trocchi', serif; font-size: 45px; font-weight: normal; line-height: 48px; margin: 0;">
					Flight Logistics! <small style="font-size: 26px; font-weight: 300; color: #000000; margin: 0 0 24px;;">Complete Flight Information</small>
				</h1>
			</div>
		</div>
		<div class="col-md-3">
		
			
		
		 
			
   <i>
      <font color="darkslategray" size="5">
       
        <strong>
         <span id="time_span" style="line-height:130px; margin:200px;" ></span>
        </strong>              
      </font>
   </i>

<script>
//var today = Math.round(Date.now()/1000);
//document.getElementById('time').innerHTML=today;
function updateTime(){
    var currentTime = new Date()
    var hours = currentTime.getHours()
    var minutes = currentTime.getMinutes()
    var seconds = currentTime.getSeconds();
    if(seconds<10){
    	seconds = "0" + seconds;
    }
    if (minutes < 10){
        minutes = "0" + minutes;
    }
    var t_str = hours + ":" + minutes + ":" + seconds;
    if(hours > 11){
        t_str += "PM";
    } else {
        t_str += "AM";
    }
    document.getElementById('time_span').innerHTML = t_str;
}
setInterval(updateTime, 1000);
</script>


		</div>
	</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-pills">
				<li class="active">
					<a id="paral" href="#">Home</a>
				</li>
				<li>
					<a id="paral" href="Bookflight.jsp">Book Flights</a>
				</li>
				<li>
					<a id="paral" href="Bookedflights.jsp">Booked Flights</a>
				</li>
				<li>
					<a id="paral" href="Trackflight.jsp">Track Flight</a>
				</li>
				
			</ul>
		 <script>
                   $(function() {
                        $('ul li').click( function() {
                          $(this).addClass('active').siblings().removeClass('active');
                        });
                        });     
                    </script>
                
                </div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="carousel slide" id="carousel-246287">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-246287">
					</li>
					<li data-slide-to="1" data-target="#carousel-246287">
					</li>
					<li data-slide-to="2" data-target="#carousel-246287">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="Carousel Bootstrap First" src= "freeimg3.jpeg">
						<div class="carousel-caption">
							<h4>
							Flights Information
							</h4>
							<p>
								
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Second" src="freeimg2.jpeg">
						<div class="carousel-caption">
							
						</div>
					</div>
					<div class="item">
						<img alt="Carousel Bootstrap Third" src="freeimg1.jpeg">
						<div class="carousel-caption">
							
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-246287" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-246287" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
                  <!--  <div>
                                 <button id="somebutton" style="color: #ac2925">Flight Information</button>
                        
                    </div>
                  -->
                  
                    
                    <div id="tablediv">
                    
                    <table class="table" id="tab">
				<thead>
					<tr>
						<th>
							FlightNumber
						</th>
						<th>
							CarrierName
						</th>
						<th>
							ArrivalTime
						</th>
						<th>
							DepartureTime
						</th>
						<th>
							Origin
						</th>
                                                <th>
							Destination
						</th>
					</tr>
				</thead>
				<tbody>
                                		
                                
                                
                                </tbody>
			</table>
		</div>
                                    </div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>