/**
 * 
 */

$(document).ready(function() {
    $('#viewdataTable').dataTable();
} );

function viewData(){
	
	$.ajax({
        type: "GET", 
        url: "http://localhost:9200/logstash-2014.07.10/_search",
        data: { ListID: '1', ItemName: 'test' },
        dataType: "json",
        success: function(response) { 
        	var ValidJSON = JSON.stringify(response);
			var hit=response.hits.hits;
			
			if(hit!=null){
			var header=Object.keys(hit[0]._source);
			var headerText="<thead><tr>";
			for(hkey in header)
				headerText=headerText+"<th style=\"text-align: center;color: white; background:rgba(31, 69, 150, 1);\">"+header[hkey]+"</th>"
			}
			
			$("#viewdataTable").html(headerText+"</thead><tr></tr>");
			var alterColor=true;
			for(var i=0; i<10; i++){
				var keys=hit[i]._source;
				
				if(alterColor){
				var row="<tr style=\"background-color:lavender; color:Black;\">";
				alterColor=false;
				}else{
					var row="<tr style=\"background-color: lavenderblush; color:black;\">";
					alterColor=true;
				}
				
				for(key in keys){
								console.log(keys[key]);
								row=row+"<td>"+keys[key]+"</td>";
				}
						$('#viewdataTable > tbody > tr:last').after(row+"</tr>");
				}
			
			var el = document.getElementById("circularG").style.display='none';
             },
        error: function(xhr, ajaxOptions, thrownError) { alert(xhr.responseText); }
      });
}



function line(){

	var jquery=$("#line").is(':checked') ? 1 : 0;
	if(jquery==1){
		document.getElementById("graphdiv").style.display = 'block';
	}
	else{
		document.getElementById("graphdiv").style.display = 'none';
	}
}

function pie(){
	var jquery=$("#pie").is(':checked') ? 1 : 0;
	if(jquery==1){
		document.getElementById("graphdiv").style.display = 'block';
	}
	else{
		document.getElementById("graphdiv").style.display = 'none';
	}
	
}

function area(){
	var jquery=$("#area").is(':checked') ? 1 : 0;
	if(jquery==1){
		document.getElementById("graphdiv").style.display = 'block';
	}
	else{
		document.getElementById("graphdiv").style.display = 'none';
	}
}
function probabilistic() {

	var jquery=$("#probabilistic").is(':checked') ? 1 : 0;
	if(jquery==1){
		document.getElementById("graphdiv2").style.display = 'block';
	}
	else{
		document.getElementById("graphdiv2").style.display = 'none';
	}
    
}
