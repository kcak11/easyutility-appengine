<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Get List of Supported JavaScript Functions</title>
<base href="<%=(String)session.getAttribute("WU_BASEURL")%>" />
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
			try{
				if(aObj[i] && (""+aObj[i]).indexOf("function")!=-1){
					secondarybuff.p("<li>"+i+"</li>");
				}
			}catch(e){}
		}
	}
	if(secondarybuff.length==0){
		infobuff.push("<span style=\"font-weight:bold;color:#ff0000;\">Your browser does not expose the internal JavaScript functions.</span>");
	}else{
		infobuff.push(secondarybuff.sort().j(""));
	}
}
infobuff.p("<ul>");
getInfo(window,"List of Supported JavaScript Functions:");
infobuff.p("</ul><br/>");
</script>
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
<div id="utilTitle" style="text-align:center;">List of Supported JavaScript Functions for your Browser</div>
<br/>
<div style="margin:0px auto;font-family:Verdana;height:300px;overflow:auto;width:66%;border:1px solid rgb(242,121,11);" id="infoContainer">
</div>
<script type="text/javascript">
d.elem("infoContainer").innerHTML=infobuff.j("");
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>