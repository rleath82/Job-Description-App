<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="JobDescriptionApp.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Job Descriptions</title>
	<link rel="icon" href="img/favicon.ico?" />
	<link href="CSS/jquery-ui.css" rel="stylesheet" />
	<link href="CSS/styles.css" rel="stylesheet" />
	<script src="JS/jquery-3.0.0.min.js"></script>
	<script src="JS/jquery-ui.js"></script>
</head>

<body>
	<form id="form1" runat="server">
		<h1 id="pageHeader">City of St. Petersburg Job Descriptions</h1>
		<div id="tabs" class="ui-helper-clearfix">
  <ul>
	<li><a href="#tabs-1" id="introTab">Instructions</a></li>
	<li><a href="#tabs-2" id="classifiedTab">Classified Descriptions</a></li>
	<li><a href="#tabs-3" id="managementTab">Management Descriptions</a></li>
  </ul>

  <div id="tabs-1">
		<h2 class="tabsHeader">Instructions</h2>
		<p>Click the tabs above to search Classified Job Descriptions or Management Job Descriptions.</p>
		<div class="row">
			<div class="col-left">
				<strong>Example #1:</strong><br />
				<p class="instructionText">To Search by first letter, type one<br /> character in the search box.</p>
				<img class="instructionImage" src="img/Search_by_First_Letter.PNG" alt="image of letter a typed in search box"/>
			</div>
			<div class="col-right">
				<strong>Example #2</strong><br />
				<p class="instructionText">To Search by phrase, type your search<br /> term in the search box.<br /></p>
				<img class="instructionImage" src="img/Search_By_Word.PNG" alt="image of one word typed in search box"/>
			</div>
		</div>
  </div>

  <div id="tabs-2">
	  <h2 class="tabsHeader">Classified Job Descriptions Search</h2>
	  <input type="text" id="classifiedInput" placeholder="Search..." autofocus="autofocus" />
	  <ul class="classified" id="ClassifiedDescriptions" runat="server"></ul>
  </div>

  <div id="tabs-3">
	  <h2 class="tabsHeader">Management Job Descriptions Search</h2>
	  <input type="text" id="managementInput" placeholder="Search..." autofocus="autofocus" />
	  <ul class="management" id="ManagementDescriptions" runat="server"></ul>
  </div>
  
</div>
		
	</form>   
	<script>
	  $( function() {
		  $("#tabs").tabs().scrollTop(0);
		});
		
		$(document).ready(function () {
			$("#classifiedTab").on("click", function () {
				$("#classifiedInput").focus()
			});
			$("#classifiedInput").on("keyup", function () {
				var value = $(this).val().toUpperCase();
				$("#ClassifiedDescriptions li").filter(function () {
					if (value.length == 1) {
						$(this).toggle($(this).text()[0].toUpperCase().indexOf(value) > -1);
					}
					else {
						$(this).toggle($(this).text().toUpperCase().indexOf(value) > -1)
					}
				});
			});

			$("#managementTab").on("click", function () {
				$("#managementInput").focus()
			});
			$("#managementInput").on("keyup", function () {
				var value = $(this).val().toUpperCase();
				$("#ManagementDescriptions li").filter(function () {
					if (value.length == 1) {
						$(this).toggle($(this).text()[0].toUpperCase().indexOf(value) > -1);
					}
					else {
						$(this).toggle($(this).text().toUpperCase().indexOf(value) > -1)
					}
				});
			});
		});
	</script>
</body>
</html>
