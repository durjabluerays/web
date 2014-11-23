<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css" />
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/popup.css" media="screen">
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
	<script src="assets/js/dygraph-combined.js"></script>
	<script src="assets/js/css-pop.js"></script>
	<script src="assets/js/viewdata.js"></script>
<title>Dashboard</title>
</head>
<body>
<div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand">
            BlueRays
          </a>
          	<span style="top:25%; right:5%; position: absolute;  color: white;"> <a href="<c:url  value="j_spring_security_logout" />" > Logout <span></span></a></span>
         <sec:authorize ifAnyGranted="ROLE_ADMIN">
			<span id='1' style="top:25%; right:15%; position: absolute;  color: Green;">Admin Panel</span>
		</sec:authorize>
          <ul class="nav">
          </ul>
        </div>
      </div>
    </div>
<div style="margin-top: 40px;">
		<div data-role="controlgroup" id="menu" data-type="horizontal" data-mini="true" align="left" style="width:50%; float: left;">
			<a href="#" class="ui-btn ui-corner-all ui-icon-star ui-btn-icon-left">Bluerays</a>
			<a href="#" class="ui-btn ui-corner-all ui-icon-eye ui-btn-icon-left">></a>
			<a href="#chartType" data-transition="flip" data-position-to="origin" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="Chart">Chart</a>
		<div data-role="popup" id="chartType" data-theme="a" class="ui-content" data-overlay-theme="b">
				<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow  ui-btn-inline ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
					<div data-role="collapsible-set" id="charts" data-theme="b" data-content-theme="c" data-collapsed-icon="action" data-iconpos="left" data-mini="true">
					<div data-role="collapsible">
						<h4>Line</h4>
							<label for="line" class="ui-hidden-accessible">Show</label>
							<input name="line" id="line" data-role="flipswitch" data-mini="true" type="checkbox" data-theme="b" onchange="line()"/>
					</div>
					
					<div data-role="collapsible">
						<h4>PIE</h4>
						<div class="ui-field-contain">
							<label for="pie" class="ui-hidden-accessible">Show</label>
							<input name="pie" id="pie" data-role="flipswitch" data-mini="true" type="checkbox" data-theme="b"/>
						</div>
					</div>
					
					<div data-role="collapsible">
						<h4>Area</h4>
						<div class="ui-field-contain">
								<label for="area" class="ui-hidden-accessible">show</label>
								<input name="area" id="area" data-role="flipswitch" data-mini="true" type="checkbox" data-theme="b"/>
							</div>
					</div>
					
					<div data-role="collapsible">
						<h4>Probabilistic</h4>
						<div class="ui-field-contain">
							<label for="probabilistic" class="ui-hidden-accessible">Show</label>
							<input name="probabilistic" id="probabilistic" data-role="flipswitch" data-mini="true" type="checkbox" data-theme="b" onchange="probabilistic()"/>
						</div>
					</div>
					
					<div data-role="collapsible">
						<h4>E</h4>
						<p>Collapsible content.</p>
					</div>
					
					<div data-role="collapsible">
						<h4>F</h4>
						<p>Collapsible content.</p>
					</div>
					
					<div data-role="collapsible">
						<h4>G</h4>
						<p>Collapsible content.</p>
					</div>
					
					<div data-role="collapsible">
						<h4>H</h4>
						<p>Collapsible content.</p>
					</div>
			</div>
		</div>

			<a href="#" class="ui-btn ui-corner-all ui-icon-recycle ui-btn-icon-left">Filter</a>
			<a href="#" class="ui-btn ui-corner-all ui-icon-refresh ui-btn-icon-left">Refresh</a>

			<label for="time">Select Time</label>
			<select name="time" id="time" data-mini="true" data-inline="true">
				<option value="Today">Today</option>
				<option value="Week">Week</option>
				<option value="Month">Month</option>
				<option value="Custom" onclick="test()">Custom</option>
			</select>

			<a href="" id="user" class="ui-btn ui-icon-user ui-btn-icon-left ui-mini ui-btn-inline ui-corner-all"><sec:authentication property="name"/></a>
		</div>
		
		<div data-role="controlgroup" id="menu" data-type="horizontal" data-mini="true" align="left" style="width:50%; float: left;" >
	
			<a href="#myChart" data-transition="slideup" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="My Chart">My Chart</a>
			<div data-role="popup" id="myChart" data-theme="a" class="ui-content" data-overlay-theme="b">
				<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>

				<div data-role="collapsible-set" id="chartList" data-collapsed-icon="bullets">
					<div data-role="collapsible">
						<h4>chartList</h4>
						<p>Collapsible content.</p>
					</div>
					<div data-role="collapsible">
						<h4>B</h4>
						<p>Collapsible content.</p>
					</div>
					<div data-role="collapsible">
						<h4>C</h4>
						<p>Collapsible content.</p>
					</div>
				</div>
			</div>
		
			<a href="#tablepopup" onclick="popup('popUpDiv')" data-transition="fade" data-position-to="window" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline" title="View Data"><span onclick="viewData()">View Data</span></a>
			
			<!--Setting div -->
			<a id="settings"  class="ui-btn ui-icon-gear ui-btn-icon-notext ui-btn-inline ui-corner-all ui-btn-a">Setting</a>
			<!-- Simple Blocking popup -->
			<!--POPUP-->    
    		<div id="blanket" style="display:none; width:100%; background-color: white;">
    		
				<div id="popUpDiv" style="display:none; color:white; font-family: sans-serif; overflow: scroll;">
					<img alt="Close" src="assets/img/close.png"  onclick="popup('popUpDiv')" style="z-index:150;position: absolute;width: 16px;height: 16px; fl" />
				<div style="margin-left: 1.5%;">
				<form>
					<input id="ForTable-1">
				</form>
				</div>
				<!-- Data View Table -->
				<table data-role="table" id="viewdataTable" data-filter="true" data-input="#ForTable-1" class="ui-body-a ui-responsive" border="1"><tbody style="width: 50%; background-color: blue;"></tbody></table>
			
						<!-- Waiting Div -->
						<div id="circularG">
						<div id="circularG_1" class="circularG">
						</div>
						<div id="circularG_2" class="circularG">
						</div>
						<div id="circularG_3" class="circularG">
						</div>
						<div id="circularG_4" class="circularG">
						</div>
						<div id="circularG_5" class="circularG">
						</div>
						<div id="circularG_6" class="circularG">
						</div>
						<div id="circularG_7" class="circularG">
						</div>
						<div id="circularG_8" class="circularG">
						</div>
						</div>
						<!-- Waiting Div End -->

				</div>	
			</div>
			<!-- end pupup -->			
		</div>
	</div>
	
	<!-- Setting Div -->
	<div id="blanket" style="display:none; width:100%" >
	<div id="settingDiv" style="display:none; background-color: white;color: #007FFF; font-family: sans-serif; overflow: scroll;">
	<img alt="Close" src="../dist/image/close.png"  onclick="popup('settingDiv')" style="z-index:150;position: absolute;width: 16px;height: 16px;" />
	kishor
	</div>
