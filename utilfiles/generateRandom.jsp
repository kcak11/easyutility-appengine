<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Generate Random String of Different Lengths</title>
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
<div id="utilTitle" style="text-align:center;">Generate Random String of Different Lengths</div>
<form name="utilForm">
<div style="width:820px;margin:0px auto;">
<br/><br/>
<div id="lengthChoices" style="font-family:Verdana;">Select Length for Random String:
<input type="radio" name="rstrlength" value="8" id="r8" checked="checked"/> <label for="r8">8 </label>
<input type="radio" name="rstrlength" value="16" id="r16"/> <label for="r16">16 </label>
<input type="radio" name="rstrlength" value="32" id="r32"/> <label for="r32">32 </label>
<input type="radio" name="rstrlength" value="64" id="r64"/> <label for="r64">64 </label>
<input type="radio" name="rstrlength" value="128" id="r128"/> <label for="r128">128 </label>
<input type="radio" name="rstrlength" value="256" id="r256"/> <label for="r256">256 </label>
</div>
<br/><button type="button" onclick="generateRandomString();">Generate Random String</button> 
<br/><br/><textarea rows="7" cols="99" id="targetElem" readonly="readonly"></textarea>
</div>
</form>
<script type="text/javascript">
function generateRandomString(){
var tElem=document.getElementById("targetElem");
var lChoices=document.getElementById("lengthChoices").getElementsByTagName("input");
var selChoice;
for(var i=0;i<lChoices.length;i++){
if(lChoices[i].type=="radio" && lChoices[i].checked){
selChoice=parseInt(lChoices[i].value,10);
break;
}
}
var rsbuff=[];
while(rsbuff.join("").length<=selChoice){
rsbuff.push(parseInt((""+Math.random()).toString().split(".")[1],10).toString(22).toUpperCase());
}
tElem.value=rsbuff.join("").substring(0,selChoice);
}
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>