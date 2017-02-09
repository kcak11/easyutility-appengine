<%-- MainWebController --%>

<%
StringBuffer requestURL=(StringBuffer)request.getRequestURL();
String forwardURL="";
if(requestURL!=null){
String[] requestURLParts=requestURL.toString().split("/utility/");
if(requestURLParts!=null && requestURLParts.length>0){
String action=requestURLParts[1].split("/")[0];
forwardURL="utilfiles/"+action+".jsp";
String baseURL="";
	if(requestURL.toString().indexOf("http://easyutility.appspot.com")!=-1){
		baseURL="http://easyutility.appspot.com/";
	}else if(requestURL.toString().indexOf("https://easyutility.appspot.com")!=-1){
		baseURL="https://easyutility.appspot.com/";
	}else{
		baseURL="http://localhost:8080/easyutility/";
	}
session.setAttribute("WU_BASEURL",baseURL);
}
}
%>
<%if(!"".equals(forwardURL)){%>
<jsp:forward page="<%=forwardURL%>" />
<%}else{%>
Server Detected An Invalid Request. Please check the URL & Try Again !!
<%}%>