<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
<title>Admin</title>
</head>
<body style="background-color: white; font-family: sans-serif; width: 100%; height: 100%">
<div style="width: 100%; color: white; background-color: #4683EA; height:50px; margin-top: 1%;">
		<h4 style="margin-top:1%; padding: 1.5%;">
				 <span id='addUserBtn' style="border: solid;border-width: 1px; padding: 0.5%; border-color: rgba(12, 86, 210, 1); background-color: rgba(12, 86, 210, 1);">Add User</span>
				 <span style="border: solid;border-width: 1px; padding: 0.5%; border-color: rgba(12, 86, 210, 1); background-color: rgba(12, 86, 210, 1);" >Users</span> 
				 <span style="border: solid;border-width: 1px; padding: 0.5%; border-color: rgba(12, 86, 210, 1); background-color: rgba(12, 86, 210, 1);">Delete User</span> 
				 <span style="border: solid;border-width: 1px; padding: 0.5%; border-color: rgba(12, 86, 210, 1); background-color: rgba(12, 86, 210, 1);">Manage User</span>
				 <span id="mySearch" style="border: solid;border-width: 1px; padding: 0.5%; border-color: rgba(12, 86, 210, 1); background-color: rgba(12, 86, 210, 1);">My Search</span>
		</h4>
 </div>	
 <div id="mySearch1" style="width:99%; border: none;border-width:1px; height:1000px; padding: 1%; display: none;" align="center">
 <iframe id="iframeSearch" src="mySearch.html" style="border:thin;border-color: white; overflow:hidden; width: 100%; height: 100%;"> 
  </iframe>
 </div>
<div id='addUserDiv' style="width:auto; border: solid;border-width: 1px; padding: 1%; margin-right: 1%;" align="center">
	<form name="addUser" id="addUser" oninvalid="">
	<table>
	<tr><td><label for="name">Name</label></td><td> <input name="name" id="name" data-clear-btn="false" data-mini="true" value="" placeholder="kishor" maxlength="100" required="true" type="text"/></td></tr>
	<tr><td> <label for="email">Email</label></td><td><input name="email" id="email" data-clear-btn="false" data-mini="true" value="" placeholder="kishor@gmail.com" maxlength="100" required="true" type="email"/></td></tr>
	<tr><td><label for="orgName">Organization Name</label></td><td><input name="orgName" id="orgName" data-clear-btn="false" data-mini="true" value="" placeholder="abc Pvt. Ltd." maxlength="500" required="true" type="text"/></td></tr>
	<tr><td><label for="rule1">Rule 1</label></td><td><input name="rule1" id="rule1" data-clear-btn="false" data-mini="true" value="" placeholder="rule 1" maxlength="100" required="true" type="text"/></td></tr>
	<tr><td><label for="rule2">Rule 1</label></td><td><input name="rule1" id="rule2" data-clear-btn="false" data-mini="true" value="" placeholder="rule 2" maxlength="100" required="true" type="text"/></td></tr>
	<tr><td><label for="rule3">Rule 1</label></td><td><input name="rule1" id="rule3" data-clear-btn="false" data-mini="true" value="" placeholder="rule 3" maxlength="100" required="true" type="text"/></td></tr>
	<tr><td><label for="rule4">Rule 1</label></td><td><input name="rule1" id="rule3" data-clear-btn="false" data-mini="true" value="" placeholder="rule 4" maxlength="100" required="true" type="text"/></td></tr>
	<tr><td></td><td><input data-enhanced="true" type="submit" value="Save" id="save"/><input data-enhanced="true" type="reset" value="Reset" id="reset"/></td></tr>
	</table>
	</form>
<p style="font-family: sans-serif; font-size: small;"><tt id="results"></tt></p>
<div id='confirm' style="z-index: 500000; width: 50%; position: absolute; top:5%;left: 25%;" align="center"></div>
<script>

$('#save').click(function (e){
	var formData = $( "form" ).serializeArray();
	var size = Object.keys(formData).length;
	var valid=true;
	var dataView="";
	for(var i=0; i<size; i++){
		
		if(formData[i].value==''){
			valid=false;
			break;
			}
		dataView=dataView+"<div>";
		var alter=false;
		for(key in formData[i]){
			if(alter){
			dataView=dataView+"<span>"+formData[i][key]+"</span>";
			alter=false;
			}else{
				dataView=dataView+"<span>"+formData[i][key]+"</span>";
				alter=true;
				}
			}
		dataView=dataView+"</div>";
		}
	if(valid){
	$('#confirm').append(dataView);
	 window.onbeforeunload = function() {
        return dataView;
    }
		}
});

$('#addUserBtn').click(function (e){
	$('#mySearch1').hide();
	$('#addUserDiv').show('slow', function (){
	});
});

function showValues() {
var str = $( "form" ).serializeArray();
	var data=JSON.stringify(str);
$( "#results" ).text( data );
}
$( "select" ).on( "change", showValues );

showValues();
$("body").css("background-color","white");
$("body").css("font-family","sans-serif");
$("body").css("font-size","small");
$("body").css("color","green");
$("#save").css("color","black");
$("#reset").css("color","black");
$('#name').click(function (e){
		 $("body").css("background-color","white");
		});

$('#mySearch').click(function (){
	$('#addUserDiv').hide();
	$('#mySearch1').show('slow', function (){
		});
});

	</script>
	
</div>
</body>
</html>