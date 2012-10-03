$(function() {
$("#alert").click(function(){
	alert("I'm alive!");
	return false;
	})
})


function doThis() {
	var a = 5, b = 9;
	writeresult = a * b;
	document.getElementById("doing").innerHTML=writeresult;
}