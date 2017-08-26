<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Book Flights</title>

  

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
        var i;
        function myFunction(x) {
   window.i=x.rowIndex;
        // alert("Row index is: " + i);
        
}
     $(document).ready(function(){
        
  $("#submit").click(function() {
         var Origin=$('#Origin').val();
          var Destination=$('#Destination').val();
       
$.ajax({
        type: 'get',
        url: 'Bookflight',
        data: $("#searchSubmit").serialize()+"&user="+user,
         
        success: function(responseJson)
        { 
            //   alert("Hi");
                  a=responseJson;
          
     
         var ul = $("#tab").appendTo($("#tablediv")); 
                   var trHTML='';

          // $.each(responseJson,function(index,item) { // Iterate over the JSON array.
        
                                   

           
               i=0;
                        j=responseJson.length;
                        while(i<j)
                        {
                      //  alert(responseJson.length);
                            trHTML += '<tr id="'+responseJson[i]+'" onclick=myFunction(this)><td>' +responseJson[i] +
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i]+
                                 '</td><td>' + responseJson[++i]+
                                '</td><td>' + responseJson[++i] +
                                '</td><td>' + responseJson[++i] +
                                '</td><td><button class="confirm" type="button" id="'+i+'" onclick="getFlightId();">' + responseJson[++i] +
                                '</button></td></tr>';
                         i++;
                        }
            //});
   // })
   
    $('#tab').append(trHTML);
  
    $(".confirm").click(function() {
            var id = $(this).attr('id'); // $(this) refers to button that was clicked
          //   alert(id);
           var result = confirm("Are you sure you want to book this flight "+document.getElementsByTagName("tr")[window.i].id+"?");
         if(result==true){
             
           var flight_id=document.getElementsByTagName("tr")[window.i].id;
           
           // alert(flight_id);
          $.ajax({
            type: 'get',
            url: 'Book',
            data:{"f_id":flight_id,"user":user},

            success: function(data){
                alert(data);
            },
            error:function(){
                alert('error');
            }
             
           
        
            
            
            })  
         }
    })    
        },
        error: function(){alert("All Seats are Booked ....Sorry try another flight!!");}
        
        
});

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
				<li class="active">
					<a id="paral" href="#">Book Flights</a>
				</li>
				<li>
					<a id="paral" href="Bookedflights.jsp">Booked Flights</a>
				</li>
				<li>
					<a id="paral" href="TrackFlight.jsp">Track Flight</a>
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
           <form class="form-inline"  style="background: rgba(0,0,0,0.6); margin-bottom: 40px; " action="Bookflight" id="searchSubmit">
				<div class="form-group" >
					 
					
                                    <input list="Origin" class="form-control" name="Origin" style="margin-left:  450px;margin-bottom: 40px; margin-top:40px; " placeholder="Origin"/>
                                        <datalist id="Origin">
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
                                
                                
                                </div>
				<div class="form-group">
					 
					
                                    <input list="Destination" class="form-control"  name="Destination"  style="margin-left: 0px;" placeholder="Destination"/>
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
                                
                                
                                </div>
				<div class="form-group" >
					 
					
					<input type="date" name="date" class="form-control" id="exampleInputdepart1"  placeholder="Select Departure Date" style="">
				
                                <button type="BUTTON" style="background-color:red; color:white; " name='submit' id="submit" class="btn btn-default">
					Search
				</button>
                            </div>
                        
                            
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
							Airline
						</th>
						<th>
							Depart
						</th>
						<th>
							Arrival
						</th>
						<th>
							Duration
						</th>
                                                 <th>
							Booking Status
						</th>
                                                <th>
							Price(per adult)
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