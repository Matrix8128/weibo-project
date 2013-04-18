package test;

import weibo4j.Friendships;
import weibo4j.examples.oauth2.Log;
import weibo4j.model.WeiboException;

public class MyGetFriends {


	public static void main(String[] args) {
		String access_token = "2.00N8EaxB08LsGa4ebcc4e9ac0YYqxw";
		String uid = "1796533527";
		Friendships fm = new Friendships();
		fm.client.setToken(access_token);
		try {
			String[] ids = fm.getFriendsIdsByUid(uid);
			for(String s : ids){
				Log.logInfo(s);
			}
		} catch (WeiboException e) {
			e.printStackTrace();
		}

	}

}
