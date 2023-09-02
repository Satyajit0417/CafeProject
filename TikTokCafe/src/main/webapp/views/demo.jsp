<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="name">
<label id="setname">name</label>
<input type="text" id="set">

<input type="submit" value="save" onclick="demo()">

<script type="text/javascript">
	
	function demo(){
		var name=document.getElementById("name").value;
		document.getElementById("setname").innerHTML =  name;
		document.getElementById("set").value =name;
		
	}
	
</script>
</body>
</html>