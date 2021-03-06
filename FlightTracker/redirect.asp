<!DOCTYPE html>
<!-- Use this file to allow users to create a pop-up window version of the flight tracker to move around their screen -->

<html>
<head>
<script>
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',resizable=no,scrollbars=no,toolbar=no,menubar=no,location=no,directories=no, status=no'
wnd = 'http://www.blade-edge.com/images/KSA/Flights/craft.asp?popout=true&r=true&db=' + 
window.open(url,'Flight Status',settings)
window.close()
}
</script>
</head>
<%
'make sure we properly peice together the URL to open in the pop-up window
queryString = request.querystring("db")
if request.querystring("ut") then	queryString = queryString & "&ut=" & request.querystring("ut")
if request.querystring("pass") then	queryString = queryString & "&pass=" & request.querystring("pass")

if request.querystring("popout") then
	response.write("<body onload=""centeredPopup(")
	response.write("'http://www.blade-edge.com/images/KSA/Flights/craft.asp?popout=true&r=true&db=" & querystring & "','myWindow','1145','870','no')")
	response.write(""">")
else
	response.redirect "http://www.blade-edge.com/images/KSA/Flights/craft.asp?popout=false&r=true&db=" & querystring
end if 
%>

<!-- mobile users can't see a pop-up window so inform them they can view the page normally -->
<center>
<table width="250px">
<tr>
	<td>
		<center><h2>Mobile User?</h2></center>
		<p>If the flight tracker did not load, then you are likely on a mobile device that could not load the pop-up window. If this is the case, you can still access the flight tracker as a regular page.</p>
		<p><center><%response.write("<a href='http://www.blade-edge.com/images/KSA/Flights/craft.asp?popout=true&r=true&db=" & request.querystring("db") & "'>")%><b>Click/Tap Here</b></a></center></p>
		<p>Please note that touchscreen users will not have full capability of the tracker, which uses pop-up text info boxes when a mouse cursor is hovered over some elements. However, you can still tap to display craft information, and tap/hold to bring up image text with additional information.</p>
		</td>
	</tr>
</table>
</center>

</body>
</html>