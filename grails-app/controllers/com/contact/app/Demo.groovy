package com.contact.app;

//import net.sf.json.JSON;
//import net.sf.json.xml.XMLSerializer;
//import org.apache.commons.httpclient.HttpClient;
//import org.apache.commons.httpclient.NameValuePair;
//import org.apache.commons.httpclient.methods.GetMethod;
//import org.apache.commons.httpclient.methods.PostMethod;
//import org.grails.web.json.JSONArray;
//import org.grails.web.json.JSONException;
//import org.grails.web.json.JSONObject;


class Demo {

    List<Map<String, Object>> gmailContactsList = new ArrayList<Map<String, Object>>();
    String clientscrete = "jwCVn7ota4Fm89_9SD9I9pi9";
    String clientId = "1030738338208-btfrme7du2i58vujpv8hqa08atgg5fdp.apps.googleusercontent.com";
    String code = "4/rgEi_2dPWX20eiZlcTI7eo0WydbByBlbacuQL7cn1jFsoqMaTx6blRG4XaaoWq0iK8brcfzeRnwfo6vmoH75Anw";
    String redirectUri = "http://localhost:4444/error";
    String grantType = "authorization_code";
    String getUri = "https://www.google.com/m8/feeds/contacts/default/full?max-results=200&access_token=";
    public  Map<String, Object> map ;
    public  Map<String, String> mapx ;


//    public demo() throws IOException, JSONException {
//
//        HttpClient client = new HttpClient();
//        PostMethod post = new PostMethod("https://accounts.google.com/o/oauth2/token");
//        post.addRequestHeader("Host", "accounts.google.com");
//        post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//        NameValuePair[] data = [
//                new NameValuePair("code", code),
//                new NameValuePair("client_id", clientId),
//                new NameValuePair("client_secret", clientscrete),
//                new NameValuePair("redirect_uri", redirectUri),
//                new NameValuePair("grant_type", grantType)];
//
//        post.setRequestBody(data);
//        client.executeMethod(post);
//        BufferedReader b = new BufferedReader(new InputStreamReader(
//                post.getResponseBodyAsStream()));
//        StringBuilder sb = new StringBuilder();
//        String str = null;
//        while ((str = b.readLine()) != null) {
//            sb.append(str);
//        }
//        JSONObject access_token = new JSONObject(sb.toString());
//        try {
//            GetMethod get = new GetMethod(getUri + access_token.getString("access_token"));
//            client.executeMethod(get);
//            b = new BufferedReader(new InputStreamReader(
//                    get.getResponseBodyAsStream()));
//            sb = new StringBuilder();
//            str = null;
//            while ((str = b.readLine()) != null) {
//                sb.append(str);
//            }
//            XMLSerializer xmlSerializer = new XMLSerializer();
//            JSON json = xmlSerializer.read(sb.toString().trim()
//                    .replaceFirst("^([\\W]+)<", "<"));
//            JSONObject jsonObject = new JSONObject(json.toString());
//            JSONArray jsonArray = jsonObject.getJSONArray("entry");
//
//            for (int i = 0; i < jsonArray.length(); i++) {
//                try {
//                    Map<String, Object> contactsDetail = new HashMap<>();
//                    String title = jsonArray.getJSONObject(i).getString(
//                            "title");
//                    String contactEmail = jsonArray.getJSONObject(i)
//                            .getJSONObject("gd:email")
//                            .getString("@address");
//                    contactsDetail.put("contactEmail", contactEmail);
//                    contactsDetail.put("title", title);
//                    gmailContactsList.add(contactsDetail);
//                } catch (Exception ex) {
//                    ex.printStackTrace();
//                }
//            }
//
//            System.out.println(gmailContactsList.size());
//            for ( map in gmailContactsList) {
//                map.get("title").toString();
//                map.get("contactEmail").toString();
//                System.out.println(map);
//            /*    mapx.put("title", map.get("title").toString());
//                mapx.put("contactEmail",map.get("contactEmail").toString())*/
//            }
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    return gmailContactsList;
//    }

}
