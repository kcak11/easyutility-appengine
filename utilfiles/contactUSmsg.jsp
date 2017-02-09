<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl,net.tanesha.recaptcha.ReCaptchaResponse,java.io.IOException,
java.util.Properties,
javax.mail.Message,
javax.mail.Session,
javax.mail.Transport,
javax.mail.Multipart,
javax.mail.internet.MimeBodyPart,
javax.mail.internet.MimeMultipart,
javax.mail.internet.InternetAddress,
javax.mail.internet.MimeMessage,
javax.servlet.ServletException,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse"%>
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
</style>
<script type="text/javascript">
document.oncontextmenu=function(e){return false;};
window.onbeforeunload=function(){};
</script>
</head>
<%!
private boolean submitDataToServer(HttpServletRequest request){
String emailentry = request.getParameter("emailentry");
String msgentry = request.getParameter("msgentry");
if(emailentry==null || msgentry==null || emailentry.length()>100 || msgentry.length()>500){
return false;
}
Properties props = new Properties();
Session ses = Session.getDefaultInstance(props, null);
String msgBody = "<hr/>Email:<br/><span style=\"color:#ff0000;\">"+emailentry+"</span><br/>Message:<br/><span style=\"color:#ff0000;\">"+msgentry+"</span><hr/>";
	try {
		Message msg = new MimeMessage(ses);
		Multipart mp=new MimeMultipart();
		msg.setFrom(new InternetAddress("kcak121@gmail.com","EasyUtility-Mailer"));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress("admins"));
		msg.setSubject("EasyUtility-Mailer "+emailentry);
		MimeBodyPart htmlPart=new MimeBodyPart();
		htmlPart.setContent(msgBody,"text/html");
		mp.addBodyPart(htmlPart);
		msg.setContent(mp);
		Transport.send(msg);
		return true;
	} catch (Exception e) {
		return false;
	}
}
private void saveFormData(HttpServletRequest request,HttpSession session){
	session.setAttribute("emailentry",request.getParameter("emailentry"));
	session.setAttribute("msgentry",request.getParameter("msgentry"));
}
%>
<body>
<img src="resources/graphics/easyutilitylogo_small.png" style="position:absolute;top:0px;left:4px;width:242px;height:145px;" />
<div style="height:150px;">&nbsp;</div>
 <%
        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6Lc0xdsSAAAAAHtqmsmG_Q03MJTDZqjFX8y_TKHN");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
          if(submitDataToServer(request)){
			out.println("<div align=\"center\">Your feedback / suggestion has been recorded successfully. <br/><br/><img src=\"resources/graphics/close.png\" border=\"0\" style=\"width:50px;height:24px;cursor:pointer;\" onclick=\"window.close();\" /></div>");
			out.println("<script type=\"text/javascript\">setTimeout(function(){window.close();},8000);</script>");
		  }else{
			saveFormData(request,session);
			out.println("<div align=\"center\">There was an error processing your request. <br/><br/><a href=\"utility/contactUS\"><img src=\"resources/graphics/pta.png\" border=\"0\" style=\"width:105px;height:24px;\" /></a></div>");
		  }
        } else {
			saveFormData(request,session);
			out.print("<div align=\"center\">The words you entered for Captcha are not valid. <br/><br/><a href=\"utility/contactUS\"><img src=\"resources/graphics/pta.png\" border=\"0\" style=\"width:105px;height:24px;\" /></a></div>");
        }
%>

<script type="text/javascript">
//window.onresize=function(e){window.resizeTo(800,560);};
</script>
</body>
</html>