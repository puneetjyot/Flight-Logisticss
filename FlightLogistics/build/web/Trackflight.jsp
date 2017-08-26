<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Booked Flights</title>

  

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
     <style type="text/css">
         .active{
             background-color: red;
         }
    #paral 
  { 
  display: inline-block;      
  background-color:rgba(0,0,0,0.2);
  height:60px;
  width:386.6px;

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
        var flight_id= $('#flightId').val();
         
  $("#search").click(function() {
  // alert(flight_id)
   $.ajax({
        
         type: 'get',
        url: 'Trackflight',
     data: $("#searchSubmit").serialize(),
      
      success: function(responseJson)
        { 
      
         var ul = $("#tab").appendTo($("#tablediv")); 
                   var trHTML='';

          // $.each(responseJson,function(index,item) { // Iterate over the JSON array.
        
                                   

           
               i=0;
                        j=responseJson.length;
                        while(i<j)
                        {
                     //  alert(responseJson);
                            trHTML += '<tr id="'+responseJson[i]+'" onclick=myFunction(this)><td>' +responseJson[i] +
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i]+
                                 '</td><td>' + responseJson[++i]+
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i] +
                                '</td></tr>';
                         i++;
                        }
            //});
   // })
   
    $('#tab').append(trHTML);
  
        },
         error: function(){alert("failed");}
    
           
        
        });     
        
  });
  
  
   $.ajax({
        
         type: 'get',
        url: 'option',
     data:{"name":user},
    
      success: function(res){
       
        var dataList =  $("#flightId").appendTo($("#formdiv"));
             
			dataList.empty();
		
        if(res.length) {
	  
            for(var i=0, len=res.length; i<len; i++) {
        	                          
		var opt = $("<option></option>").attr("value", res[i]);
              
                $('#flightId').append(opt);
				}
			}
      },
     
        
  });
      
       })
    
      </script>
          
   
  </head>
  <body>
   <style>
            body{
            Background-image: url(taj.jpg);
                background-color: #FAE5D3;
               	 background-repeat: no-repeat;
   				
            }
            </style>
           
           
  	<div class="container-fluid">
            
	<div class="row" style="height: 600px;">
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
 <div class="row">
		<div class="col-md-12">
			<ul class="nav nav-pills">
				<li>
					<a id="paral" href="Welcome.jsp">Home</a>
				</li>
				<li>
					<a id="paral" href="Bookflight.jsp">Book Flights</a>
				</li>
				<li>
					<a id="paral" href="Bookedflights.jsp">Booked Flights</a>
				</li>
				<li class="active">
					<a id="paral" href="#">Track Flight</a>
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
	</div>
	</div>
   
	
   <div class="row">
       <div class="col-md-12" style="position:absolute; left:0px; top:300px;" >
           
           <form id="searchSubmit"  style="background: rgba(0,0,0,0.2); margin-bottom: 40px; margin-top: 40px;">
              <div class="form-group" id="formdiv">
               <input list="flightId" class="form-control" name="flightId" placeholder="Search for FlightId" style="width:20%; margin-left: 650px; margin-top:40px; " >
               <datalist id="flightId">
                                     <!--    <option value="UA-301">
                                            <option value="9W-415">
                                            <option value="9W-416">
                                            <option value="9W-417">    
                                            <option value="AI-36"> 
                                            <option value="G8-171"> 
                                            <option value="UA-301">
                                            <option value="UK-813">
                                            <option value="UK-836">
                                              <option value="UK-731">
                                  -->
                                     </datalist>
               </div>
               <button type="button" id="search" class="btn btn-default" style="margin-left:790px; margin-top: 20px; margin-bottom: 40px; color:white; background-color: red">Search</button>
          
           </form>
           </div>
       <div ID="tablediv" style="margin-top:0px;">
                    <table class="table" id="tab">
				<thead>
					<tr>
                                                <th>
							Flight id
						</th>
						
						<th>
							Origin
						</th>
						<th>
							Destination
						</th>
						<th>
							Departure Time
						</th>
                                                <th>
							Departure Status
						</th>
                                                <th>
							Arrival Status
						</th>

					</tr>
				</thead>
				<tbody>
                               
                                   
				</tbody>
			</table>
		</div>
	
</div>
        </div>
 <!--   <script src="js/jquery.min.js"></script> -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>