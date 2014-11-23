<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>

<title>My Search</title>
</head>
<body>

<div align="center">
<div > 
<input id='searchInput' style="width: 75%; border: solid; border-right:none; padding: 1px; border-width:thin;height:30px;" placeholder="abc@gmail.com"> 
<button type="submit"  id='searchBtn' style="border-left:none; border: solid;  border-width:thin; border-left: none;margin-left: -5px; height:36px; background-color:#4683EA; color: white;" placeholder="rule 4">Search</button>
</div>
</div>
<div id='SearchStat' style="margin-left: 15%; color:#4683EA ">
<span id='took'></span>
<span id='total'></span>

</div>
<div id='result' style="width: 95%; font-family: Gibson-Regular; color:#545454; font-size: 13px; padding-left: 5%;">
 </div>
<script type="text/javascript">
$('#searchInput').change(function(e){
	var search=$( "#searchInput" ).val();
	if(search==''){
		search='*';
		}
$.ajax({
    type: "GET", 
    url: "http://localhost:9200/_all/_search?q=_all:"+search,
    data: { ListID: '1', ItemName: 'test' },
    dataType: "json",
    success: function(response) { 
		var hit=response.hits.hits;
		var header=Object.keys(hit[0]._source);
		var size = Object.keys(hit).length;
		$( "#result" ).text('');
		$( "#took" ).text('Search Time: '+response.took+'ms');
		$( "#total" ).text('Total Result: '+response.hits.total);
		for(var i=0; i<size; i++ ){
			var result="<br><div>";
			var keys=hit[i]._source;
				for(key in keys){
					result=result+"<span>"+keys[key]+"</span>";
				}
				$( "#result" ).append(result+"</div><hr>");
   			 }
		
       },
    error: function(xhr, ajaxOptions, thrownError) { alert(xhr.responseText); }
  });
});


$('#searchBtn').click(function(e){
	$( "#result" ).text('');
	var search=$( "#searchInput" ).val();
	if(search==''){
		search='*';
		}
$.ajax({
    type: "GET", 
    url: "http://localhost:9200/_all/_search?q=_all:"+search,
    data: { ListID: '1', ItemName: 'test' },
    dataType: "json",
    success: function(response) { 
		var indexName=response;
		var hit=response.hits.hits;
		var header=Object.keys(hit[0]._source);
		var size = Object.keys(hit).length;
		$( "#result" ).text('');
		$( "#took" ).text('Search Time: '+response.took+'ms');
		$( "#total" ).text('Total Result: '+response.hits.total);
		for(var i=0; i<size; i++ ){
			var result="<br><div>";
			var keys=hit[i]._source;
				for(key in keys){
					result=result+"<span>"+keys[key]+"</span>";
				}
				$( "#result" ).append(result+"</div><hr>");
   			 }
		
       },
    error: function(xhr, ajaxOptions, thrownError) { alert(xhr.responseText); }
  });
});

</script>

</body>
</html>