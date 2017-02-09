<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - A Utility Site for Everyone !!</title>
<base href="<%=(String)session.getAttribute("WU_BASEURL")%>" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
<link rel="stylesheet" type="text/css" href="resources/theme/genericstyle.css" />
<script type="text/javascript" src="resources/scripts/generic.js"></script>
</head>
<body>
<jsp:include page="utilfiles/mWebHeader.jsp"/>
<div id="utilTitle" align="center">Please Select The Utility Below</div>
<br/>
<div style="width:618px;height:350px;overflow:auto;border:1px solid rgb(242,121,11);margin:0px auto;">
<table align="center" id="optionsTable" style="width:600px;" cellspacing="4">
<tr><td valign="center" onclick="activateOption('o1');">Remove Line Breaks from Source Text</td></tr>
<tr><td valign="center" onclick="activateOption('o2');">Escape Special Characters i.e.  \ , " , ' in a String</td></tr>
<tr><td valign="center" onclick="activateOption('o3');">Encode / Decode Text in Base64 Format</td></tr>
<tr><td valign="center" onclick="activateOption('o4');">Remove Commented Lines from Code</td></tr>
<tr><td valign="center" onclick="activateOption('o5');">Generate Random String of Different Lengths</td></tr>
<tr><td valign="center" onclick="activateOption('o6');">Retrieve Client & User Agent Information</td></tr>
<tr><td valign="center" onclick="activateOption('o7');">List of Supported CSS Styles for your Browser</td></tr>
<tr><td valign="center" onclick="activateOption('o8');">List of Supported JavaScript Functions for your Browser</td></tr>
</table>
</div>
<script type="text/javascript">
var utilurl={
"o1":"utility/removeLineBreaks/",
"o2":"utility/escapeString/",
"o3":"utility/base64Util/",
"o4":"utility/remCommentsFromCode/",
"o5":"utility/generateRandom/",
"o6":"utility/clientInfo/",
"o7":"utility/cssSupport/",
"o8":"utility/jsSupport/"
};
function getToken(){
return parseInt((""+Math.random()).toString().split(".")[1],10).toString(22).toUpperCase()+"_WU";
}
var activateOption=function(opType){
window.top.location=utilurl[opType]+getToken();
//window.open(utilurl[opType]+getToken(),"webutilwin"+opType);
}
</script>
<jsp:include page="utilfiles/mWebFooter.jsp"/>
</body>
</html>