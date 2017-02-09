<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Get Information about your Browser</title>
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
<div id="utilTitle" style="text-align:center;">Retrieve Client & User Agent Information</div>
<br/>
<div style="margin:0px auto;font-family:Verdana;height:300px;overflow:auto;width:66%;border:1px solid rgb(242,121,11);" id="infoContainer">
</div>
<script type="text/javascript">
var infobuff=[];
var d=document;
d.elem=d.getElementById;

function getInfo(aObj,aObjTitle){
var tmp;
infobuff.p("<hr/>"+aObjTitle+"<hr/>");
	for(var i in aObj){
		if(i!="userAgent" && i!="infobuff" && i!="d" && i!="getInfo"){
			try{if(aObj[i]){tmp=""+aObj[i];}else{tmp="N/A";}}catch(e){/*NO_ACTION*/}
			if(tmp.indexOf("[object")!=-1){tmp="INTERNAL_OBJECT";}
			if(tmp.indexOf("function")!=-1 && tmp.indexOf("native code")!=-1){tmp="{FUNCTION}";}
			infobuff.p("<li>"+i+": "+tmp+"</li>");
		}
	}
}

infobuff.p=infobuff.push;infobuff.j=infobuff.join;
infobuff.p("<ul>");
infobuff.p("<li>User-Agent: "+navigator.userAgent+"</li>");
getInfo(navigator,"Navigator Object:");
getInfo(window.location," Location Object:");
getInfo(screen," Screen Object:");
//getInfo(window,"Window Object:");
infobuff.p("</ul><br/>");
d.elem("infoContainer").innerHTML=infobuff.j("");
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>