<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Remove Line Breaks from Source Text</title>
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
<div id="utilTitle" style="text-align:center;">Remove Line Breaks from Source Text</div>
<form name="utilForm">
<div style="width:820px;margin:0px auto;">
<br/><textarea rows="7" cols="99" id="sourceElem" defStr="Please provide source text with line-breaks here . . ."></textarea>
<br/><button type="button" onclick="removeLineBreaks();">Remove LineBreaks</button> <input type="radio" name="linebrktype" value="ALL" id="all"/> <label for="all">All Line Breaks</label> <input type="radio" name="linebrktype" value="DOUBLE" id="double" checked="checked" /> <label for="double">Multiple Line Breaks</label>
<br/><textarea rows="7" cols="99" id="targetElem" defStr=" - - - OUTPUT - - - "></textarea>
</div>
</form>
<script type="text/javascript">
EUtils.ui.placeHolder(document.getElementById("sourceElem"));
EUtils.ui.placeHolder(document.getElementById("targetElem"));
</script>
<script type="text/javascript">
function removeLineBreaks(){
var sElem=document.getElementById("sourceElem");
var tElem=document.getElementById("targetElem");
var sVal=encodeURIComponent(sElem.value);
var r1Val="%0D";
var r2Val="%0A";
var r3Val="%20%0A";
var r4Val="%0A%20";
var r5Val="%09%0A";
var r6Val="%0A%09";
var repVal="";
var r1=new RegExp(r1Val,"g");
sVal=sVal.replace(r1,r2Val);
if(document.getElementById("double").checked){
	if(confirm("REMOVE MULTIPLE LINEBREAKS\n\nExtra blank spaces and Tab characters will also be removed along with line-breaks.\n\nAre you sure ?")){
	var r3=new RegExp(r3Val,"g");
	var r4=new RegExp(r4Val,"g");
	var r5=new RegExp(r5Val,"g");
	var r6=new RegExp(r6Val,"g");
	while(sVal.indexOf(r3Val)!=-1){
		sVal=sVal.replace(r3,"%0A");
	}
	while(sVal.indexOf(r4Val)!=-1){
		sVal=sVal.replace(r4,"%0A");
	}
	while(sVal.indexOf(r5Val)!=-1){
		sVal=sVal.replace(r5,"%0A");
	}
	while(sVal.indexOf(r6Val)!=-1){
		sVal=sVal.replace(r6,"%0A");
	}
	r2Val+=r2Val;
	repVal="%0A";
	}else{
	return -1;
	}
}
var r2=new RegExp(r2Val,"g");
while(sVal.indexOf(r2Val)!=-1){
sVal=sVal.replace(r2,repVal);
}
tElem.value=decodeURIComponent(sVal);
}
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>