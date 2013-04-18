
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@	page
	import="weibo4j.org.json.*,
				java.util.*,
				java.io.*,
				weibo4j.Friendships,
				weibo4j.Users,
				weibo4j.model.UserWapper,
				weibo4j.model.User,
				weibo4j.model.WeiboException"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>My JSP 'Output.jsp' starting page</title>
</head>
<body>

	<%
		String tomcatCharSet = "ISO-8859-1";
		String pageCharSet = "utf-8";
		String name = new String(request.getParameter("username").getBytes(
				tomcatCharSet), pageCharSet);
		String levels = new String(request.getParameter("levels").getBytes(
				tomcatCharSet), pageCharSet);
		String types = new String(request.getParameter("types").getBytes(
				tomcatCharSet), pageCharSet);
		System.out.println("=========");
		System.out.println(name);
		System.out.println(levels);
		System.out.println(types);

		JSONObject json = new JSONObject();
		json.put("name", name);
		int biFriendNum = 0;
		int uniFriendNum = 0;
		JSONArray biFriendArray = new JSONArray();
		JSONArray uniFriendArray = new JSONArray();

		//String access_token = "2.00N8EaxB08LsGa4ebcc4e9ac0YYqxw";
		String access_token = "2.008w7_4DmapluDdf171919f00qPD39";
		Users um=new Users();
		um.client.setToken(access_token);
	
		Friendships fm = new Friendships();

		fm.client.setToken(access_token);
		//String id = "1796533527";
		
		int incaseNum = 0;
		int MAX = 5000;//防止出错死循环不停地抓
		int count = 50;
		int cursor = 0;
		try {
				User centreUser=um.showUserByScreenName(name);
				json.put("id", centreUser.getId());
				ArrayList biIds=fm.myGetFriendsBilateralIds(centreUser.getId());
				System.out.println(biIds.size());
				System.out.println(biIds.toString());
			while (true) {
				UserWapper users=fm.myGetFriendsByID(centreUser.getId(), count, cursor);
				//UserWapper users = fm.myGetFriendsByScreenName(name, count,cursor);
				for (User u : users.getUsers()) {
					incaseNum++;
					//System.out.println(u.getScreenName()+":"+u.isfollowMe());
					if (biIds.contains(u.getId())) {
						biFriendNum++;
						JSONObject member = new JSONObject();
						member.put("name", u.getScreenName());
						member.put("id", u.getId());
						biFriendArray.put(member);
					} else {
						uniFriendNum++;
						JSONObject member = new JSONObject();
						member.put("name", u.getScreenName());
						member.put("id", u.getId());
						uniFriendArray.put(member);
					}
					// System.out.println(incaseNum+":"+u.getScreenName());
				}
				cursor = (int) users.getNextCursor();
				/*System.out.println(users.getNextCursor());
				System.out.println(users.getPreviousCursor());
				System.out.println(users.getTotalNumber());
				System.out.println(cursor + ":" + users.getNextCursor());*/
				if (cursor == 0 || incaseNum > MAX)
					break;
			}
			json.put("biFriendNum", biFriendNum);
			json.put("uniFriendNum", uniFriendNum);
			json.put("biFriends", biFriendArray);
			json.put("uniFriends", uniFriendArray);
		} catch (WeiboException e) {
			json.put("error",e.getError());
/* 			System.out.println(e.getError());
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
			System.out.println(e.getRequest());
			System.out.println(e.toString()); */
			e.printStackTrace();
		}
		PrintWriter pw = response.getWriter();//用导入java.io.*,或者java.io.PrintWriter否则错误
		pw.print(json.toString());
		System.out.println("json object :" + json.toString());
		pw.close();
	%>
</body>
</html>