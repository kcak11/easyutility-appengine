<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Encode / Decode Text in Base64 Format</title>
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
<div id="utilTitle" style="text-align:center;">Encode / Decode Text in Base64 Format</div>
<form name="utilForm">
<div style="width:820px;margin:0px auto;">
<br/><textarea rows="7" cols="99" id="sourceElem" defStr="Please provide source text here . . ."></textarea>
<br/><button type="button" onclick="b64Operation('1');" >Encode Text to Base64</button> <button type="button" onclick="b64Operation('2');" >Decode Text from Base64</button> 
<br/><textarea rows="7" cols="99" id="targetElem" defStr=" - - - OUTPUT - - - "></textarea>
</div>
</form>
<script type="text/javascript">
EUtils.ui.placeHolder(document.getElementById("sourceElem"));
EUtils.ui.placeHolder(document.getElementById("targetElem"));
</script>
<script type="text/javascript" src="resources/scripts/b64util.js"></script>
<script type="text/javascript">
var d=document;
d._e=document.getElementById;
function b64Operation(opType){
var sElem=d._e("sourceElem");
var tElem=d._e("targetElem");
var sVal=sElem.value;
if(opType==='1'){
try{tElem.value=base64.encode(sVal);}catch(e){alert(e);}
}else if(opType==='2'){
try{tElem.value=base64.decode(sVal);}catch(e){alert(e);}
}
}
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>