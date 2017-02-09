<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Get List of Supported CSS Styles</title>
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
<div style="display:none;" id="helperDiv">&nbsp;</div>
<jsp:include page="mWebHeader.jsp"/>
<div id="utilTitle" style="text-align:center;">List of Supported CSS Styles for your Browser <span style="color:#ff0000;font-size:11px;">( Requires Browser to Expose them. )</span></div>
<br/>
<div style="margin:0px auto;font-family:Verdana;height:300px;overflow:auto;width:66%;border:1px solid rgb(242,121,11);" id="infoContainer">
</div>
<script type="text/javascript">
var infobuff=[];
var secondarybuff=[];
var d=document;
d.elem=d.getElementById;
secondarybuff.p=secondarybuff.push;secondarybuff.j=secondarybuff.join;
infobuff.p=infobuff.push;infobuff.j=infobuff.join;
function getInfo(aObj,aObjTitle){
infobuff.p("<hr/>"+aObjTitle+"<hr/>");
	for(var i in aObj){
		if(i!="userAgent" && i!="0" && i!="infobuff" && i!="secondarybuff" && i!="d" && i!="getInfo"){
			secondarybuff.p("<li>"+i+"</li>");
		}
	}
	infobuff.push(secondarybuff.sort().j(""));
}
setTimeout(function(){
infobuff.p("<ul>");
var t=d.elem("helperDiv").style;
getInfo(t,"List of Supported CSS Styles:");
infobuff.p("</ul><br/>");
d.elem("infoContainer").innerHTML=infobuff.j("");
},500);
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>