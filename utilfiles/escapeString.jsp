<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Escape Special Characters in a String</title>
<base href="<%=(String)session.getAttribute("WU_BASEURL")%>" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
<link rel="stylesheet" type="text/css" href="resources/theme/genericstyle.css" />
<script type="text/javascript" src="resources/scripts/generic.js"></script>
<style type="text/css">
label{
font-family:Verdana;
}
textarea{
outline:none;
resize:none;
border:1px solid rgb(242,121,11);
}
</style>
</head>
<body>
<jsp:include page="mWebHeader.jsp"/>
<div id="utilTitle" style="text-align:center;">Escape Special Characters i.e. <span style="font-weight:bold;color:#ff0000;">\ <span style="color:#000000;">,</span> " <span style="color:#000000;">,</span> '</span> in a String</div>
<form name="utilForm">
<div style="width:820px;margin:0px auto;">
<br/><textarea rows="7" cols="99" id="sourceElem" defStr="Please provide source text containing special characters here . . ."></textarea>
<br/><button type="button" onclick="escapeSpecialChars();" title="Note: If the source text already contains escaped characters, they will be escaped again.">Escape Special Characters</button> <span style="font-family:Verdana;font-size:11px;">&nbsp;&nbsp;&nbsp;&nbsp;Select which characters to escape:</span> <input type="checkbox" id="backslash" checked="checked" /> \ <input type="checkbox" id="dquote" checked="checked" /> " <input type="checkbox" id="squote" checked="checked" /> ' 
<br/><textarea rows="7" cols="99" id="targetElem" defStr=" - - - OUTPUT - - - "></textarea>
</div>
</form>
<script type="text/javascript">
EUtils.ui.placeHolder(document.getElementById("sourceElem"));
EUtils.ui.placeHolder(document.getElementById("targetElem"));
</script>
<script type="text/javascript">
var d=document;
d._e=document.getElementById;
function escapeSpecialChars(){
var sElem=document.getElementById("sourceElem");
var tElem=document.getElementById("targetElem");
var sVal=encodeURIComponent(sElem.value);
var r1Val="%5C", r1repVal="%5C%5C";
var r2Val="'", r2repVal="%5C'";
var r3Val="%22", r3repVal="%5C%22";
var r1=new RegExp(r1Val,"g");
var r2=new RegExp(r2Val,"g");
var r3=new RegExp(r3Val,"g");
if(d._e("backslash").checked){
	sVal=sVal.replace(r1,r1repVal);
}
if(d._e("squote").checked){
	sVal=sVal.replace(r2,r2repVal);
}
if(d._e("dquote").checked){
	sVal=sVal.replace(r3,r3repVal);
}
tElem.value=decodeURIComponent(sVal);
}
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>