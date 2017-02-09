<%-- Generic Footer --%>

<script type="text/javascript">
var suggestNewUtil=function(){
var tempLoc=""+window.top.location;
if(tempLoc.indexOf(".appspot.com")!=-1){
window.open("http://easyutility.appspot.com/utility/contactUS","suggestnewwin","top=40,left=100,width=800,height=560");
}else{
window.open("http://localhost:8080/easyutility/utility/contactUS","suggestnewwin","top=40,left=100,width=800,height=560");
}
};
</script>

<div style="display:none;">
<a href="http://easyutility.appspot.com/utility/jsSupport">Easy Utility - Get List of Supported JavaScript Functions</a>
<a href="http://easyutility.appspot.com/utility/cssSupport">Easy Utility - Get List of Supported CSS Styles</a>
<a href="http://easyutility.appspot.com/utility/clientInfo">Easy Utility - Get Information about your Browser</a>
<a href="http://easyutility.appspot.com/utility/generateRandom">Easy Utility - Generate Random String of Different Lengths</a>
<a href="http://easyutility.appspot.com/utility/remCommentsFromCode">Easy Utility - Remove Commented Lines from Code</a>
<a href="http://easyutility.appspot.com/utility/base64Util">Easy Utility - Encode / Decode Text in Base64 Format</a>
<a href="http://easyutility.appspot.com/utility/escapeString">Easy Utility - Escape Special Characters in a String</a>
<a href="http://easyutility.appspot.com/utility/removeLineBreaks">Easy Utility - Remove Line Breaks from Source Text</a>
<a href="http://easyutility.appspot.com/home">Easy Utility - A Utility Site for Everyone !!</a>
</div>

<div style="display:none;">
<img src="resources/graphics/easyutilitylogo_small.png" />
<img src="resources/graphics/bgline_small.png" />
<img src="resources/graphics/pta.png" />
<img src="resources/graphics/close.png" />
</div>

<div id="newUtilSuggest" onclick="suggestNewUtil();" style="padding:4px;border:2px solid rgb(166,0,0);background-color:rgb(251,210,174);cursor:pointer;color:rgb(166,0,0);font-family:Verdana;width:200px;height:20px;text-align:center;">
Feedback / Suggestion
</div>

<script type="text/javascript">
function adjustPositionNewUtilSuggest(){
var newUtilSuggest=document.getElementById("newUtilSuggest");
newUtilSuggest.style.position="absolute";
var topPos=$(window).height()-50;
if(topPos>590){
newUtilSuggest.style.top=topPos+"px";
}else{
newUtilSuggest.style.top=592+"px";
}
newUtilSuggest.style.left=$(window).width()-230+"px";
}
adjustPositionNewUtilSuggest();
if(navigator.userAgent.indexOf("MSIE")==-1){
	window.addEventListener("resize",adjustPositionNewUtilSuggest,false);
}else{
	window.attachEvent("onresize",adjustPositionNewUtilSuggest);
}

</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-37651027-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<%
String server_signature="";
try{
server_signature=Long.toString(System.currentTimeMillis(), 36)+"_"+Long.toString(Long.parseLong(String.valueOf(Math.random()).replaceAll("\\.","")),36);
}catch(Exception e){
/**/
}
%>
<div style="display:none;" <%="server_signature=\""+server_signature+"_VERIFIED\""%>>
<!--
<br/>Page Generated On: <%=String.valueOf(System.currentTimeMillis())%>
-->
</div>
