<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Remove Commented Lines from Code</title>
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
<div id="utilTitle" style="text-align:center;">Remove Commented Lines from Code</div>
<form name="utilForm">
<div style="width:820px;margin:0px auto;">
<br/><textarea rows="7" cols="99" id="sourceElem" defStr="Please enter source code here . . ."></textarea>
<br/><button type="button" onclick="removeLineBreaks();">Remove Comments</button>
<br/><textarea rows="7" cols="99" id="targetElem" defStr=" - - - OUTPUT - - - "></textarea>
</div>
</form>
<script type="text/javascript">
EUtils.ui.placeHolder(document.getElementById("sourceElem"));
EUtils.ui.placeHolder(document.getElementById("targetElem"));
</script>
<script type="text/javascript" src="resources/scripts/remcomments.js"></script>
<script type="text/javascript">
function removeLineBreaks(){
var sElem=document.getElementById("sourceElem");
var tElem=document.getElementById("targetElem");
tElem.value=removeComments(sElem.value);
}
</script>
<jsp:include page="mWebFooter.jsp"/>
</body>
</html>