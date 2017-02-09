<%@ page import="net.tanesha.recaptcha.ReCaptcha,net.tanesha.recaptcha.ReCaptchaFactory"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Utility - Feedback / Suggestion</title>
<base href="<%=(String)session.getAttribute("WU_BASEURL")%>" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
<style type="text/css">
body{
background-image:url('resources/graphics/bgline_small.png');
background-repeat:repeat-x;
font-family:Verdana;
}
label{
font-family:Verdana;
}
input, textarea{
outline:none;
resize:none;
border:1px solid rgb(242,121,11);
}
.required{
color:#ff0000;
}
</style>
<script type="text/javascript">
document.oncontextmenu=function(e){return false;};
window.onbeforeunload=function(){};
var submitThisForm=function(){
	if(validEntries()){
	document.suggestFeature.submit();
	}
}
var d=document;
d._e=document.getElementById;
var validEntries=function(){
if(d._e("emailentry").value.length==0 || !validateEmail(d._e("emailentry").value)){
d._e("emailentry").style.backgroundColor="rgb(251,196,199)";
alert("Please provide a valid Email Address.");
d._e("emailentry").focus();
return false;
}
if(d._e("msgentry").value.length==0 || d._e("msgentry").value.length>500){
d._e("msgentry").style.backgroundColor="rgb(251,196,199)";
alert("Please specify your message [Max Limit = 500 chars]\nCurrently Entered "+d._e("msgentry").value.length+" chars");
d._e("msgentry").focus();
return false;
}
if(d.suggestFeature.recaptcha_response_field.value.length==0){
alert("Please enter the displayed words in the box above.");
try{d.suggestFeature.recaptcha_response_field.focus();}catch(err){}
return false;
}
return true;
};
function validateEmail(mail){  
	if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)){  
		return true;  
	}  
return false;  
}  
</script>
</head>
<%!
private void loadFormData(HttpSession session,String[] formElements){
	if(session.getAttribute("emailentry")!=null){
	formElements[0]=(String)session.getAttribute("emailentry");
	}
	if(session.getAttribute("msgentry")!=null){
	formElements[1]=(String)session.getAttribute("msgentry");
	}
}
private void clearFormData(HttpSession session){
	session.removeAttribute("emailentry");
	session.removeAttribute("msgentry");
}
%>
<body>
<img src="resources/graphics/easyutilitylogo_small.png" style="position:absolute;top:0px;left:4px;width:242px;height:145px;" />
<div style="height:130px;">&nbsp;</div>
<form name="suggestFeature" action="utility/contactUSmsg" method="POST">
<%
String[] elementData=new String[]{"",""};
loadFormData(session,elementData);
%>
<div style="width:688px;margin:0px auto;">
<table>
<tr><td style="width:200px;" align="right">Email Address <span class="required">*</span>:</td><td><input type="text" style="width:500px;" name="emailentry" id="emailentry" value="<%=elementData[0]%>" maxlength="100" autocorrect="off" autocapitalize="off" autocomplete="off"/></td></tr>
<tr><td></td><td><span style="font-size:11px;position:relative;top:-6px;">[Your email address will be kept private. It will be used for tracking purposes only.]</span></td></tr>
<tr><td valign="top" align="right">Your Message <span class="required">*</span>:</td><td><textarea style="width:500px;" rows="7" cols="65" name="msgentry" id="msgentry"><%=elementData[1]%></textarea></td></tr>
<tr><td></td><td><span id="msg_length" style="position:relative;top:-6px;font-size:11px;">0 chars, remaining 500 chars</span></td></tr>
<tr><td valign="top" align="right">Captcha <span class="required">*</span>:</td><td>
<%
ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Lc0xdsSAAAAAKy2UgAcki7_r_OAnwbX4rnBJiN7", "6Lc0xdsSAAAAAHtqmsmG_Q03MJTDZqjFX8y_TKHN", false);
out.print(c.createRecaptchaHtml(null, null));
%>
</td></tr>
<tr><td></td><td><input type="button" value="Submit your Feedback / Suggestion" style="width:260px;" onclick="submitThisForm();" /></td></tr>
</table>
</div>
</form>
<script type="text/javascript">
var tareaelem=d._e("msgentry");
var charlenchk=function(){
d._e("msg_length").innerHTML=tareaelem.value.length+" chars, remaining "+((500-tareaelem.value.length)>=0?(500-tareaelem.value.length):0)+" chars";
if(tareaelem.value.length>500){
tareaelem.style.backgroundColor="rgb(251,196,199)";
}else{
tareaelem.style.backgroundColor="rgb(255,255,255)";
}
};
charlenchk();
d._e("msgentry").onkeyup=charlenchk;
</script>
<script type="text/javascript">
try{document.getElementById("emailentry").focus();}catch(e){}
//window.onresize=function(e){window.resizeTo(800,560);};
</script>
<%clearFormData(session);%>
</body>
</html>