#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonInstance {
	
	private static Gson sGson;
	
	private GsonInstance() {
		throw new AssertionError();
	}
	
	public static synchronized Gson get() {
		if (sGson == null) {
			sGson = new GsonBuilder().create();
		}
		return sGson;
	}
}
