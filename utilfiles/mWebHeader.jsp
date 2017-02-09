<script type="text/javascript" src="resources/scripts/jq.js"></script>

<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">try{stLight.options({publisher: "040e02b6-e1d5-4962-8e51-3c8c04aa424f"});}catch(e){/*NO_ACTION*/}</script>

<script type="text/javascript">
var switchutilurl={
"o1":"utility/removeLineBreaks/",
"o2":"utility/escapeString/",
"o3":"utility/base64Util/",
"o4":"utility/remCommentsFromCode/",
"o5":"utility/generateRandom/",
"o6":"utility/clientInfo/",
"o7":"utility/cssSupport/",
"o8":"utility/jsSupport/"
};
var jsBaseURL="";
var lStr=""+window.top.location;
if(lStr.indexOf("http://easyutility.appspot.com")!=-1){
jsBaseURL="http://easyutility.appspot.com/";
}else if(lStr.indexOf("https://easyutility.appspot.com")!=-1){
jsBaseURL="https://easyutility.appspot.com/";
}else{
jsBaseURL="http://localhost:8080/easyutility/";
}
function getSwitchToken(){
return parseInt((""+Math.random()).toString().split(".")[1],10).toString(22).toUpperCase()+"_WU";
}
function _switchUtility(){
var sopType="o"+parseInt(document.getElementById("switchUtility").selectedIndex,10);
if(sopType!=='o0'){
	if(lStr.indexOf(switchutilurl[sopType])!=-1){
		alert("You are currently using this utility. \nPlease select another option to continue.");
	}else{
		window.top.location=jsBaseURL+switchutilurl[sopType]+getSwitchToken();
	}
}
}
</script>

<div id="eutilities_shareThisGadget" style="position:absolute;top:22px;display:none;width:422px;border:none;">
<span class='st_googleplus_large' displayText='Google +'></span>
<span class='st_facebook_large' displayText='Facebook'></span>
<span class='st_twitter_large' displayText='Tweet'></span>
<span class='st_linkedin_large' displayText='LinkedIn'></span>
<span class='st_pinterest_large' displayText='Pinterest'></span>
<span class='st_blogger_large' displayText='Blogger'></span>
<span class='st_delicious_large' displayText='Delicious'></span>
<span class='st_digg_large' displayText='Digg'></span>
<span class='st_email_large' displayText='Email'></span>
<span class='st_sharethis_large' displayText='ShareThis'></span>
<span style="position:absolute;top:45px;left:180px;font-family:Verdana;color:rgb(255,255,255);font-weight:bold;">Powered by <a href="http://ashish-web.appspot.com" target="akweb_win" style="color:rgb(242,121,11);text-decoration:none;border-bottom:2px solid #ff0000;">Ashish's Web</a></span>
	<form name="utilSwitchForm">
		<select id="switchUtility" style="border:2px solid rgb(242,121,11);visibility:hidden;position:absolute;top:80px;left:200px;width:200px;color:rgb(166,0,0);" onchange="_switchUtility();">
			<option selected="selected">&nbsp;&nbsp;--- Switch Utility ---&nbsp;&nbsp;</option>
			<option>Remove Line Breaks</option>
			<option>Escape Special Characters</option>
			<option>Encode / Decode in Base64</option>
			<option>Remove Commented Lines</option>
			<option>Generate Random String</option>
			<option>Client & User-Agent Info</option>
			<option>Supported CSS Styles</option>
			<option>Supported JavaScript Functions </option>
		</select>
	</form>
</div>
<img src="resources/graphics/easyutilitylogo.png" style="position:absolute;z-index:-11;top:0px;left:4px;width:441px;height:264px;" />
<div style="height:180px;">&nbsp;</div>
<script type="text/javascript">
var d=document;
d._e=document.getElementById;

var resetDropDown=function(){
setTimeout(function(){
d._e("switchUtility").style.visibility="visible";
d._e("switchUtility").selectedIndex=0;
},1500);
};
resetDropDown();

var eutilsharer=d._e("eutilities_shareThisGadget");
eutilsharer.style.display="block";
function adjustPositions(){
var lPos=$(window).width()-430;
if(lPos<370){
eutilsharer.style.left=372+"px";
}else{
eutilsharer.style.left=lPos+"px";
}
}
adjustPositions();
if(navigator.userAgent.indexOf("MSIE")==-1){
	window.addEventListener("resize",adjustPositions,false);
}else{
	window.attachEvent("onresize",adjustPositions);
}
</script>