</div>
		<div align="center">
			<div class="ui-field-contain" class="ui-hide-label" style="width:80%; margin-top: -10px; margin-bottom: -5px;" >
			<table>
				<col width="100%">
  				<col hidden="80px">
				<tr>
					<td ><input name="search" id="search" style="margin-bottom: 0%" 	data-clear-btn="true" data-mini="true" value="*" placeholder="Error" required="true" type="search"/></td>
					<td><a href="" id="searchButton" class="ui-btn ui-icon-search ui-btn-icon-notext ui-mini ui-btn-inline ui-corner-all">Search</a></td>
				</tr>
			</table>
			</div>
		</div>
	<div class="ui-body ui-body-a ui-corner-all">
		<div id=chart class="">  </div>
		<div id="graphdiv" style="width: 100%" onload="lineGraph()"></div>
		<script type="text/javascript">
			g = new Dygraph(
    document.getElementById("graphdiv"),
    // CSV or path to a CSV file.
    "Date,Temperature\n" +
    "2008-05-07,75\n" +
    "2008-05-08,70\n" +
    "2008-05-09,80\n"

  	);
	</script>

<hr>
<div id="graphdiv2" style="width:500px; height:300px;"></div>
	<script type="text/javascript">
  	g2 = new Dygraph(
    document.getElementById("graphdiv2"),
    "temperatures.csv"
  	);
	</script>

<a href="#chertBt" data-transition="flip" data-position-to="origin" data-rel="popup" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ui-btn-inline ui-icon-info ui-btn-icon-notext" title="Popup">Popup</a>

	<div data-role="popup" id="chertBt" data-arrow="true" data-theme="b" class="ui-content">
	
		<div class="ui-field-contain">
			<label for="selectchart" class="ui-hidden-accessible">chartlist</label>
			<select name="selectchart" id="selectchart" data-mini="true">
				<option value="A" selected="selected">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select>
		</div>
	</div>
</div>

	<!-- Dialog Box -->
			<!-- Dialog Box -->
			<div id="0" style="width:100%; height:100%; z-index: 94000; position: absolute;left: 0%;top: 0%; background-color:white; display: none; overflow:hidden;">
				<button id="close" style="width:auto; left: -1%;top: -1%;">Close</button>
			<br>
			
			<div id="viewDataDyn" style="width: 80%; z-index: 95000; position: absolute;left:10%;top:1%; display: none; height: 100%" align="center">
					<iframe id='i0' src="adminPanel.html" style="border:thin;border-color: white; overflow: hidden; width: 100%; height: 100%;"> </iframe>
			</div>
			</div>
			
	<script type="text/javascript">
	

	$('#close').click(function(e) {
	    $('#0').hide();
	    $('#viewDataDyn').hide();
	});

	$('#name').click(function(e) {
	    $('#0').hide();
	    $('#viewDataDyn').hide();
	});



	$("#i0").load(function (){

		});
	
	
	$('#1').click(function(e) {
		$('#viewDataDyn').show( "fold", function() {
	    	$('#0').show( "fold", function() {
		    });
	    });
	   /** $('#0').load('user.html',function(){$('#viewDataDyn').show( "fold", function() {
	    	$('#0').show( "fold", function() {
		    });
	    });});
	    */
	});
	
	function contentContainer(url){
				$('#viewDataDyn').click(function(e) {
				    $('#1').load(url,function(){$('#viewDataDyn').show( "slow", function() {
				    });});
				});
	}
</script>
			<!-- End Dialog -->
			<!-- End Dialog -->
			
			<!-- Admin Div -->
	
</body>
</html>