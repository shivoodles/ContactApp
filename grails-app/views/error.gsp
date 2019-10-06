<%--<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONArray"%>
<%@page import="net.sf.json.JSON"%>
<%@page import="org.apache.commons.httpclient.methods.GetMethod"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.commons.httpclient.NameValuePair"%>
<%@page import="org.apache.commons.httpclient.methods.PostMethod"%>
<%@page import="org.apache.commons.httpclient.HttpClient"%>
<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Email contacts</title>
</head>
<body>

<%!
String clientscrete = "jwCVn7ota4Fm89_9SD9I9pi9";
String clientId= "1030738338208-btfrme7du2i58vujpv8hqa08atgg5fdp.apps.googleusercontent.com";
List<Map<String,Object>> gmailContactsList = new ArrayList<Map<String,Object>>();
%>
	<%
	// getting user consent code. We will use this code to obtain Autherization code. Ie access code
		String code = request.getParameter("code");
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod(
				"https://accounts.google.com/o/oauth2/token");
		post.addRequestHeader("Host", "accounts.google.com");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		NameValuePair[] data = [
				new NameValuePair("code", code),
				new NameValuePair("client_id",
						clientId),
				new NameValuePair("client_secret",
						clientscrete),
				new NameValuePair("redirect_uri",
						"http://localhost:4444/ContactApp/error"),
				new NameValuePair("grant_type", "authorization_code") ];

		post.setRequestBody(data);
		client.executeMethod(post);
		BufferedReader b = new BufferedReader(new InputStreamReader(
				post.getResponseBodyAsStream()));
		StringBuilder sb = new StringBuilder();
		String str = null;
		while ((str = b.readLine()) != null) {
			sb.append(str);
		}
		JSONObject access_token = new JSONObject(sb.toString());
		try {
			// We will use contact api now to get contacts of google account. We also need to pass access_token with the request
			//so that google server identify it a valid request
			GetMethod get = new GetMethod(
					"https://www.google.com/m8/feeds/contacts/default/full?max-results=200&access_token="
							+ access_token.getString("access_token"));
			client.executeMethod(get);
			b = new BufferedReader(new InputStreamReader(
					get.getResponseBodyAsStream()));
			sb = new StringBuilder();
			str = null;
			while ((str = b.readLine()) != null) {
				sb.append(str);
			}
			// We are now converting xml response into json for easyness
			System.out.println((sb.toString().trim()));
			net.sf.json.xml.XMLSerializer xmlSerializer = new net.sf.json.xml.XMLSerializer();
			JSON json = xmlSerializer.read(sb.toString().trim()
					.replaceFirst("^([\\W]+)<", "<"));
			JSONObject jsonObject = new JSONObject(json.toString());
			JSONArray jsonArray = jsonObject.getJSONArray("entry");
			String tk = access_token.getString("access_token");
			
	%>
	<%
		for (int i = 0; i < jsonArray.length(); i++) {
				try {
					Map<String,Object> contactsDetail = new HashMap<String,Object>();
					//Appending access token with profile image url. Because for image it again verify request.
					String photoUrl = jsonArray.getJSONObject(i)
							.getJSONArray("link").getJSONObject(0)
							.getString("@href")
							+ "?access_token=" + tk;
					String title = jsonArray.getJSONObject(i).getString(
							"title");
					String contactEmail = jsonArray.getJSONObject(i)
							.getJSONObject("gd:email")
							.getString("@address");
					contactsDetail.put("contactEmail", contactEmail);
					contactsDetail.put("title", title);
					contactsDetail.put("photoUrl", photoUrl);
					gmailContactsList.add(contactsDetail);
	%>
	<%
		} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
	
	System.out.println(gmailContactsList.size());
	for(Map<String,Object> map:gmailContactsList){
	%>
	Name : <%=map.get("title").toString() %>
	Email : <%=map.get("contactEmail").toString() %>
	<img alt="" src="<%=map.get("photoUrl").toString() %>">
	<br>
	
	<%
	System.out.println();
	}
	%>
	
	<%
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("errorstatus",
				"unable to get the information.");
	}
%>
</body>
</html>--%>
<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
			</ul>
		</g:else>
	</body>
</html>
